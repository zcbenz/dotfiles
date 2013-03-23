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
nmap <leader>ww :w!<cr>
nmap <leader>wa :wa!<cr>
nmap <leader>qq :q<cr>
nmap <leader>qa :qa<cr>
nmap <leader>bw :bw<cr>
nmap <leader>bc :g/ *$/s///g<cr>
nmap <leader>g :FufMruFile<cr>
nmap <leader>f :FufFile<cr>
" Fast editing of the .vimrc
nmap <leader>v :e! ~/.vimrc<cr>
nmap <leader>z :source ~/.vimrc<cr>

" tabpage binding
noremap <unique> <script> <leader>1 1gt<CR>
noremap <unique> <script> <leader>2 2gt<CR>
noremap <unique> <script> <leader>3 3gt<CR>
noremap <unique> <script> <leader>4 4gt<CR>
noremap <unique> <script> <leader>5 5gt<CR>
noremap <unique> <script> <leader>6 6gt<CR>
noremap <unique> <script> <leader>7 7gt<CR>
noremap <unique> <script> <leader>8 8gt<CR>
noremap <unique> <script> <leader>9 9gt<CR>
nnoremap <silent> <leader>tt :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <leader>tp :tabprevious<CR>
nnoremap <silent> <leader>tn :tabnext<CR>

let g:fuf_modesDisable = [] 
let g:SuperTabLongestHighlight = 0
let &termencoding=&encoding
let g:acp_behaviorSnipmateLength = 1

call pathogen#infect()
