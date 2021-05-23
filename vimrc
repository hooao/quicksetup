" h4hu vim rc
let mapleader=","
set incsearch
set ignorecase
set nocompatible

filetype off
" plugin begin
set rtp+=~/.vim/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kshenoy/vim-signature'
" c/c++ development
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'zivyangll/git-blame.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'SpaceVim/SpaceVim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'Yggdroot/LeaderF'

call vundle#end()
" key map in normal
map LB 0
map LE $
" map <leader>h <C-w>h
" map <leader>l <C-w>l
" map <leader>j <C-w>j
" map <leader>k <C-w>k
map <C-B> :NERDTreeToggle<CR>
map <C-p> :LeaderfFile<CR> 
map <C-f> :Ack<space>
map s <nop>
map S :w<CR>
map Q :q<CR>
map <leader><leader> <Esc>
map <leader><leader>w <Esc>:w<CR>
map <leader><leader>q <Esc>:q!<CR>
map <leader><leader><leader> <Esc>:wq<CR>
map <leader><leader><leader><leader> <Esc>:q!<CR>

" key map in insert
inoremap <leader><leader> <Esc>
inoremap <leader><leader>w <Esc>:w<CR>
inoremap <leader><leader>q <Esc>:q<CR>
inoremap <leader><leader><leader> <Esc>:wq<CR>
inoremap <leader><leader><leader><leader> <Esc>:q!<CR>
inoremap <leader>a <space>a
inoremap <leader>b <space>b
inoremap <leader>c <space>c
inoremap <leader>d <space>d
inoremap <leader>e <space>e
inoremap <leader>f <space>f
inoremap <leader>g <space>g
inoremap <leader>h <space>h
inoremap <leader>i <space>i
inoremap <leader>j <space>j
inoremap <leader>k <space>k
inoremap <leader>l <space>l
inoremap <leader>m <space>m
inoremap <leader>n <space>n
inoremap <leader>o <space>o
inoremap <leader>p <space>p
inoremap <leader>q <space>q
inoremap <leader>r <space>r
inoremap <leader>s <space>s
inoremap <leader>t <space>t
inoremap <leader>u <space>u
inoremap <leader>v <space>v
inoremap <leader>w <space>w
inoremap <leader>x <space>x
inoremap <leader>y <space>y
inoremap <leader>z <space>z

set backspace=2
set ruler
set number
set cursorline
set hlsearch
set wildmenu
set relativenumber
set wrap
set showcmd
set autochdir " When open a file, cd to that directory.
"set right edge color
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight ColorColumn ctermbg=25 guibg=#3c2d27
"set colorcolumn=100 " Highlight the 100th column.
"let &colorcolumn="100,".join(range(120,999),",")
let &colorcolumn=join(range(100,999),",")

set showmatch
syntax on
syntax enable
autocmd BufWritePost $MYVIMRC source ~/.vimrc
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" status bar
" 我的状态行显示的内容（包括文件类型和解码）  
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}  
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] 
set laststatus=2
"set cmdheight=2
" setting for ag
let g:ag_working_path_mode="r"
let g:ackprg = 'ag --nogroup --nocolor --column'
" color
"colorscheme solarized
"colorscheme molokai
"colorscheme phd
"NerdTree Setting
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"leaderf config
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
" let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

""""noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
