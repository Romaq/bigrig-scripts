 Outline of build for the DNS host
======

## Build Goal (Working Rules)
   1. The purpose of this document is as follows:
      * Provide a NAT interface machines can connect to hidden behind PVE.
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal.

## Install Actions
   1. There is a [howto](https://pve.proxmox.com/pve-docs/pve-admin-guide.html#sysadmin_network_configuration) on setting up
      a Masquerading (NAT) with IP Tables.
   2. The recommended path is to use the GUI which helps avoid making mistakes. This would be under Datacenter/ pve | System/ Network. "Create:
      Linux Bridge" ...
   3. Unfortunately, the "admin" manual is big on presuming underestanding and short on instructions. 
   [Setup NAT on Proxmox](https://bobcares.com/blog/setup-nat-on-proxmox/) may provide useful information.
   4. The part where I failed is that I attempted to link to enp2s0. I should have linked to vmbr0. The instructions also provide more clues,
      but not really instructions on how to arrange it. As a for-instance, I have a command to do port-forwarding, but there is no instruction
      on where and how to put that such that it is a natural part of the boot process, happening automatically.
## Footnotes:
   [^1]: ...
