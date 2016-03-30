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
" set fileencodings=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix
let $LANG="en"

set showtabline=2 " 常にタブラインを表示

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
"ターミナルから起動したときのカラースキーム
colorscheme railscasts
set t_Co=256

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
" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

set nocompatible
filetype off

"swapファイルを置く場所
set directory=~/.vimswap/

"バックアップファイルを置く場所
set backupdir=~/.vimbackup/

"アンドゥファイルを置く場所
set undodir=~/.vimundo/
"

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

"esc二回でハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>
" Search -------------------------------
set wrapscan				" 最後まで検索したら先頭へ戻る
set ignorecase				" 大文字小文字無視
set smartcase				" 大文字ではじめたら大文字小文字無視しない
set incsearch				" インクリメンタルサーチ
set hlsearch				" 検索文字をハイライト


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

"""""""""""
""SKK""
"""""""""""
set imdisable
let g:eskk#directory = $VIMFILE_DIR.'/.eskk'
let g:eskk#dictionary = { 'path': $VIMFILE_DIR.'/.skk-jisyo', 'sorted': 0, 'encoding': 'utf-8', }
let g:eskk#large_dictionary = { 'path': $VIMFILE_DIR.'/.eskk/SKK-JISYO.L', 'sorted': 1, 'encoding': 'euc-jp', }

"""""""""""""""""""""""""""""""""""""""""""""
"NeoBundle

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=$VIMFILE_DIR/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand($VIMFILE_DIR.'/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'gmarik/vundle'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'katono/rogue.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Align'
NeoBundle 'koron/dicwin-vim'
NeoBundle 'aklt/plantuml-syntax'
NeoBundle 'digitaltoad/vim-jade'
" NeoBundle 'kannokanno/previm'
NeoBundle 'kannokanno/previm', '46-support-latest-open-browser'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tyru/eskk.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'

" NeoBundle 'LaTeX-Suite-aka-Vim-LaTeX'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""" qfixhown
" qfixappにruntimepathを通す(パスは環境に合わせてください)
set runtimepath+=c:/temp/qfixapp

" キーマップリーダー
let QFixHowm_Key = 'g'

" ファイルタイプをmarkdownに変更
let QFixHowm_FileType = 'markdown'

" タイトル記号を # に変更する
let QFixHowm_Title = '#'

" デフォルトファイルタイプ
" let QFixHowm_FileType = 'qfix_memo'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = $VIMFILE_DIR.'/howm'
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

"vim-latex
"" プラグインを使うようにする
filetype plugin on
set grepprg=grep\ -nH\ $*
"" .texファイルのコンパイルプログラムを指定(エラーで停止しないようオプション指定)
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
"" .bibファイルのコンパイルプログラムを指定
let g:Tex_BibtexFlavor = 'jbibtex'
"" .dviファイルのビュープログラムを指定
"let g:Tex_ViewRule_dvi = 'c:/tex/dviout/dviout.exe'
"" pdfファイル生成のための依存関係を記述。
"" 以下の設定の場合、ターゲットにpdfを指定して\llでコンパイルすると、
"" まず.dviファイルが作られ、次にそれをもとに.pdfファイルが作られる
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"" .dviファイルのコンパイルプログラムを指定
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"" .pdfファイルのビュープログラムを指定
let g:Tex_ViewRule_pdf = 'C:\Program Files\Adobe\Reader 11.0\Reader\AcroRd32.exe'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:tex_flavor='latex'

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

au BufRead,BufNewFile *.md set filetype=markdown
" let g:previm_open_cmd = 'open -a Firefox'

"" tags
if has("path_extra")
  set tags+=tags;
endif


