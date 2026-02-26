# MiuiCamera
git clone https://github.com/NothingHere69/vendor_xiaomi_camera vendor/xiaomi/camera 
bash vendor/xiaomi/camera/combine.sh 

# Dolby
git clone https://github.com/NothingHere69/hardware_dolby hardware/dolby 

# Sign Build
git clone https://github.com/Lunaris-AOSP/vendor_lunaris-priv_keys.git vendor/lunaris-priv/keys

# KernelSU
if [ -d "kernel/xiaomi/surya/KernelSU-Next" ] && [ ! -d "kernel/xiaomi/surya/KernelSU-Next/kernel" ]; then
    cd kernel/xiaomi/surya
    git submodule init
    git submodule update --recursive
    rm -rf KernelSU-Next/userspace
    cd ../../..
    echo "KernelSU-Next initialized and updated successfully."
else
    echo "KernelSU-Next directory already initialized or not present. No action required."
fi

