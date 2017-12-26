@ECHO OFF

ECHO.

ECHO Please don't close this window. Database backup is running...

set TIMESTAMP=%date:~-4,4%_%date:~-7,2%_%date:~-10,2%

if not exist "C:\R2_SQL_Backup\" mkdir C:\R2_SQL_Backup

REM Export all databases into file C:\path\backup\databases.[year][month][day].sql
"C:\xampp\mysql\bin\mysqldump.exe" --all-databases --result-file="C:\R2_SQL_Backup\databases_%TIMESTAMP%.sql" --user=root  --password=

REM Change working directory to the location of the DB dump file.
C:
CD \R2_SQL_Backup\

REM Compress DB dump file into CAB file use "EXPAND file.cab" to decompress.
MAKECAB "databases_%TIMESTAMP%.sql" "databases_%TIMESTAMP%.sql.cab"

REM Delete uncompressed DB dump file.
DEL /q /f "databases_%TIMESTAMP%.sql"