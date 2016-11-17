if has ('win32')
    let $VIMFILE_DIR = '~/vimfiles'
else
    let $VIMFILE_DIR = '~/.vim'
endif
" ～ こっから先、~/.vimを参照する場合、代わりに、$VIMFILE_DIR と書くこと!
"}}}
"
"エンコードと改行コードの自動判別
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix
let $LANG="en"

set showtabline=2 " 常にタブラインを表示

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>r :redraw!<CR>

" バックスペースが効かない問題処理
set backspace=indent,eol,start

set ambiwidth=double

source $VIMRUNTIME/delmenu.vim
set langmenu=en.utf-8
source $VIMRUNTIME/menu.vim

if has ('mac')
    nnoremap ; :
    nnoremap : ;
endif

"表示中のファイルの場所をカレントに
set autochdir

" 表示設定
"
"----------------------------------------

"スプラッシュ(起動時のメッセージ)を表示しない
"set shortmess+=I
"エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
set shellslash 
set number "行番号表示
"括弧の対応表示時間
set showmatch matchtime=1
" タブ幅の設定
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
"Cインデントの設定
set cinoptions+=:0
"タイトルを表示
set title
"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2
set laststatus=2
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~
syntax on

filetype off

"swapファイルを置く場所
set directory=~/.vimswap/
"バックアップファイルを置く場所
set backupdir=~/.vimbackup/
"アンドゥファイルを置く場所
set undodir=~/.vimundo/

"ノーマルモード時にエンターで改行をいれる
nmap <CR> o<ESC>
noremap <S-Enter> O<ESC>
noremap <Enter> o<ESC>

"右スクロールバーなし
set guioptions-=r
set guioptions-=R
"左スクロールバーなし
set guioptions-=l
set guioptions-=L

" Search -------------------------------
set incsearch
set hlsearch
"esc二回でハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>

" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" grep したとき自動で quickfixwindow を開く
autocmd QuickFixCmdPost *grep* cwindow

" tab移動
nnoremap <Space> <Nop>
nnoremap <C-l> gt
nnoremap <C-h> gT

" exコマンド
command! OpenVimrc :tabe ~/.vimrc
command! ReadVimrc :source ~/.vimrc
" command! Deleate_M :%s///g


"""""""""""""""""""""""""""""""""""""""""""""
if &compatible
    set nocompatible
  endif
  set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

  call dein#begin(expand('~/.cache/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('fuenor/qfixhowm')
  call dein#add('kien/ctrlp.vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('rhysd/clever-f.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Align')
  call dein#add('koron/dicwin-vim')
  call dein#add('aklt/plantuml-syntax')
  call dein#add('digitaltoad/vim-jade')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('tyru/eskk.vim')
  call dein#add('vim-scripts/DoxygenToolkit.vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('w0ng/vim-hybrid')

  call dein#end()


  filetype plugin indent on

"ターミナルから起動したときのカラースキーム
" let g:solarized_termcolors=256
set background=dark
" colorscheme solarized
colorscheme hybrid
set t_Co=256

"""""""""""
""SKK""
"""""""""""
set imdisable
let g:eskk#directory = $VIMFILE_DIR.'/.eskk'
let g:eskk#dictionary = { 'path': $VIMFILE_DIR.'/.skk-jisyo', 'sorted': 0, 'encoding': 'utf-8', }
let g:eskk#large_dictionary = { 'path': $VIMFILE_DIR.'/.eskk/SKK-JISYO.L', 'sorted': 1, 'encoding': 'euc-jp', }

""""""" qfixhown
" qfixappにruntimepathを通す(パスは環境に合わせてください)
" set runtimepath+=c:/temp/qfixapp

" キーマップリーダー
let QFixHowm_Key = 'g'

" ファイルタイプをmarkdownに変更
let QFixHowm_FileType = 'markdown'

" タイトル記号を # に変更する
let QFixHowm_Title = '#'

" デフォルトファイルタイプ
" let QFixHowm_FileType = 'qfix_memo'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/Dropbox/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let QFixHowm_PairLinkDir = 'pairlink'
let QFixMRU_IgnoreFile   = '/pairlink/'

"<F6>  タイムスタンプを挿入してinsertモードへ移行
nmap <F6> <ESC>i<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR><CR>


"日記ファイルをhowm_dirのDiaryに作成
let QFixHowm_DiaryFile = 'diary/%Y/%m/%Y-%m-%d-000000.howm'
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType text setlocal textwidth=0

" MRU表示数
let QFixMRU_Entries      = 30
" MRUの保存ファイル名
let QFixMRU_Filename     = $VIMFILE_DIR.'/.qfixmru'

""""""""""""""""""""""""""""""""""""""""""""""""""

"""ctrlp""""

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.BAK
let g:ctrlp_custom_ignore = '\v\.(o|d|out|log|bin|gcno|gcda|pdf)$'

let g:Align_xstrlen=3

"""
if has('kaoriya') && (has('win32') || has('win64'))
    let g:dicwin_dictpath = substitute($HOME, '\', '/', 'g') . '/vimfiles/dict/gene.txt'
endif

"" Unite.vim
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]B   :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]f   :<C-u>Unite file<CR>

"" markdown
""" preview

" 折り畳みを無効
let g:vim_markdown_folding_disabled=1
" Latexを有効($ $)($$ $$)で囲むとLaTex
let g:vim_markdown_math=1
" YAML front matter を有効
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 0

au BufRead,BufNewFile *.md set filetype=markdown

"" tags
if has("path_extra")
  set tags+=tags;
endif

"" g++ compile and execution
command Cpp !g++ % && ./a.out
