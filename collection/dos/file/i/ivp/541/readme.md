<h2>DOS malware</h2>

<br>In this folder you will find the following types of malware:

* **Boot viruses**
These viruses replaced the boot program on the floppy disks and hard drives, infecting the very storage medium itself. There will be samples of different kinds here. Most commonly, there will be boot sector or master boot record samples. These are usually 512 bytes long, but may be longer if more sectors are used for the virus. But there will also be some full floppy images in raw (.bin) or teledisk (.td0) formats. There will also be dropper executables - some viruses come with "installers" designed to write them to diskette.

* **File infectors**
These viruses injected themselves into legitimate programs, or otherwise manipulated the operating system into getting executed as part of regular program execution. Most of these will either be DOS COM (.vom) or DOS EXE (.vxe) files. Note that many of these viruses will be attached to "goat" files. These are dummy executables that basically do nothing, they are designed only to get infected by viruses. The ones I made usually contain the statement *"This is a X byte COM/EXE goat. Snorre Fagerland 199x. FILE END"*

* **Multipartite viruses**
These viruses used a combination of the above (both boot and file infection). In these cases, the boot instance of the virus will be found in the boot folder, and file instance in the file folders.

<br><br>

<img src="https://github.com/user-attachments/assets/4fa051cc-80a0-413a-925c-d9c48c303175" width=50% height=50%>

