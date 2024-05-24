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
   This is through the PVE Web, Datacenter/pve:firewall/options, select "Firewall" on the right-side panel and
   the "edit" button above that. Select the "Firewall" checkbox on the pop-up and "ok" if the firewall is not already
   activated.
   3. Lock down SSH for "admin" access only.
      You should always be able to use the `_ Shell` button for the PVE host if it is online, but as an alternate especially
      for SCP/SFTP, we will lock down root access for "keys only." Using the `_ Shell` option, edit
      `/etc/pve/priv/authorized_keys` with SSH keys permitted to access the host root. If there is a key already there, it
      would be prudent to comment it out.
   4. Edit `/etc/ssh/sshd_config` to replace `#PasswordAuthentication yes` with `PasswordAuthentication no`.
   5. `systemctl restart ssh` to reload the new configuration.
   6. The server will require updates, so follow this next [howto](https://www.virtualizationhowto.com/2022/08/proxmox-update-no-subscription-repository-configuration/). There are both CLI and GUI instructions, choose which you find most comfortable.
   7. If you prefer CLI, you should already know to do `apt update && apt upgrade`. Otherwise, there is a `Updates` button
      just above the `Repositories` section you were just working in. The `Refresh` button is functionally the same as the
      `apt update` command from CLI, and it will show a list of packages to be updated. If you select the `>_ Upgrade`
      button, all will be upgraded. Otherwise, select the specific packages you wish to upgrade and do the same to upgrade
      only that specific packages. It is wise to periodically check this for package updates. It is also wise to reboot
      the PVE host at this point to be sure you are running the updated software from this point forward.
   8.

## Footnotes:
   [^1]: On the decision to create a non-root user, there is a [howto](https://forum.proxmox.com/threads/add-pam-user-to-pve-admin-group.87036/)
   page with instructions. In an environmment where there are multiple users with levels of access to the PVE host,
   it will be critical to establish, document, and follow an appropriate policy. In this particular use case, there is
   only one user with full access. To simplify the install process, user 'root' is presumed.
   [^2]: The [PVE Firewall](https://pve.proxmox.com/wiki/Firewall#_configuration_files) has
   hard-coded exceptions: "WebGUI(8006) and ssh(22) from your local network."