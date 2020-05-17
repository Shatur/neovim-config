if has('win32')
  let g:default_projects_path = 'D:/Code/'
else
  let g:default_projects_path = '/mnt/Files/Code/'
endif

noremap <silent> <F5> :CMakeBuildAndDebug<CR>
noremap <silent> <S-F5> :CMakeDebug<CR>
noremap <silent> <F6> :CMakeBuildAndRun<CR>
noremap <silent> <S-F6> :CMakeRun<CR>
noremap <silent> <F7> :CMakeBuild<CR>
noremap <silent> <S-F7> :CMakeBuildAll<CR>
noremap <silent> <A-F7> :CMakeOpenBuildDir<CR>
noremap <silent> <F8> :CMakeSelectTarget<CR>
noremap <silent> <S-F8> :CMakeSelectBuildType<CR>
noremap <silent> <F9> :CMakeConfigure -G Ninja<CR>
noremap <silent> <S-F9> :CMakeClean<CR>
noremap <silent> <A-F9> :CMakeCreateProject<CR>
