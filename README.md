This is my fork & playground.   

Currently, it's used as an auto builder (by utilizing GitHub Actions) for some custom board configs. Pull requests welcome.  
The Github connection s*cks here and the majority cannot build OpenIPC firmware so by doing this the very few developers in China can save time by not being free image builders (but downloaders. XD).
See [the release page](https://github.com/libc0607/openipc-firmware/releases/tag/latest) for downloading the auto-built firmware.  

The changes of this branch are: 
 - build.yml, only build firmware for not officially supported configs in popular FPV combinations (Save energy. ![The Girl: How dare you.gif])
 - Custom board configs
 - Replaced kernel source link for 3516/7205, as 8812eu driver needs WIRELESS_EXT enabled in kernel source code
 - Using my RTL8733BU package (experimental changes warning)

Note 1: ALL HI3516/GK7205 BUILDS NEEDS A 16M-Byte NOR FLASH.  

Note 2: The source code is manually synced with [OpenIPC/firmware](https://github.com/OpenIPC/firmware) so it may not be the latest. Let me know if there are critical changes in mainline -- you can PM me in the Telegram group (OpenIPC FPV Users) or the Chinese QQ group (OpenIPC-FPV开源高清图传交流, 904031209) so that I can sync the code here.  

Note 3: The firmware on the release page is not tested on any real board. It's auto-built. Use with caution, you know the risks, and I won't be responsible for them.  

备注 4: 你的浏览器应该有翻译功能，我就不写中文了  


|  SoC   | Wi-Fi Adaptor  | Encoder | Link |
|  ----  | ----  | ----  | ----  |
| GK7205V200  	| RTL8812EU | venc | [openipc.gk7205v200-nor-fpv_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.gk7205v200-nor-venc_8812eu.tgz) |
| GK7205V200  	| RTL8733BU | venc | [openipc.gk7205v200-nor-fpv_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.gk7205v200-nor-venc_8733bu.tgz) |
| GK7205V300  	| RTL8812EU | venc | [openipc.gk7205v300-nor-fpv_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.gk7205v300-nor-venc_8812eu.tgz) | 
| GK7205V300  	| RTL8733BU | venc | [openipc.gk7205v300-nor-fpv_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.gk7205v300-nor-venc_8733bu.tgz) |
| Hi3516EV200  	| RTL8812EU | majestic | [openipc.hi3516ev200-nor-fpv_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3516ev200-nor-fpv_8812eu.tgz) |
| Hi3516EV200  	| RTL8733BU | majestic | [openipc.hi3516ev200-nor-fpv_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3516ev200-nor-fpv_8733bu.tgz) |
| Hi3516EV300  	| RTL8812EU | majestic | [openipc.hi3516ev300-nor-fpv_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3516ev300-nor-fpv_8812eu.tgz) |
| Hi3516EV300  	| RTL8733BU | majestic | [openipc.hi3516ev300-nor-fpv_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3516ev300-nor-fpv_8733bu.tgz) |
| Hi3536D(E)V100 	| RTL8812EU | vdec | [openipc.hi3536dv100-nor-fpv_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.hi3536dv100-nor-fpv_8812eu.tgz) |
| SSC30KQ	| RTL8812EU | majestic | [openipc.ssc30kq-nor-fpv_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc30kq-nor-fpv_8812eu.tgz) |
| SSC30KQ	| RTL8733BU | majestic | [openipc.ssc30kq-nor-fpv_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc30kq-nor-fpv_8733bu.tgz) |
| SSC338Q	| RTL8812EU | majestic | [openipc.ssc338q-nor-fpv_8812eu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc338q-nor-fpv_8812eu.tgz) |
| SSC338Q	| RTL8733BU/RTL8812AU | majestic | [openipc.ssc338q-nor-fpv_8812au_8733bu.tgz](https://github.com/libc0607/openipc-firmware/releases/download/latest/openipc.ssc338q-nor-fpv_8812au_8733bu.tgz) | 

