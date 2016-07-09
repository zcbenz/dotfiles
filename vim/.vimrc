syntax on
set nocompatible
set notimeout
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

set visualbell           " don't beep
set noerrorbells         " don't beep
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

filetype plugin on
filetype indent on

" key maps
nnoremap <leader>g :FufMruFile<cr>
nnoremap <leader>f :FufFile<cr>

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

let g:loaded_AlignMapsPlugin = 'no'
let g:fuf_modesDisable = []
let g:SuperTabLongestHighlight = 0
let &termencoding=&encoding

" Don't report error of C++ lambadas
let c_no_curly_error=1

" use flavored-markdown by default
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

call pathogen#infect()
