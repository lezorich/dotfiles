""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <c-f> :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Use ag if available
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --path-to-ignore ~/.agignore --nocolor -g ""'
endif

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeMapOpenVSplit='v'
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

""""""""""""""""""""
" Deoplete
"""""""""""""""""''""
let g:deoplete#enable_at_startup = 1
" Close preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


""""""""""""""""
" Fugitive
"""""""""""""""
set diffopt+=vertical


""""""""""""""""
" vim-go
"""""""""""""""
let g:go_fmt_command = "goimports"
