syntax on
set nocompatible
set smartindent
set nobackup
set number
set nowrap
set laststatus=2
set statusline=%<%t\%h%m%r%=%10.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%=%(bytval=0x%B,%n%Y%)\ \ \%P
set equalprg=indent\ -npro\ -kr\ -i8\ -ts8\ -sob\ -l80\ -ss\ -ncs\ -cp1
set matchpairs+=<:>,":"
set nohlsearch
set autochdir
set incsearch
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=2
set fdm=marker
set t_Co=256
set fileencodings=utf-8,gbk,ucs-bom,cp936

" let esc have no delay
set timeoutlen=1000 ttimeoutlen=0

set visualbell           " don't beep
set noerrorbells         " don't beep
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

filetype plugin on
filetype indent on

" tabpage binding
nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>
nnoremap <leader>5 5gt<cr>
nnoremap <leader>6 6gt<cr>
nnoremap <leader>7 7gt<cr>
nnoremap <leader>8 8gt<cr>
nnoremap <leader>9 9gt<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>c :tabclose<cr>
nnoremap <leader>w :bw<cr>
nnoremap <leader>a :wa<cr>
nnoremap <leader>q :qa<cr>

let &termencoding=&encoding

" allow MRU command
let g:fuf_modesDisable = []

" don't report error of C++ lambadas
let c_no_curly_error=1

" ignore files in .gitignore in ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" ignore temp files in mru
let g:ctrlp_mruf_exclude = '/tmp/.*\|/var/folders/.*|/private/var/folders/.*'

" key maps
nnoremap <leader>g :CtrlPMRU<cr>
nnoremap <leader>f :CtrlP<cr>

" use flavored-markdown by default
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" map .mm to Objective-C++
autocmd BufNewFile,BufRead *.mm set syntax=objcpp

" load c++ snippets in cuda
let g:snipMate = get(g:, 'snipMate', {})
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['cuda'] = 'cpp'

" no force python paddings
let g:python_recommended_style = 0

call pathogen#infect()
