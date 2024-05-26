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

## Install Actions
   1. Decide on a name for the gameserver. I would suggest forethought on how likely it is you will be using
      multiple sets of the same game. For instance, "Valheim" is one game server you could be using, but in
      my case it is unlikely I will play "Valheim" as anything other than "Valheim", so I would name my server
      based on that. In the case of Minecraft, I may have multiple Minecraft servers running at the same time,
      each based on a "server name", and possibly even having wildly different mods and configurations. For
      this instruction, I will build "whimpercraft", but the same technical details will apply except where
      noted.
   2. It would be good to make sure you hae the "gameserver" template available. To do this, select
      `Dataserver/pve/tank (pve):CT Template`. 
      on the left, then 
   4. In the top right, there is a `Create CT` button. On the window that comes up, I'm using a "CT ID:" of
      500 (or higher, as needed) to keep 
   5. If you don't already have `debian-12-turnkey-gameserver_18.0-1_amd64.tar.gz` in your containers list,
      you can close the pop-up window without harm, nothing will be saved. 
   
## The following steps are optional.
   1. [^1]...

      
## Footnotes:
   [^1]: Example footnote.
