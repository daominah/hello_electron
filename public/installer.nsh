!macro customInstall
      ExecWait '"%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\RegAsm.exe" /codebase "C:\Users\Admin\javascript\hello_electron\dist\win-unpacked\resources\app.asar.unpacked\build\RTDExcel\hello_rtd_excel.dll"'
!macroend