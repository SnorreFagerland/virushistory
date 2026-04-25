<h3>The CERN SYSMAN incident</h3>

In 1991, CERN suffered an incident where a VAX/VMS "trojan" named SYSMAN.EXE was found on multiple machines. 
This really happened - there are multiple advisories mentioning the issue. However, no sample is available.
Reading the advisories now, it is clear that this was no oldschool destruction. This was intrusion and apparent
lateral movement.

https://attrition.org/security/advisory/ciac/c-fy92/c-05.ciac-vms-sysman-trojan-preliminary<br>
https://attrition.org/security/advisory/ciac/c-fy92/c-07.ciac-vms-sysman-trojan-additional<br>

Julian Bunn was the admin of the main VAX machine (VXCERN) at CERN at the time. He says (private email):

<em>"I do remember this trojan, and it causes us a lot of trouble at CERN. A couple of detectives from the 
Police de Surete came down from Paris to interview me about it at the time (amusingly, they brought 
typewriters with them to take notes - I knew that they were completely out of their depth). I certainly 
never saw the source code to SYSMAN, it was just an executable. We had several hacking incidents at around 
this time, most via the X.25 packet network. The CERN main VAX, VXCERN, which I was responsible for, was 
very widely connected on that, and a target for that reason. There was another incident which we referred 
to as the "SPYROPO hacker".</em><br><br>

Bunn also said [this](https://groups.google.com/g/comp.os.vms/c/qRUYJJKFoqc/m/uY_OtdtRzlwJ) on USENET in 1992:<br><br>
<em>This SYSMAN Trojan was discovered on around a dozen VAXes at CERN in November 1991. At that time the 
CERT were given full details. Other VAXes in Europe were also affected. A very powerful check, as mentioned
above, is a SYSMAN image size of 166 blocks, and a file called OBJ.EXE in SYS$LIBRARY. The rogue SYSMAN 
will copy itself to any system which is the target of a "set environment/node" command (which succeeds).

It certainly allows any non-privileged user to gain full system privileges, if that user knows the "trick" 
(which I won't detail on the net!).</em>

