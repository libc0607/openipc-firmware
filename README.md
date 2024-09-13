This is my fork & playground.   

Currently, it's used as an auto builder (by utilizing GitHub Actions) for some custom board configs. Pull requests welcome. Feel free to open an issue to report any bugs.  

See [the release page](https://github.com/libc0607/openipc-firmware/releases/tag/latest) for downloading the auto-built firmware.  

The changes of this branch are: 
 - build.yml, only build firmware for not officially supported configs in popular FPV combinations (Save energy. ![The Girl: How dare you.gif])
 - Custom board configs
 - Replaced kernel source link for 3516/7205, as most of the Realtek drivers need WIRELESS_EXT enabled in kernel source code
 - Using my Wi-Fi driver packages for FPV (experimental changes warning). Currently including [RTL8731BU/RTL8733BU](https://github.com/libc0607/rtl8733bu-20230626), [RTL8812CU/RTL8822CU](https://github.com/libc0607/rtl88x2cu-20230728), [RTL8188FU/RTL8188FTV)](https://github.com/libc0607/rtl8188fu-20230217)(2.4G only) ,and [RTL8192EU](https://github.com/libc0607/rtl8192eu-20220929)(2.4G only).  
 - 5/10/20/40/80 MHz bandwidth support; 5MHz supported by 8188fu, 8733bu & 8812cu, 10MHz supported by 8812eu, 8733bu, 8188fu & 8812cu, 40MHz uses HT40- (default in some Android App's driver). 80MHz only works on VHT mode so Wi-Fi 5 adapters are required.   

Note 1: ALL HI3516/GK7205 BUILDS NEEDS A 16M-Byte NOR FLASH.  

Note 2: The source code is manually synced with [OpenIPC/firmware](https://github.com/OpenIPC/firmware) so it may not be the latest. Let me know if there are critical changes in mainline -- you can PM me in the Telegram group (OpenIPC FPV Users, @libc0607) or the Chinese QQ group (904031209) so that I can sync the code here.  

Note 3: The firmware on the release page is not tested on any real board. It's auto-built. Use with caution, you know the risks, and I won't be responsible for them.  

备注 4: 你的浏览器应该有翻译功能，我就不写中文了  


|  SoC   | Wi-Fi Adaptor  | Encoder | Link |
|  ----  | ----  | ----  | ----  |
| GK7205V200  	| RTL8812EU/RTL8812AU | venc | [openipc.gk7205v200-nor-venc_8812au_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.gk7205v200-nor-venc_8812au_8812eu.tgz) |
| GK7205V200  	| RTL8733BU | venc | [openipc.gk7205v200-nor-venc_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.gk7205v200-nor-venc_8733bu.tgz) |
| GK7205V300  	| RTL8812EU/RTL8812AU | venc | [openipc.gk7205v300-nor-venc_8812au_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.gk7205v300-nor-venc_8812au_8812eu.tgz) | 
| GK7205V300  	| RTL8733BU | venc | [openipc.gk7205v300-nor-venc_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.gk7205v300-nor-venc_8733bu.tgz) |
| Hi3516EV200  	| RTL8812EU/RTL8812AU | majestic | [openipc.hi3516ev200-nor-fpv_8812au_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3516ev200-nor-fpv_8812au_8812eu.tgz) |
| Hi3516EV200  	| RTL8733BU | majestic | [openipc.hi3516ev200-nor-fpv_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3516ev200-nor-fpv_8733bu.tgz) |
| Hi3516EV300  	| RTL8812EU/RTL8812AU | majestic | [openipc.hi3516ev300-nor-fpv_8812au_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3516ev300-nor-fpv_8812au_8812eu.tgz) |
| Hi3516EV300  	| RTL8733BU | majestic | [openipc.hi3516ev300-nor-fpv_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3516ev300-nor-fpv_8733bu.tgz) |
| Hi3536D(E)V100 	| RTL8812EU/RTL8812AU | vdec | [openipc.hi3536dv100-nor-fpv_8812au_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3536dv100-nor-fpv_8812au_8812eu.tgz) |
| SSC30KQ	| RTL8812EU/RTL8812AU | majestic | [openipc.ssc30kq-nor-fpv_8812au_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc30kq-nor-fpv_8812au_8812eu.tgz) |
| SSC30KQ	| RTL8733BU | majestic | [openipc.ssc30kq-nor-fpv_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc30kq-nor-fpv_8733bu.tgz) |
| SSC30KQ	| RTL8812EU/RTL8812AU | RubyFPV(majestic) | [openipc.ssc30kq-nor-rubyfpv.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc30kq-nor-rubyfpv.tgz) |
| SSC30KQ	| RTL8812EU/RTL8192EU | majestic | [openipc.ssc30kq-nor-fpv_8812eu_8192eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc30kq-nor-fpv_8812eu_8192eu.tgz) |
| SSC30KQ	| RTL8812CU | majestic | [openipc.ssc30kq-nor-fpv_8812cu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc30kq-nor-fpv_8812cu.tgz) |
| SSC338Q	| RTL8812EU/RTL8812AU | majestic | [openipc.ssc338q-nor-fpv_8812au_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc338q-nor-fpv_8812au_8812eu.tgz) |
| SSC338Q	| RTL8733BU/RTL8812AU | majestic | [openipc.ssc338q-nor-fpv_8812au_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc338q-nor-fpv_8812au_8733bu.tgz) | 
| SSC338Q	| RTL8812EU/RTL8192EU | majestic | [openipc.ssc338q-nor-fpv_8812eu_8192eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc338q-nor-fpv_8812eu_8192eu.tgz) |
| SSC338Q	| RTL8812CU | majestic | [openipc.ssc338q-nor-fpv_8812cu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc338q-nor-fpv_8812cu.tgz) |

