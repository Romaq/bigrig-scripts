Outline of build for the DNS host
======

## Build Goal (Working Rules)
   1. The purpose of this machine is as follows:
      * Provide external and internal identity of the "mik-maq.com" network, which will also be identified locally as
        "BitterGreen" (the wireless name) or "local" (the hostname with .local implied).
      * The external identity will be maintained through [Dynu](https://dynu.com) with a domain certificate maintained
        by [Let's Encrypt](https://letsencrypt.org)
      * Internal "domain" identity will be provided by (Pi-Hole)[https://pi-hole.net] with the added benefit of domain
        ad blocking.
      * Does *not* provide file services managed by a "fileserver" LTK appliance.
      * Does *not* provide user identity. The plan is to maintain this only on the "fileserver" host, then elsewhere
        as required per situation.
   2. Don't do *anything* or make changes if not *explicitly* required by the overall goal.

## Install Actions
   1. ...
       
## Footnotes:
   [^1]: ...
