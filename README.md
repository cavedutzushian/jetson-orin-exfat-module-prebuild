# jetson-orin-exfat-module-prebuild
Prebuilt exFAT filesystem kernel module on Jetson Orin

Built and tested on Jetson AGX Orin Developer Kit (Jetpack 6.2 / L4T 36.4.4)

Currently prebuilt file only for Jetpack 6.2 (L4T 36.4.4)

## How to Install the prebuilt module

1. Clone this repository

    ```bash
    git clone https://github.com/cavedutzushian/jetson-orin-exfat-module-prebuild.git
    ```

2. Run the install script

    This script will copy the prebuilt exFAT kernel module to the `/lib/modules/5.15.148-tegra/kernel/fs/exfat/` directory` and update the module dependencies.

    ```bash
    cd jetson-orin-exfat-module-prebuild
    ./install_exfat_module.sh
    ```

## How to Build your own module

The easiest way to build kernel module for Jetson Orin at this moment(2025/12/02), is to use [jetsonhacks/jetson-orin-kernel-builder](https://github.com/jetsonhacks/jetson-orin-kernel-builder). It integrates kernel source download, setup and build process into scripts.

1. Clone [jetsonhacks/jetson-orin-kernel-builder](https://github.com/jetsonhacks/jetson-orin-kernel-builder) repository

   ```bash
   git clone https://github.com/jetsonhacks/jetson-orin-kernel-builder.git 
   ```

2. Download the kernel source by script

   ```bash
   cd jetson-orin-kernel-builder
   ./scripts/get_kernel_source.sh
   ```

3. Edit kernel configuration to enable exFAT module

   ```bash
   ./scripts/edit_config_cli.sh
   ```

   This command will open an CLI Interface. 
   
   For exFAT support, navigate to `File systems` -> `DOS/FAT/EXFAT/NT Filesystems` -> `exFAT filesystem support` and set it to `<M>` to build as a module. Then save and exit.

   ![img](assets/main_menu.png)
   ![img](assets/fs_menu.png)
   ![img](assets/exfat_fs.png)

4. Build the kernel module

   ```bash
   ./scripts/make_kernel_modules.sh
   ```

   If you just want to build exFAT module for this machine only, you can just installed it directly by following script instruction after build complete.

5. (If needed) Copy the built module

    The build modules can be found in `/usr/src/kernel/kernel-jammy-src/` folder. You can find the exFAT module at: `/usr/src/kernel/kernel-jammy-src/fs/exfat/exfat.ko`