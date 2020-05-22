!macro customHeader
  !system "echo '' > ${BUILD_RESOURCES_DIR}/customHeader"
!macroend

!macro preInit
  ; This macro is inserted at the beginning of the NSIS .OnInit callback
  !system "echo '' > ${BUILD_RESOURCES_DIR}/preInit"
!macroend

!macro customInit
  !system "echo '' > ${BUILD_RESOURCES_DIR}/customInit"
!macroend

!macro customInstall
  ExecWait '"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\RegAsm.exe" /codebase "$INSTDIR\hello_rtd_excel.dll"'
!macroend

!macro customInstallMode
  # set $isForceMachineInstall or $isForceCurrentInstall
  # to enforce one or the other modes.
!macroend