" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath


" ===
" === Auto load for first time uses
" ===
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
" 	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
" 				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif


" colorscheme default
colorscheme darkblue

"copy from powervim

" 快速移动到行首，行尾
map <Leader>1 ^
map <Leader>2 $
" 打开文件
nmap <Leader>e :e<Space>
" 不关闭文件推出
nmap <Leader>z <C-Z>
" 水平分隔
nmap <Leader>s :Sex<CR>
" 竖直分隔
nmap <Leader>v :Vex<CR>
" delete and append to file
nnoremap ff :. w>> ./EconomistList-knownWords.txt<CR>dd



" 粘贴到系统剪切板
map <Leader>y "*y
" 使用ctrlc, v就可以实现vim之间的复制粘贴
" vnoremap <C-c> :w! /tmp/clipboard.txt <CR>
" inoremap <C-v> <Esc>:r /tmp/clipboard.txt <CR>
"显示匹配
set showmatch
"括号匹配
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
autocmd InsertEnter * se cul    " 用浅色高亮当前行"
" shortcut for markdown
" 创建时间快捷键for markdown
nmap tm :call SetTime() <CR>
func SetTime()
        call append(line("."), "\# ".strftime('%a %d %b %Y'))
endfunc

nmap tb :call SetTable() <CR>
func SetTable()
        call append(line("."), "\| | | ")
        call append(line(".")+1, "\|---|---|")
        call append(line(".")+2, "\| | |")
endfunc

nmap pc :call SetPic() <CR>
func SetPic()
        call append(line("."), "\<img src='' width=600 alt=''> </img></div>")
endfunc

nmap pi :call SetPic1() <CR>
func SetPic1()
        call append(line("."), "\![]()")
endfunc

nmap vi :call SetVideo() <CR>
func SetVideo()
        call append(line("."), "\<video src='1.mp4' controls='controls' width='640' height='320' autoplay='autoplay'> Your browser does not support the video tag.</video></div>")
endfunc

nmap cl :call SetCollor() <CR>
func SetCollor()
        call append(line("."), "<span  style='color: #f16707;'> </span>")
endfunc


"copy from powervim end

"basic set
syntax on               "开启
" syntax enable
if &t_Co > 1
   syntax enable
endif
set nocompatible
set showmode            "显示模式
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256

"indent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set shiftround  "round indent to multiple of 'shiftwidth'

"apearence
set number
set relativenumber
set cursorline
set textwidth=79
" set wrap
set linebreak
"set sidescrolloff=15
set wrapmargin=2
set scrolloff=5
set ruler
set laststatus=2      "总是显示状态栏

"" 状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]    "状态栏绝对路径



"search
set showmatch
set hlsearch
set incsearch
set ignorecase
set infercase   "use with ignorecase for completion
set smartcase
set nowrapscan    "This stops the search at the end of the file.

"edit
"set spell spelllang=en_us
set nospell

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

" set shada='1000,f1,<500

" set colorcolumn=100
set updatetime=100
set virtualedit=block
set autochdir
set errorbells
set novisualbell
set history=1000
set autoread
set listchars=tab:\|\ ,trail:▫
set list
set wildmenu
set wildmode=longest:list,full
set clipboard=unnamed

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

if has("autocmd")
  filetype plugin indent on
endif

"if has("vms")
"  set nobackup
"else
"  set backup
"  if has('persistent_undo')
"    set undofile
"  endif
"endif

"if &t_Co > 2 || has ("gui_running")
"  set hlsearch
"endif

set ttimeout
set ttimeoutlen=100


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=";"
" noremap ; :

" Save & quit
noremap <LEADER>w :w<CR>
noremap R :source ~/.config/nvim/init.vim<CR>
noremap <LEADER>q :q<CR>
noremap <C-q> :qa<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :vsp ~/.config/nvim/init.vim<CR>

"noremap <LEADER>rc :vsp $MYVIMRC<CR>

" Open the .zshrc file anytime
noremap <LEADER>sh :vsp ~/.zshrc<CR>

" Open the env.zsh aliases.zsh file anytime
noremap <LEADER>env :vsp ~/.config/zsh/env.zsh<CR>
noremap <LEADER>ali :vsp ~/.config/zsh/aliases.zsh<CR>

" Open myfilelist anytime
noremap <LEADER>fl :tabedit ~/.config/nvim/myfilelist.md<CR>
" Inline open (goto) file
"noremap <LEADER>op 0f/gf

" Open md-snippets anytime
noremap <LEADER>md :vsp ~/.config/nvim/md-snippets.vim<CR>


" (){}
map \p i(<Esc>ea)<Esc>
map \c i{<Esc>ea}<Esc>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" Open up lazygit
noremap \g :Git 
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" K/J keys for 5 times k/j (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement
" ===
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
"cnoremap <M-b> <S-Left>
"cnoremap <M-w> <S-Right>


" ===
" === Searching
" ===
"noremap - Nzz
"noremap = nzz

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap <LEADER>K <C-w>K
noremap <LEADER>J <C-w>J
noremap <LEADER>H <C-w>H
noremap <LEADER>L <C-w>L

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
"noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
"noremap sh <C-w>t<C-w>K
" Place the two screens side by side
"noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
" noremap <LEADER>q <C-w>j:q<CR>

" ===
" === Tab management
" ===
" Create a new tab with tn after the current one
noremap tt :tabnew<CR>
" Move around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" ===
" === Markdown Settings
" ===
" Snippets
" source ~/.config/nvim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
" inoremap <C-> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

inoremap <LEADER>, <++>
inoremap <LEADER>ee <Esc>
vnoremap <LEADER>ee <Esc>
cnoremap <LEADER>ee <Esc>

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
"noremap tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>

