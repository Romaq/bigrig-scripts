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
   4. 
