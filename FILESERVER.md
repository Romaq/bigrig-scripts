Outline of build for the FILESERVER host
======

## Build Goal (Working Rules)
   1. The purpose of this machine is as follows:
      * Serve files as per [ORGANIZATION.md](https://github.com/Romaq/bigrig-scripts/blob/main/ORGANIZATION.md).
      * Manually maintain a relatively small list of client hosts and client users.
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal.

## Todo
   1. I am amiss in not doing a snapshot of the fileserver host before configuring and verifying the rollback
      process.
   2. I need to set up automated snapshots vs. recovery as part of this build.

## Install Actions
   1. First, create the zfs datasets on PVE as described by the ORGANIZATION page linked above.
      * `zfs create -p tank/filesystem/backup` for host specific backups, including internal game backups.
      * `zfs create -p tank/filesystem/homes` as a "home" folder for client users on the network.
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
   8. Use your browser to connect to the [GUI](http://fileserver:12321).
   9. In the web GUI, select `Networking/NFS Exports`, `Select all` and delete the existing exports unless you are comfortable
      setting up NFS securely. For the purpose of this network, we will be using SMB4 clients all the way for consistant
      behavior and security policy.
   10. The Unix "home" directories for users need to be on the "tank". I recommend using the webmin GUI interface to interact
       with the server, or setting up alternate accounts separate from the accounts and groups mentioned here. Seriously,
       just use webmin at port 12321.
   11. Select `System/Users and Groups`, `Create a new user`, then add yourself. I suggest "new group with the same name as
       user" and a secondary group of "users". Be sure to set the "Home Directory" to `/tank/homes`. Have it set a new group
       with the same name as the user, then add group "users" as a secondary group. Create.
   13. Next, select `Servers/Samba Windows File Sharing`, `Samba Groups`, then add Unix group "users" as Samba group "users".
       Describe them as "Client users on the network."
   14. `Servers/Samba Windows File Sharing`, `Convert Users`, then select from `Only listed users` for the users in your
       network. "Convert Users" to have them added.
   15. `Servers/Samba Windows File Sharing`, `Create File Share`, then select a share name of "Home Directories Share",
       `/tank/home` is the directory to share, "create with permissions: 750", "Create with group: users", 
       
      
      
   
## The following steps are optional.
   1. ...

      
## Footnotes:
   [^1]: Using the PVE GUI interface creates a more complicated directory structure. Using CLI is direct and keeps
   the directory structure on PVE simplified.
