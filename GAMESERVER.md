Outline of build for a generic host
======

## Build Goal (Working Rules)
   1. The purpose of this machine is as follows:
      * Serve files as per [ORGANIZATION.md](../main/ORGANIZATION.md).
      * Provide a given game on the host.
      * Perform game data saves as appropriate.
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal.

## Todo
   1. Have a plan on the firewall.
   2. When the fileserver is online, save the internal game backups.

## Creation Actions
   1. Decide on a name for the gameserver. I would suggest forethought on how likely it is you will be using
      multiple sets of the same game. For instance, "Valheim" is one game server you could be using, but in
      my case it is unlikely I will play "Valheim" as anything other than "Valheim", so I would name my server
      based on that. In the case of Minecraft, I may have multiple Minecraft servers running at the same time,
      each based on a "server name", and possibly even having wildly different mods and configurations. For
      this instruction, I will build "whimpercraft", but the same technical details will apply except where
      noted.
   2. It would be good to make sure you hae the "gameserver" template available. To do this, select
      `Dataserver/pve/tank (pve):CT Templates`. There is a "Templates" button that will list many available
      options. [Turnkey Linux](https://www.turnkeylinux.org) has a website full of details, discussion, and
      notice of updates. Search, select, and download from the window.
   4. In the top right, there is a `Create CT` button. On the window that comes up, I'm using a "CT ID:" of
      500 (or higher, as needed) to keep the gameservers in the same general group order on the left. Select
      the "tank" storage and the gameserver template.
      For "Disk" size, 32 GiB would be plenty of space. You are welcome to decide to raise or lower this
      according to how much disk space you think you will need.
   5. I'm using 12 out of 16 cores so the game will run as smooth as possible. This can be adjusted downwards
      based on your game experience. It is likely wise to leave a few cores left over for other systems even
      if the game server were to pin the CPU so you can regain control.
   6. There is an online [converter](https://www.convertunits.com/from/GiB/to/MiB) handy, and I will convert
      18 GiB to 18432 MiB of memory and 6 GiB (6144 MiB) of swap. And again, your experience with your
      server should inform you to adjust accordingly.
   7. Network, DNS settings I'm using "defaults from what I already do." For this network, I use DHCP.
   8. On the confirm page, look over all the settings to make sure you didn't miss anything and that it looks
      "sane." You can toggle the "Start after created" button to have it going right away.
      
## Completing the install
   1. 
      
   
## The following steps are optional.
   1. [^1]...

      
## Footnotes:
   [^1]: Example footnote.
