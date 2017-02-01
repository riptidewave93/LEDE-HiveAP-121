# LEDE-HiveAP-121

Bringup repo for LEDE on the Aerohive HiveAP-121

Building
-----
#### Build Only
`./build.sh`

#### Modify Configs and Build
`./build.sh modify`

Note that you will need to run a modify on the first compile to select the NAND image in the LEDE menuconfig for this device.

Flashing
-----
  1. Hookup to the Console port (speed 9600) and power on the device and enter the bootloader. Note you may need to enter a password of "administrator", or on newer firmwares, you may need to reach out to Aerohive for the password.
  2. Once in U-Boot, you can boot the tftp image. This is normally done with the following:
  ```
  dhcp;
  setenv serverip 192.168.1.1xx;
  tftpboot 0x81000000 lede-ar71xx-nand-hiveap-121-initramfs-kernel.bin;
  bootm;
  ```
  3. Once booted, wire up to the device directly and navigate to LuCI at 192.168.1.1. Once in LuCI, you can use sysupgrade to flash the firmware to the NAND.

To Do
-----
##### Z1
  * SoC 2.4GHz Wireless
  * TPM Driver Module (needs investigation)

Working
-----
##### Z1
  * Ethernet
  * USB
  * LEDs/Reset
  * I2C Interface (for TPM)
  * PCIe 5.0GHz Wireless
  * Userspace & Sysupgrade
  * NAND/SPI

Notice
------
No promises this won't brick your AP, and no promises that this will even work!
