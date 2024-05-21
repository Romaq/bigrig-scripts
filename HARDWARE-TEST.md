Purpose
======

It has been the experience of those hopeful of using "[enterprise](https://www.ablison.com/what-does-enterprise-level-mean/)
level" Open Source Software on a home/ small office budget while using "RAID" technology that the promise of
recovery from a hardware failure is great, but when the hardware actually fails, recovery simply
doesn't work.

If you are considering the [BigRig Scripts](https://github.com/Romaq/bigrig-scripts/) project as a template
for setting up your own home or small office, I strongly suggest you consider testing your equipment for
backup recovery in the event of hardware failure. As my boss once told me, "Spit into one hand and *shhh-ould*
into the other, and see which of your hands fills faster." That zfs drive recovery "should" work simply isn't
good enough. Prove it does.

Initially, I considered incorporating a [simulated hardware failure](https://stackoverflow.com/questions/1361518/how-can-i-simulate-a-failed-disk-during-testing)
to test. Unfortunately, my expertise is not at the level for activating fault injection code into the kernel.
It is also not my intent to recompile the kernel of Proxmox, nor have tools for doing so in place. The PVE
machine needs to be in a state of "as little change as possible to accomplish the purpose" according to my
rules as stated on the [Organization](https://github.com/Romaq/bigrig-scripts/blob/main/ORGANIZATION.md) for this
project: "Don't do *anything* unless it is required to fulfill the mission." That said, I do welcome expertise
on how to simulate drive failure through software of a live PVE machine as directly as possible and *only*
pertaining to the event of a single drive failure in the SATA array.

Instead, and perhaps just as well, is simulating a drive failure by simply "yanking" one of the SATA drives in
the RAIDz array. While it was suggested I do so with the physical PVE host active, I am very reluctant to do
so for several reasons:
1. It was reported to me physically pulling a single "live" drive in the array momentarily shuts down all drives
   in the array. I do not know for certain how zfs will react to that, and if it might consider all the drives
   in the array "dead." If zfs does, I'm in the situation where all drives are lost, which tells me nothing of
   what I'm attempting to know of the event of a single drive failure I *hope* to recover from.
2. I am not a hardware engineer with the technical understanding of how much to "trust" pulling a live drive
   out while powered and active will *NOT* physically harm the drive. At the risk of being accused a coward, I
   am simply unable to afford replacing the hard drive should pulling it "live" cause harm. While I am assured
   by others that it is "highly unlikely" to cause damage to the hardware, the cost of the "highly unlikely"
   happening is way beyond my budget. Cowardly or not, I reject the risk unless somebody *ELSE* is willing to
   foot the bill of what is, to me, a high-stakes odds game.

While considering my options, [Kingneutron](https://forum.proxmox.com/members/kingneutron.223146/) made the
following [suggestion](https://forum.proxmox.com/threads/zfs-advice.147358/#post-665953) The advice approaches
the perspective of taking the drive offline while the machine is running. Since I'm going to power the machine
down anyway to pull the physical drive from the USB Bay SATA array, I'm going to simply power down the PVE
host, pull either "/dev/sdb" or "/dev/sdd", power the PVE host back up, and see what it does. The SATA Array
hardware does not provide a means to determine the logical order of the array, so by pulling "in the middle
but definitely *not* the center," I hope to confirm what is, at the moment, only a guess as to the logical
orientation. I'm expecting the SATA array to function under ZFS, that it will report a drive "missing", and
I'm expecting (given my current set-up) it will email me the hardware failure. I will then confirm writing
a sizable block of an image to the degraded array, and then confirm the recovery steps Kingneutron suggests
while confirming zfs instructs me to do the same, and that the recovery steps work. I will also verify the
large image written to the drive in the degraded mode functions as expected.