" press f10 to show hlgroup
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" comment one line with # 
noremap <LEADER>m I#<SPACE><ESC>0j
noremap <LEADER>n 0xxj
" comment one line with 
noremap <LEADER>v I"<SPACE><ESC>0j


 " Compile function
noremap t :call CompileRunGcc()<CR>
 func! CompileRunGcc()
 	exec "w"
 	if &filetype == 'c'
 		exec "!g++ % -o %<"
 		exec "!time ./%<"
 	elseif &filetype == 'cpp'
 		set splitbelow
 		exec "!g++ -std=c++11 % -Wall -o %<"
 		:sp
 		:res -15
 		:term ./%<
 	elseif &filetype == 'java'
 		exec "!javac %"
 		exec "!time java %<"
 	elseif &filetype == 'sh'
 		:!time bash %
 	elseif &filetype == 'python'
 		set splitbelow
 		:sp
 		:term python3 %
 	elseif &filetype == 'html'
 		silent! exec "!".g:mkdp_browser." % &"
 	elseif &filetype == 'markdown'
 		exec "InstantMarkdownPreview"
 	elseif &filetype == 'tex'
 		silent! exec "VimtexStop"
 		silent! exec "VimtexCompile"
 	elseif &filetype == 'dart'
 		exec "CocCommand flutter.run -d ".g:flutter_default_device
 		silent! exec "CocCommand flutter.dev.openDevLog"
 	elseif &filetype == 'javascript'
 		set splitbelow
 		:sp
 		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
 	elseif &filetype == 'go'
 		set splitbelow
 		:sp
 		:term go run .
 	endif
 endfunc

" ===
" === Necessary Commands to Execute
" ===
"exec "nohlsearch"
" let g:netrw_browsex_viewer= "chromium"


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')


" Translation
Plug 'voldikss/vim-translator'

" Testing my own plugin
" Plug 'theniceboy/vim-calc'

" Pretty Dress
" myselfmark Plug 'bling/vim-bufferline'
" myselfmark Plug 'bpietravalle/vim-bolt'
" myselfmark Plug 'theniceboy/vim-deus'

"Plug 'arzg/vim-colors-xcode'

" Status line
" myselfmark Plug 'theniceboy/eleline.vim'

" General Highlighter
" myselfmark Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" myselfmark Plug 'RRethy/vim-illuminate'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
" myselfmark Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" myselfmark Plug 'kevinhwang91/rnvimr'
" myselfmark Plug 'airblade/vim-rooter'
" myselfmark Plug 'pechorin/any-jump.vim'

" Taglist
" myselfmark Plug 'liuchengxu/vista.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" myselfmark Plug 'wellle/tmux-complete.vim'

" Snippets
" Plug 'SirVer/ultisnips'
" myselfmark Plug 'theniceboy/vim-snippets'

" Undo Tree
" myselfmark Plug 'mbbill/undotree'

" Git
" myselfmark Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" myselfmark Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
" myselfmark Plug 'airblade/vim-gitgutter'
" myselfmark Plug 'cohama/agit.vim'

" Autoformat
" myselfmark Plug 'Chiel92/vim-autoformat'

" Tex
" Plug 'lervag/vimtex'

" CSharp
" myselfmark Plug 'OmniSharp/omnisharp-vim'
" myselfmark Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
" myselfmark Plug 'elzr/vim-json'
" myselfmark Plug 'othree/html5.vim'
" myselfmark Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" myselfmark Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
" myselfmark Plug 'HerringtonDarkholme/yats.vim'

" Go
" myselfmark Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" myselfmark Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
" myselfmark Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Flutter
" myselfmark Plug 'dart-lang/dart-vim-plugin'

" Swift
" myselfmark Plug 'keith/swift.vim'
" myselfmark Plug 'arzg/vim-swift'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'

" Other filetypes
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" myselfmark Plug 'mg979/vim-visual-multi'
" myselfmark Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
" myselfmark Plug 'theniceboy/antovim' " gs to switch
" myselfmark Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
" myselfmark Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
" myselfmark Plug 'junegunn/vim-after-object' " da= to delete what's after =
" myselfmark Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
" myselfmark Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
" myselfmark Plug 'easymotion/vim-easymotion'
" Plug 'Konfekt/FastFold'
"Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/context.vim'
" myselfmark Plug 'svermeulen/vim-subversive'
" myselfmark Plug 'theniceboy/argtextobj.vim'
" myselfmark Plug 'rhysd/clever-f.vim'
" myselfmark Plug 'chrisbra/NrrwRgn'
" myselfmark Plug 'AndrewRadev/splitjoin.vim'

" For general writing
" Plug 'junegunn/goyo.vim'
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
" Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
" myselfmark Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'jceb/vim-orgmode'
"Plug 'mhinz/vim-startify'
" myselfmark Plug 'skywind3000/asynctasks.vim'
" myselfmark Plug 'skywind3000/asyncrun.vim'

" Vim Applications
" myselfmark Plug 'itchyny/calendar.vim'

" Other visual enhancement
" myselfmark Plug 'ryanoasis/vim-devicons'
" myselfmark Plug 'luochen1990/rainbow'
" myselfmark Plug 'mg979/vim-xtabline'
" myselfmark Plug 'wincent/terminus'

" Other useful utilities
" myselfmark Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'


call plug#end()


" ===
" === Dress up my vim
" ===
" set termguicolors " enable true colors support
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
" color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

" hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70


" ===================== Start of Plugin Settings =====================


" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
" let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
" let g:instant_markdown_port = 8888
" let g:instant_markdown_python = 1



" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===================== End of Plugin Settings =====================

