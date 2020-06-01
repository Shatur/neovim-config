command! PackagerInstall call packager#Init() | call packager#install()
command! -bang PackagerUpdate call packager#Init() | call packager#update({'force_hooks': '<bang>'})
command! PackagerClean call packager#Init() | call packager#clean()
command! PackagerStatus call packager#Init() | call packager#status()
