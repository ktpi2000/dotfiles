"###dein settings###
if &compatible
	set nocompatible
endif

"deing.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '~/.vim/dein/repos/github.com/Shougo/dein.vim'

"ないならgit clone
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	"管理するプラグインを記述したファイルたち
	let s:toml = '~/.dein.toml'
	let s:lazy_toml = '~/.dein_lazy.toml'
	"add
	let  g:indent_guides_enable_on_vim_startup = 1

	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

"インストールしてないもの
if dein#check_install()
	call dein#install()
endif

"###表示の設定###

"行番号を表示
set number

"編集中のファイル名を表示
set title

"対応するカッコを表示
set showmatch

"コードの色分け
syntax on

"インデントをスペース2つに
set tabstop=2
set shiftwidth=2

"自動インデント
set smartindent

"オートインデント
set autoindent

"ステータスを表示
set laststatus=2

"文字コードの指定
set fenc=utf-8

"swapファイルを作らない
set noswapfile

"カラー設定
set t_Co=256

"メッセージ表示欄
set cmdheight=2

"入力中のコマンドをステータスに表示
set showcmd

"現在の行を強調する
set cursorline

"途中からハイライトされなくなるやつを解決(vue)
autocmd FileType vue syntax sync fromstart

"スクロール速くするよ
set ttyfast
set lazyredraw

"コメントアウトの修正(vue)
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
	  let g:ft = 'vue'
	  let stack = synstack(line('.'), col('.'))
	  if len(stack) > 0
	    let syn = synIDattr((stack)[0], 'name')
	    if len(syn) > 0
	      exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
	    endif
	  endif
	endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
		setf vue
		let g:ft = ''
	endif
endfunction

"ctrl+EでNERDTreeToggle起動
map <silent><C-e> :NERDTreeToggle<CR>

"カラースキーム
colorscheme molokai
