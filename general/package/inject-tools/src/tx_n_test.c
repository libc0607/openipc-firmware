// tx_n_test: inject 802.11n frame with custom string to air
// Github @libc0607
//
// Usage: ./tx_n_test  \
//			<iface with monitor mode enabled> 
// 		<bw:20/40> \
// 		<sgi:0/1> \
//			<ldpc:0/1> \
//			<mcsindex:0-15> \
//			<loop> \
//			<delay:us> \
//			<payload_string_less_than_1k_bytes> 
//


#include <arpa/inet.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <net/if.h>
#include <netinet/ether.h>
#include <netpacket/packet.h>
#include <poll.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

static const uint8_t framedata_rtheader_80211n[] = {
	0x00, 0x00, 
	0x0D, 0x00, 	// length
	0x00, 0x80, 0x08, 0x00,	// present flag 00000000 00001000 10000000 00000000
	0x00, 0x00, 
	0x17, 			// known: stbc[5], fec[4], gi[2], mcs[1], bw[0] -- 8'b0011_0111
	0x10,			// flags: stbc[6:5], fec[4], gi[2], bw[0]
	0x00,			// mcs index
};

static const uint8_t framedata_ieeeheader_data[] = {
        0x08, 0x02, 0x00, 0x00, // frame control field (2 bytes), duration (2 bytes)
        0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x13, 0x22, 0x33, 0x44, 0x55, 0x66, // mac
        0x13, 0x22, 0x33, 0x44, 0x55, 0x66, // mac
        0x00, 0x00 // IEEE802.11 seqnum
};

int open_sock (char *ifname) 
{
    struct sockaddr_ll ll_addr;
    struct ifreq ifr;
		int sock;
	
    sock = socket (AF_PACKET, SOCK_RAW, 0);
    if (sock == -1) {
				fprintf(stderr, "Error: Socket failed\n");
				exit(1);
    }
    
    ll_addr.sll_family = AF_PACKET;
    ll_addr.sll_protocol = 0;
    ll_addr.sll_halen = ETH_ALEN;
    strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
    if (ioctl(sock, SIOCGIFINDEX, &ifr) < 0) {
				fprintf(stderr, "Error: ioctl(SIOCGIFINDEX) failed\n");
				exit(1);
    }

    ll_addr.sll_ifindex = ifr.ifr_ifindex;
				if (ioctl(sock, SIOCGIFHWADDR, &ifr) < 0) {
				fprintf(stderr, "Error: ioctl(SIOCGIFHWADDR) failed\n");
				exit(1);
    }
    
    memcpy(ll_addr.sll_addr, ifr.ifr_hwaddr.sa_data, ETH_ALEN);
    if (bind (sock, (struct sockaddr *)&ll_addr, sizeof(ll_addr)) == -1) {
				fprintf(stderr, "Error: bind failed\n");
				close(sock);
				exit(1);
    }
    
    if (sock == -1 ) {
        fprintf(stderr, "Error: Cannot open socket, must run as root with an 802.11 card with monitor mode enabled\n");
        exit(1);
    }
    return sock;
}

void usage() 
{
	printf(
		"Usage: \n"
		"\ttx_n_test <wlan0> <bw:0-20/1-40> <sgi:0-long/1-short> <ldpc:0-bcc/1-ldpc> <stbc_streams[1:0]> <mcsindex:[7:0]> <loop_cnt> <delay:us> <payload_string> \n"
	);
}

int main (int argc, char *argv[]) 
{
	//		tx_n_test	<wlan0>	<bw:20/40>		<sgi:0/1>	<ldpc:0/1>		<stbc_streams>		<mcsindex:0-15>	<loop_cnt>		<delay:us>		<payload_string>
	//		0					1				2 						3	 				4						5								6								7						8						9
	uint8_t * rt_header, ieee_header, payload;
	int rt_length, ieee_length, payload_length, total_length, len_ret, i;
	uint8_t framedata_buf[4096];
	int sockfd;
	
	if (argc == 1) {
		usage();
		exit(0);
	}
	
	// open wi-fi iface
	sockfd = open_sock(argv[1]);
	usleep(20000);

	// debug output
	fprintf(stderr, "%s Init complete\n", argv[1]);
	fprintf(stderr, "tx_n_test, send 802.11n data on %s, bw %s, sgi %s, ldpc %s, stbc %s, mcsindex %s, loop %s times, delay %s us", 
																						argv[1], argv[2], argv[3], argv[4], argv[5], argv[6],   argv[7],        argv[8]);
	
	// init memory
	bzero(framedata_buf, sizeof(framedata_buf));
	total_length = 0;
	
	// copy radiotap header to buf
	memcpy(framedata_buf, framedata_rtheader_80211n, sizeof(framedata_rtheader_80211n));
	// 	mcs
	framedata_buf[12] = (uint8_t)(atoi(argv[6]));		
	// flags
	framedata_buf[11] = 0x00;
	framedata_buf[11] |= ((uint8_t)(atoi(argv[2])) & 0x01);						// bw
	framedata_buf[11] |= (((uint8_t)(atoi(argv[3])) & 0x01) << 2);		// gi
	framedata_buf[11] |= (((uint8_t)(atoi(argv[4])) & 0x01) << 4);		// ldpc
	framedata_buf[11] |= (((uint8_t)(atoi(argv[5])) & 0x03) << 5);		// stbc
	total_length += sizeof(framedata_rtheader_80211n);
	
	// copy ieee header to buf
	memcpy(framedata_buf+total_length, framedata_ieeeheader_data, sizeof(framedata_ieeeheader_data));
	total_length += sizeof(framedata_ieeeheader_data);
	
	// copy custom payload to buf
	strcpy(framedata_buf+total_length, argv[9]);
	total_length += strlen(argv[9]);


	for (i=0; i<atoi(argv[7]); i++) {
		len_ret = write(sockfd, &framedata_buf, total_length);
		if (len_ret < 0) {
			fprintf(stderr, "inject failed.\n");	
			break;
		}
		fprintf(stderr, "%d\tpackets sent...\r", i);	
		usleep(atoi(argv[8]));
	}
	
	usleep(10000); 
	fprintf(stderr, "end\n");
	close(sockfd);
	return EXIT_SUCCESS;
}

