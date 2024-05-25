Outline of build for the DNS host
======

## Build Goal (Working Rules)
   1. The purpose of this machine is as follows:
      * Provide external and internal identity of the "mik-maq.com" network, which will also be identified locally as
        "BitterGreen" (the wireless name) or "local" (the hostname with .local implied).
      * The external identity will be maintained through [Dynu](https://dynu.com).
      * Internal "domain" identity will be provided by [Pi-Hole](https://pi-hole.net) with the added benefit of domain
        ad blocking.
      * Does *not* provide file services managed by a "fileserver" LTK appliance.
      * Does *not* provide a domain certificate, as this is best maintained for and by the webservice open to the
        external world.
      * Does *not* provide user identity. The plan is to maintain this only on the "fileserver" host, then elsewhere
        as required per situation.
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal.

## Install Actions
   1. There is a [howto](https://www.datahoards.com/installing-pi-hole-inside-a-proxmox-lxc-container/) on installing
      Pi-Hole into a Proxmox container. Reference notes follow.
   2. [TKL Core](https://www.turnkeylinux.org/core) is used consistent with other TKL templates.
   3. A name of "DNS" dictates what the machine is and does primarily.
   4. I am using 8 GiB for disk space, 2 Cores, 512 MiB of memory. These values can be changed and updated as required
      as determined by practical use.
   5. Logging in at the console, obvious configuations should be entered as obvious (e.g. your email address).
   6. After the reboot, if other configuration options appear, simply use the defaults or obvious setting changes for
      your site.
   8. `apt update && apt upgrade` would be next. 
   9. The "Postfix Configuration" window will come up. Select "Satellite Configuration", and the "System mail name"
       should be the [FQDN](https://www.hostinger.com/tutorials/fqdn). 
   11. Use the IP for the PVE server as the "SMTP relay host".
   12. 
   13. you should run `confconsole` from the root prompt if it does not load into that on your behalf.
   14. The eth0 server would not need configured at the moment.
   15. Skipping the "Lets encrypt" configuration for now.
   16. Select "Mail relaying" as we want any emergency emails to forward to PVE.
   17. Select "Mail relay", then "Custom", 
   18. Select "Get certificate". You can't renew what you don't have.
      * Select "dns-01"
   19. Select "Cert auto renew" 
      
## Footnotes:
   [^1]: ...
