"VIM Setup file

" APPEARANCE
syntax on               "syntax processing
"colorscheme badwolf    "colorscheme
set tabstop=4          "number of spaces to display tabs
"set softtabstop=4	"number of spaces a tab counts for when editting
"set expandtab		"tabs are spaces
set smartindent		"try to do the right indentation
set shiftwidth=4	"recognize tabs as indents

" UI CONFIG
set nu                  "line numbers
"set cursorline		"highlight current line
set wildmenu		"visual autocomplete for command menu
set showmatch		"highlight matching [{()}]

" SEARCHING
set incsearch		"search as characters are entered
set hlsearch		"highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" FOLDING
set foldenable		" enable folding
set foldlevelstart=10	" only very nested blocks of code are default folded
" space open/closes folds
nnoremap <space><space> za
set foldmethod=indent	"fold based on indent

" MOVEMENT
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" COMMENTING 
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" PLUGINS
" pathogen
execute pathogen#infect()
filetype plugin indent on

" toggle gundo - undo tree
nnoremap <leader>u :GundoToggle<CR>

" open ag.vim - search and edit files
nnoremap <leader>a :Ag

" CtrlP settings, fuzzy file searcher
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
