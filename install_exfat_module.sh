#/bin/bash
# This script installs the exFAT filesystem driver on a Linux for Tegra (L4T) 36.4.4 system.

set -e

kernel_version=$(uname -r)
if [ "${kernel_version}" != "5.15.148-tegra" ]; then
    echo "This script is intended for L4T 36.4.4 with kernel version 5.15.148-tegra."
    exit 1
fi

driver_dir="/lib/modules/5.15.148-tegra/kernel/fs"
sudo unzip prebuild/jp62_l4t3644_exfat_module.zip -d "$driver_dir"
sudo depmod -a
echo "exFAT driver installed successfully."