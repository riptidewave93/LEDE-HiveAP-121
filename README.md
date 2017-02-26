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
  1. Hookup to the Console port (speed 9600) and power on the device and enter the bootloader. Note you may need to enter a password of `administrator` or `AhNf?d@ta06` if prompted.
  2. Once in U-Boot, you can boot the initramfs image by hosting it on a local tftp server. You can then boot LEDE with the following:

  ```
  dhcp;
  setenv serverip 192.168.1.1xx;
  tftpboot 0x81000000 lede-ar71xx-nand-hiveap-121-initramfs-kernel.bin;
  bootm;
  ```

  3. Once booted, wire up to the device directly and navigate to LuCI at 192.168.1.1. Once in LuCI, you can use sysupgrade to flash the firmware to the NAND.

TPM Notes
-----
While support for the TPM has been added, at this time the password for the TPM is unknown. If you want to reset the TPM you will need to do this manually by resetting the TPM, reloading the modules, and reviewing https://cryptotronix.com/2014/08/28/compliance_mode/. If you need `tpm_assertpp`, a pre-compiled version can be downloaded [here](https://servernetworktech.com/uploads/files/hiveap-121/tpm_assertpp.zip).

Note that if you do this, the process is irreversible and **YOU WILL NOT BE ABLE TO GO BACK TO STOCK!** This is due to the fact the stock firmware relies on the information stored within the TPM. Because of this, the reset process will **NOT** be documented.

Technical specs of the TPM can be found at:
 * http://www.atmel.com/Images/Atmel-5295S-TPM-AT97SC3204-LPC-Interface-Datasheet-Summary.pdf
 * http://csrc.nist.gov/groups/STM/cmvp/documents/140-1/140sp/140sp2014.pdf

To Do
-----
##### HiveAP-121
  * You tell me?

Working
-----
##### HiveAP-121
  * NAND/SPI
  * Ethernet
  * USB
  * LEDs/Reset
  * I2C Interface (for TPM)
  * SoC 2.4Ghz Wireless
  * PCIe 5.0Ghz Wireless
  * Userspace & Sysupgrade
  * TPM Driver Modules
  * TPM Userspace tools

Notice
------
No promises this won't brick your AP, and no promises that this will even work!
