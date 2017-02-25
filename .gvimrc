" システム設定
"----------------------------------------
"エラー時の音とビジュアルベルの抑制。
set noerrorbells
set novisualbell
set visualbell t_vb=

if has('multi_byte_ime') || has('xim')
  "起動直後の挿入モードでは日本語入力を有効にしない
  " set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    "XIMの入力開始キー
    "set imactivatekey=C-space
  endif
endif

" When insert mode, change statusline.
let g:hi_insert = 'hi StatusLine gui=None guifg=Black guibg=Yellow cterm=None ctermfg=Black ctermbg=Yellow'

"----------------------------------------
" 表示設定
"----------------------------------------
"ツールバーメニューバーを非表示
set guioptions-=T
set guioptions-=m
"コマンドラインの高さ
set cmdheight=2
"検索ハイライト
set hlsearch

"カラースキームの設定
colorscheme railscasts

"フォント設定
"フォントは英語名で指定すると問題が起きにくくなります
if has('xfontset')
"  set guifontset=a14,r14,k14
elseif has('mac')
" set guifontwide=ヒラギノ角ゴ\ Pro\ W3:h16
elseif has('win32') || has('win64')
set guifontwide=Myrica_M:h12:cSHIFTJIS
set guifont    =Myrica_M:h12:cSHIFTJIS
endif

"印刷用フォント
if has('printer')
  if has('win32') || has('win64')
    set printfont=Ricty_Diminished:h12:cSHIFTJIS
    set printfont=Ricty_Diminished:h12:cSHIFTJIS
  endif
endif

set printoptions=number:y
set printoptions=wrap:y

