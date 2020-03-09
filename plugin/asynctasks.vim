let g:asynctasks_template = 0
let g:asynctasks_confirm = 0

noremap <silent><F6> :wa<CR>:AsyncTask project-run<CR>
noremap <silent><F7> :wa<CR>:AsyncTask project-build<CR>
noremap <silent><F8> :wa<CR>:AsyncTask project-init<CR>
noremap <silent><F9> :AsyncTaskEdit<CR>
noremap <silent><C-BS> :AsyncStop<CR>
