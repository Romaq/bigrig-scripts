Outline of build for the FILESERVER host
======

## Build Goal (Working Rules)
   1. The purpose of this machine is as follows:
      * Serve files as per [ORGANIZATION.md](https://github.com/Romaq/bigrig-scripts/blob/main/ORGANIZATION.md).
      * Manually maintain a relatively small list of client hosts and client users.
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal.

## Install Actions
   1. First, create the zfs datasets on PVE as described by the ORGANIZATION page linked above.
      * `zfs create -p tank/filesystem/backup` for host specific backups, including internal game backups.
      * `zfs create -p tank/filesystem/home` as a "home" folder for client users on the network.
      * `zfs create -p tank/filesystem/shared` for files to be shared amount the network users and/ or host clients.
   2. Download the [fileserver LXC](https://www.turnkeylinux.org/files/tmp/debian-12-turnkey-fileserver_18.0rc2-1_amd64.tar.gz),
      but be aware this link is a Release Candidate at this time courtesy of [JedMeister](https://github.com/JedMeister).
   3. The file downloaded should be moved to /tank/vz/template/cache for use by PVE.
   4. Create the LXC for `filesystem` with the default settings except use 2 cores.
   5. Use the following command to link the created zfs filesystem to the fileserver from the PVE command line[^1]:
      `pct set 101 -mp0 /tank/filesystem,mp=/tank`
   6. Start the server and have a password ready for the "root samba account." This password is *not* the same as the host
      root account!
   7. Enter your email, of course, and note the IP of various services before you close the window. Be sure to add
      `fileserver` as a new host in the `dns` local domain list.
      
      
   
## The following steps are optional.
   1. ...

      
## Footnotes:
   [^1]: Using the PVE GUI interface creates a more complicated directory structure. Using CLI is direct and keeps
   the directory structure on PVE simplified.
