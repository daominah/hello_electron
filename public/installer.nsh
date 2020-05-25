!macro customHeader
    !system "echo '' > ${BUILD_RESOURCES_DIR}/customHeader"
!macroend

!macro preInit
    # This macro is inserted at the beginning of the NSIS .OnInit callback
    !system "echo '' > ${BUILD_RESOURCES_DIR}/preInit"
!macroend

!macro customInit
    !system "echo '' > ${BUILD_RESOURCES_DIR}/customInit"
!macroend

!macro customInstall
    # register RTD DLL
    ExecWait '"C:\Windows\Microsoft.NET\Framework64\v2.0.50727\RegAsm.exe" /codebase "$INSTDIR\hello_rtd_excel.dll"'
    ExecWait '"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\RegAsm.exe" /codebase "$INSTDIR\hello_rtd_excel.dll"'
    # register Excel add-in
    ExecWait '"C:\Windows\SysWOW64\regsvr32.exe" "$INSTDIR\ExcelDna.IntelliSense64.xll"'
!macroend

!macro customInstallMode
    # set $isForceMachineInstall or $isForceCurrentInstall
    # to enforce one or the other modes.
!macroend