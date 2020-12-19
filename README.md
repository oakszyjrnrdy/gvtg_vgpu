# gvtg_vgpu

This repo contains systemd files to automatically create and remove gvtg vgpu.

There is a problem that the system cannot suspend if the gvtg_vgpu is on. To deal with this problem, this repo automatically removes the vgpu before suspend or hibernation and recreates the vgpu after waking from suspend or hibernation.

Additionaly, it creates the vgpu after the system is booted.

## Installation

### Package Manager

#### Arch Linux

Install the aur pakage [gvtg_vgpu-git](https://aur.archlinux.org/packages/gvtg_vgpu-git).

#### Others

If you want to package it for other distributions, please let me know. I'll put the information here.

### Manual Installation

1. Move `gvtg_vgpu.service` into `/usr/lib/systemd/system/`
1. Move `gvtg_vgpu.sh` into `/usr/lib/systemd/system-sleep/`.
1. Move `gvtg_vgpu` into `/etc/conf.d/`.
1. Change the value of `gvt_dom`, `gvt_pci`, `gvt_guid` and `gvt_type` in `gvtg_vgpu` file to match your own hardware. See [ArchWiki](https://wiki.archlinux.org/index.php/Intel_GVT-g) for more information.

## Usage

Enable the systemd service by `sudo systemctl enable --now gvtg_vgpu.service`.

## License

GPL2
