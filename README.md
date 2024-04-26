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

1. Complete the install of Proxmox 8.2 using default settings and obvious settings for
   the machine name and root password.

3. Security first     
  * Confirm SSH is open. Make a user with sudo privilages on the shell and admin privilages in PVE[^1].  
  * lock down the server with the firewall[^2].

3. Ongoing Maintenance  
  * Repositories need to be set for "no subscription" according to the relevant
   [howto](https://www.virtualizationhowto.com/2022/08/proxmox-update-no-subscription-repository-configuration/).
  * The system will need an `apt-get update && apt-get upgrade` command, of course.
  * A local "git" repository needs made for this documentation as well as the scripts
   for performing further setup to simplify fresh installations.
  * gpg is already installed, I just need to add my private key and configure according
   to another [howto](https://aalonso.dev/blog/2022/how-to-generate-gpg-keys-sign-commits-and-export-keys-to-another-machine).
  * Create the directory for this and other git "projects," clone the script site, and
   change to that directory.
```
mkdir -p ~/projects && cd ~/projects && git clone git@github.com:Romaq/bigrig-scripts.git
cd ~/projects/bigrig-scripts
```

4. Set domain name using https://www.dynu.com (optional if fixed IP)  
  * Run `sudo ./DynuSetup.sh`
  * Answer the following questions for Dynu:
    1. Dynamic DNS service provider: *other*
    2. Dynamic DNS update protocol: *dyndns2*
    3. Dynamic DNS server: *api.dynu.com*
    4. Username: *<your-user-name>*
    5. Password: *<your-password>*
    6. Re-enter password: *<your-password>*
    7. IP address discovery method: *Web-based IP discovery service*[^3]
    8. Hosts to update: *< example.com, www.example.com >*
  * When the script completes, verify an update to https://www.dynu.com/en-US/ControlPanel/DDNS
  * Confirm the update on the Proxmox host using `sudo journalctl -u ddclient`

5. Set up email notifications per https://www.naturalborncoder.com/linux/2023/05/19/setting-up-email-notifications-in-proxmox-using-gmail/

  * Set up and confirm email alerts work through Gmail as a relay. The directions are fine
      as long asyou also set up postfix.
  * Prepare the zfs storage tank.
  * Download .iso files to the storage tank.

# Footnotes
[^1]: Proxmox Virtual Environment, usually but not necessarily the web
page GUI control panel, but may also be a "PVE" command line.
[^2]: The [PVE Firewall](https://pve.proxmox.com/wiki/Firewall#_configuration_files) has
a hard-coded exceptions: "WebGUI(8006) and ssh(22) from your local network."
[^3]: This selection avoids confusing your internal network interface from the external
interface presented to the world.
