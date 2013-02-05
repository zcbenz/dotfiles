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
set tabstop=2
set expandtab
set shiftwidth=2
set scrolloff=2
set fdm=marker
set t_Co=256
set nocscopeverbose "suppress cscope duplicate datebase warning
"set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
"set sidescrolloff=10

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
nmap <leader>l :!ls -l<cr>
nmap <leader>e :tabn 
" Fast editing of the .vimrc
nmap <leader>v :e! ~/.vimrc<cr>
nmap <leader>z :source ~/.vimrc<cr>

" clipboard binding
vmap <C-v> :!xclip -o<cr>
vmap <C-c> "+y
vmap <C-x> :!xclip -i<cr>

" tabpage binding
noremap <unique> <script> 1 1gt<CR>
noremap <unique> <script> 2 2gt<CR>
noremap <unique> <script> 3 3gt<CR>
noremap <unique> <script> 4 4gt<CR>
noremap <unique> <script> 5 5gt<CR>
noremap <unique> <script> 6 6gt<CR>
noremap <unique> <script> 7 7gt<CR>
noremap <unique> <script> 8 8gt<CR>
noremap <unique> <script> 9 9gt<CR>
nnoremap <silent> <leader>tt :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <A-Left> :tabprevious<CR>
nnoremap <silent> <A-Right> :tabnext<CR>
nnoremap <C-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <C-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <C-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

let g:fuf_modesDisable = [] 
let g:SuperTabLongestHighlight = 0
let &termencoding=&encoding
let g:acp_behaviorSnipmateLength = 1
"let g:acp_completeOption = '.,w,b,u,t,i'''
"let g:AutoComplPop_Behavior = { 
"\ 'c': [ {'command' : "\<C-x>\<C-o>",
"\       'pattern' : ".",
"\       'repeat' : 0}
"\      ]  
"\}
set fileencodings=utf-8,gbk,ucs-bom,cp936

" automatically fitting a quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

