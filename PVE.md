Outline of build for the PVE host
======

## Build Goal (Working Rules)
   1. The purpose of this machine is as follows:
      * Provide control of the working hardware including a SDD "root" drive for small but fast applications
      * Provide control of a slower but much larger SATA array for long-term storage or file sharing among the clients
        of the network
      * Provide the hypervisor control over LXC and VM machines
      * Does *not* provide file services managed by an "fileserver" LTK appliance.
      * Does *not* provide user, host or client identity services such as DNS or Certificate authority such as [Let's
        Encrypt](https://letsencrypt.org).
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal.

## Install Actions
   1. Remove any drives other than the boot drive to ensure the install only pertains to the boot and root filesystem.
      Note: It is quite possible to create a ZFS "drive" that spans both the SSD and the SATA Array as a single drive.
      You *do not want* that.
   2. By having the drive install to zfs as root, you will be able to use zfs datasets to set quotas for other uses.
   3. On power down to reboot, attach the SATA array, remove the USB ISO Boot Installer, allow the machine to fully
      boot to the new PVE OS.
## Setup of PVE
   1. Follow site policy[^1].  
      In this particular case, there is only one user of the [SOHO](https://dictionary.cambridge.org/dictionary/english/soho)
      network. Replace the 'root' user accordingly. Otherwise the following instructions are to secure the PVE host
      for access *only* by user 'root' and *only* within the LAN, dropping all other network traffic.
   2. Lock down the server with the firewall[^2].  
   This is through the PVE Web, Datacenter:firewall/options, select "Firewall" on the right-side panel and
   the "edit" button above that. Select the "Firewall" checkbox on the pop-up and "ok."

## Footnotes:
   [^1]: On the decision to create a non-root user, there is a [howto](https://forum.proxmox.com/threads/add-pam-user-to-pve-admin-group.87036/)
   page with instructions. In an environmment where there are multiple users with levels of access to the PVE host,
   it will be critical to establish, document, and follow an appropriate policy. In this particular use case, there is
   only one user with full access. To simplify the install process, user 'root' is presumed.
   [^2]: The [PVE Firewall](https://pve.proxmox.com/wiki/Firewall#_configuration_files) has
   a hard-coded exceptions: "WebGUI(8006) and ssh(22) from your local network."
