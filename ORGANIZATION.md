Outlines of Approaches to System Organization
======

## Organization Goal (Working Rules)
   1. The overall design goal is a stable platform with the given hardware. The attached systems should be as follows:
      * Necessary to support "game servers" and other isolated systems.
      * Necessary to support a "home/office" network.
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal. While a "game server" is not
      necessary, strictly speaking, the subsystems for it to exist, be in a stable and healthy VM environment are.

## Machine Organization
   1. Gateway (plus two bridges)  
      These are part of the mesh network. The Gateway provides DHCP and IPv4, IPv6 LAN addresses. Note: It does *NOT*
      provide DNS, but rather custom (as currently set) IPv4 addresses. The Primary is a local DNS, the Secondary is
      a DNS provided by the external ISP in the event the Primary is unavailable (or doesn't exist yet).
   2. PVE (physical machine)
      This is the Proxmox Virtual Environment hosting all other self-contained systems as either a Linux Container or
      a Virtual Machine. The PVE must be a) Stable to provide hardware resources such as a single SATA Raid device,
      and b) provide and maintain a single external-facing identity, both with [Dynu](https://dynu.com) and
      [Let's Encrypt](letsencrypt.org) certificate identity. All other considerations fall under the "don't do anything
      unless required" policy.
   3. DNS (LXC)
      This DNS appliance provides identity to the entire local network, as "Local DNS" is not supplied by the Gateway
      host. In cases where DNS is supplied by the local gateway or by other means, this machine should of course be
      completely ignored.
   4. Fileserver (LXC)
      This Fileserver appliance provides controlled access to "shared SATA" file storage on PVE. The notion of "fast"
      storage is built into the root file-system of each machine running off PVE's SDD drive. Other appliances such as
      a "Linux Nginx MariaDB PHP" server can simply use network protocols to communicate if needed to other clients
      on the LAN. "Slow SATA" through NFS is adequate for "slow filesystem" sharing.
   5. Other supported systems (LXC and VM systems)
      Gameservers, potential VMWare Windows machines, any other container of interest. It must be isolated so as not
      to potentially harm any other system on the network.

## Fileserver Organization
   1. PVE has direct access to and provides the support of "storage" as defined in "Datacenter-Storage".
      * PVE will store data on the root SSD that benefit from speed, but is *not* consider protected from drive failure:
        - "local" filesystem provides "VZDump backup files" and "Snippets" for speed. To avoid confusion, there is a
           [link to Snippets information](https://forum.proxmox.com/threads/explaining-snippets-feature.53553/). While
           set initially on "local", the "ISO Image" and "(LXC) Container Templates" will be moved to the "/tank" SATA
           system, mentioned later in this outline.
        - "local-zfs" block device provides the "Disk image" and "Container" storage for root filesystems and block
           device backup storage for host snapshot backups managed by PVE.
      * PVE will provide a ZFS pool named "tank" hosting RAIDz protected from single SATA drive failure, and is thus
        suitable (if slow) for "Long Term Storage" prior to rotating backups off-host and/ or off-site. The "tank" is
        also available to each host on the LAN for file sharing as appropriate. Obviously, hosts that do not store
        "long term data" beyond the service they provide need not have access to the "tank." This arrangement is as
        follows:
        - `/tank` is the directory source on PVE providing the ZFS Datasets which can be independently configured by
          ZFS fir quotas and other options as desired.
        - `/tank/iso` is a dataset for 
