if has('win32')
  let g:default_projects_path = 'D:/Code/'
else
  let g:default_projects_path = '/mnt/Files/Code/'
endif
let g:cmake_debug_command = 'DebugLLDB'

noremap <F5> <Cmd>CMakeBuildAndDebug<CR>
noremap <S-F5> <Cmd>CMakeDebug<CR>
noremap <F6> <Cmd>CMakeBuildAndRun<CR>
noremap <S-F6> <Cmd>CMakeRun<CR>
noremap <A-F6> <Cmd>CMakeSetTargetArguments<CR>
noremap <F7> <Cmd>CMakeBuild<CR>
noremap <S-F7> <Cmd>CMakeBuildAll<CR>
noremap <A-F7> <Cmd>CMakeOpenBuildDir<CR>
noremap <F8> <Cmd>CMakeSelectTarget<CR>
noremap <S-F8> <Cmd>CMakeSelectBuildType<CR>
noremap <F9> <Cmd>CMakeConfigure -G Ninja<CR>
noremap <S-F9> <Cmd>CMakeClean<CR>
noremap <A-F9> <Cmd>CMakeCreateProject<CR>
