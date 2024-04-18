bigrig-scripts

A series of BASH scripts for setting up a bare-metal device as a \"large
scale hypervisor\" with Proxmox

# Purpose

The task is to use [Proxmox](https://www.proxmox.com/en/) on a [UM790
Pro](https://store.minisforum.com/collections/all-product/products/minisforum-um790-pro)
with 96GiB of Ram, 1.82 TiB SSD, and a USB bay of five 3.64 TiB SATA
drives. The end result will have scripts to manage the finalized
installation of the OS (Proxmox is Debian based) and the hardware
suitable to providing services with the simulated failure of one SATA
drive to be reconstructed after notification, then register the
reconstruction is complete.

# Milestones

1. Complete the install of Proxmox, including ZFS at the root[^1].
2. Security first
   
  * Confirm SSH is open. Make a user with sudo privilages on the shell and admin privilages in PVE[^2].  
  * lock down the server with the firewall[^3].

3. Ongoing Maintenance

  * Repositories need to be set for "no subscription" according to the relevant
   [howto](https://www.virtualizationhowto.com/2022/08/proxmox-update-no-subscription-repository-configuration/).
  * The system will need an "apt-get update && apt-get upgrade" command, of course.
  * A local "git" repository needs made for this documentation as well as the scripts
   for performing further setup to simplify fresh installations.
  * gpg is already installed, I just need to add my private key and configure according
   to another [howto](https://aalonso.dev/blog/2022/how-to-generate-gpg-keys-sign-commits-and-export-keys-to-another-machine).
  * Create the directory for this and other git "projects," clone the script site, and
   change to that directory.
```
mkdir -p ~/projects && cd ~/projects && git clone git@github.com:Romaq/bigrig-scripts.git && cd bigrig-scripts
cd ~/projects/bigrig-scripts
```

4. Scripting for final setup
   
  * Run the scripts in support of having BigRig ready to begin adding VMs.
  * First script, setup with Dynu.
  * Next, ensure certificates from OpenSSL in place.
  * Set up and confirm email alerts work through Gmail as a relay

# Footnotes
[^1]: ZFS is on the root. The design goal was that the hypervisor and all required parts
would be separate from the SATA array in the event the USB controller failed. Under ZFS,
a "dataset" can be leased to the VMs for speed critical components.
[^2]: Proxmox Virtual Environment, usually but not necessarily the web
page GUI control panel, but may also be a "PVE" command line.
[^3]: The [PVE Firewall](https://pve.proxmox.com/wiki/Firewall#_configuration_files) has
a hard-coded exceptions: "WebGUI(8006) and ssh(22) from your local network."
