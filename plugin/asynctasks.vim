let g:asynctasks_template = 0
let g:asynctasks_confirm = 0
let g:asyncrun_rootmarks = ['.git', '.root', 'compile_commands.json']
let g:asynctasks_edit_split = 'vert'

noremap <silent><F6> :AsyncTask project-run<CR>
noremap <silent><F7> :AsyncTask project-build<CR>
noremap <silent><S-F7> :AsyncTask project-open-build<CR>
noremap <silent><F8> :AsyncTask project-init<CR>
noremap <silent><S-F8> :AsyncTask project-open-source<CR>
noremap <silent><F9> :AsyncTaskEdit<CR>
noremap <silent><C-BS> :AsyncStop<CR>
