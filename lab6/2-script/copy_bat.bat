FOR %%f IN (C:\Windows\*) DO (
    

    if /I %%~zf GTR 2086912 (
	xcopy /Z %%f \\%COMPUTERNAME%\temp\%%~nxf
    )


)
exit