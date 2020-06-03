command! PackagerInstall call vimrc#packager#Init() | call packager#install()
command! -bang PackagerUpdate call vimrc#packager#Init() | call packager#update({'force_hooks': '<bang>'})
command! PackagerClean call vimrc#packager#Init() | call packager#clean()
command! PackagerStatus call vimrc#packager#Init() | call packager#status()
