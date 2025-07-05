# Minimal Embedded Linux for STM32MP1 using Yocto (CLI-only)

This repository contains a minimal embedded Linux setup using Yocto for STM32MP1-based boards, with no graphical interface and no extra packages. The focus is on building a clean, CLI-only OS image using BusyBox, ideal for low-resource or headless embedded systems.

The `setup.sh` script walks through all the necessary steps to prepare your environment, install required packages, and sync the relevant Yocto layers using STMicroelectronics' kirkstone-based manifest. Once the environment is sourced, you can run `bitbake core-image-minimal` to build your custom image.

The `local.conf` file has been adjusted to strip out any GUI dependencies like X11, Wayland, and OpenGL, and only includes basic packages like `packagegroup-core-boot` and `busybox`. This results in a very lightweight root filesystem suitable for CLI-only workflows. A `.gitignore` is included to avoid committing bulky build outputs, caches, and downloads.

This setup is ideal for embedded developers working on STM32MP1 platforms who want full control over the system and prefer starting from a bare minimum. It is also a good starting point for anyone experimenting with Yocto for the first time, without the distraction of graphical layers or desktop packages.

To use this project, clone the repo, run `bash setup.sh`, then source the build environment using the provided `envsetup.sh` script. After that, build the image using BitBake. The result will be a minimal bootable Linux image ready for flashing onto your STM32MP1 development board.

This project is still a work in progress. Future additions may include SSH support, automatic systemd service configuration, and a script for easier SD card image flashing.

