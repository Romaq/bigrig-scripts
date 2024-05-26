Outline of build for a generic host
======

## Build Goal (Working Rules)
   1. The purpose of this machine is as follows:
      * Serve files as per [ORGANIZATION.md](../main/ORGANIZATION.md).
      * Provide a given game on the host.
      * Perform game data saves as appropriate.
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal.
   3. Before you begin with this example, see if the game server you wish to use is [supported](https://linuxgsm.com/servers/)!

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
   1. If your router does not perform local DNS, now is a good time to add those into your local domain
      configuration.
   2. With the server running on your screen, you can select the ">_ Console" button to bring up a web
      console terminal. Login with your root and password.
   3. On login, you should enter a password for the `Gameuser` account. It does *not* need to be the same as
      `root`. Twice to confirm a match.
   4. Skip the Turnkey backup API unless you paid for a subscription.
   5. Enter your email for server system messages. It will also register you for TurnkeyLinux security
      allerts, but you can unsubscribe.
   6. Allow security updates to install, and allow it to reboot, of course. Cool fact: If you do not close
      the terminal session, it will warn you that it's closed briefly, then reconnect with a login. If you
      know it's just rebooting, you need not open another terminal window!
   8. After logging back in as `root`, you are prompted with, "For Advanced commandline config run:
      confconsole."
   9. From there, you are provided the connection ports and an option for the "Advanced Menu" to do further
      configuration.
   10. While the logfiles and other system clock functions for the server are driven by the "real" clock on
       pve, and that clock runs on UTC time, you may want to set the "Region config" TZ data. It's possible
       you want the server to think in your "local time" as it applies rather than UTC.
   11. While there are other settings to explore, from the Advanced Menu you may select a particular
       "Game server". Naturally, you can't "Update" the server until you "Select game", so do that.
   12. You get a warning you may be prompted for further information, then continue.
   13. For this example, select Minecraft (Java Edition).
   
## The following steps are optional.
   1. [^1]...

      
## Footnotes:
   [^1]: Example footnote.
