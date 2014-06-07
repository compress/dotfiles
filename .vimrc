"   __  __ _ _____ _________¬
"   \ \ | |_|     V  __/ __|¬
"    \ \| | | | | | | | [__¬
" [_] \___|_|_|_|_|_| \____|¬"
"
" This .vimrc was edited by compress.

" about .vimrc
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>"
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" display setting
set number
set title
set showmatch
syntax on
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" バックアップ取らない
set nobackup
" 他で書き換えられたら自動で読み直す
set autoread
" スワップファイル作らない
set noswapfile
" バックアップファイルを作るディレクトリ
" set backupdir=$HOME/vimbackup
" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap
" スワップファイル用のディレクトリ
" set directory=$HOME/vimbackup
" インクリメンタルサーチを行う
set incsearch
" タブ文字、行末など不可視文字を表示する
set list
" listchars(display tab and LF)
set listchars=eol:¬,tab:▸\

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
" タブ幅をリセット
autocmd BufNewFile,BufRead * set tabstop=4 shiftwidth=4

" keybind
"ESC
inoremap <c-j> <esc>
vnoremap <c-j> <esc>

" ;でコマンド入力( ;と:を入れ替え)
noremap ; :
noremap : ;

" Shift+hjklで移動量を大きく
"noremap H 3h
noremap J 3j
noremap K 3k
"noremap L 3l

" CTRL-hjklでウィンドウ移動(闇)
"nnoremap <C-j> ;<C-w>j
"nnoremap <C-k> ;<C-k>j
"nnoremap <C-l> ;<C-l>j
"nnoremap <C-h> ;<C-h>j

" バッファの移動
noremap <C-,> ;bp<CR>
noremap <C-.> ;bn<CR>

inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" カーソル後の文字削除
inoremap <silent> <C-d> <Del>
" 引用符, 括弧の設定
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>

" c-a,c-e
noremap <C-3> <C-x>
noremap <C-4> <C-a>
noremap <C-a> 0
noremap <C-e> $
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" menu and toolbar
set guioptions-=m
set guioptions-=T

" shell script
inoremap <C-c><C-b> #!/bin/sh


" status-line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set laststatus=2

"autocmd FocusGained * set transparency=220
"autocmd FocusLost * set transparency=128

" search setting
set ignorecase
set smartcase
set wrapscan

" clipboard setting
set clipboard=unnamed,autoselect

" color-scheme
"set background=dark       " only solarized setting
colorscheme molokai

"" It's must be written in .gvimrc.
" font
"set guifont=Ricty
" fontsize
 " windows
 "set guifont=Font\ Family:h14
 "set guifontwide=Font\ Family:h14
" linux
"set guifont=Ricty\ 14
"set guifontwide=Ricty\ 14

""" skk.vim
""" personal dict
""let skk_jisyo = '~/.vim/dict/skk/personal-jisyo'
""" common dict
""let skk_large_jisyo = '~/.vim/dict/skk/SKK-JISYO.ML'
""let skk_auto_save_jisyo = 1
""" insert wo nuketemo futatabi insert mode ni haireba skk fukkatsu
""let skk_keep_state = 0
""let skk_egg_like_newline = 1
""let skk_show_annotation = 1
""let skk_use_face = 1
""" not kill default IM
""let &imdisable = 0
""" set sticky key ";"
""let g:skk_sticky_key=';'

"NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'vim-surround'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sudo.vim'                 " :w sudo:%とすると管理者権限で保存
"NeoBundle 'fholgado/minibufexpl.vim' " バッファをタブ状表示
"NeoBundle 'tyru/skk.vim'
NeoBundle 'vim-scripts/closetag.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/bitly.vim'

" for AOJ
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mopp/AOJ.vim'

" add color-scheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'vim-scripts/summerfruit256.vim'
NeoBundle 'vim-scripts/pyte'
NeoBundle 'vim-scripts/phd'
NeoBundle 'djjcast/mirodark'
NeoBundle 'briancarper/gentooish.vim'

filetype plugin on
filetype indent on

if has("autocmd")
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif

" Plugin Setting

"----------------------------------------------------
" neocomplcache
"----------------------------------------------------
let g:neocomplcache_enable_at_startup = 1

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"----------------------------------------------------
" neosnippet
"----------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
end
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"----------------------------------------------------
" over.vim
"----------------------------------------------------

" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"----------------------------------------------------
" yankround.vim
"----------------------------------------------------
"" キーマップ
"nmap p <Plug>(yankround-p)
"nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50
""履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

"基本的には､ペースト直後にC-nを押して､履歴を辿れます。
"また,+g+C-pを押して､履歴一覧をctrlp.vimで表示し､選択することが出来ます｡

"----------------------------------------------------
" NERDTree
"----------------------------------------------------

" 隠しファイルを表示する
let NERDTreeShowHidden = 1
"引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
"if has('vim_starting') &&  file_name == ""
"  autocmd VimEnter * execute 'NERDTree ./'
"endif

"----------------------------------------------------
" miniBufExplorer
"----------------------------------------------------

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBuffs = 1
"let g:miniBufExplorerMoreThanOne = 0    " 無条件でバッファ一覧が開く
"let g:miniBufExplMapWindowNavVim=1      "hjklで移動
"
"au BufNewFile,BufRead *.ejs set filetype=jst

"----------------------------------------------------
" NERD Commenter
"----------------------------------------------------

let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

"----------------------------------------------------
" lightline
"----------------------------------------------------
" vim-gitgutter
"let g:gitgutter_sign_added = '✚'
"let g:gitgutter_sign_modified = '➜'
"let g:gitgutter_sign_removed = '✘'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'Tomorrow',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ }

"       \ 'separator': {'left': '⮀', 'right': '⮂'},
"       \ 'subseparator': {'left': '⮁', 'right': '⮃'}

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? 'R ' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? 'F '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"----------------------------------------------------
" Emmet.vim
"----------------------------------------------------
" 展開するキーバインドを変更
let g:user_emmet_expandabbr_key = ',l'
let g:user_emmet_settings = {'indentation' : '  '}

"----------------------------------------------------
" AOJ.vim
"----------------------------------------------------
let g:aoj#user_id = 'compress'

" :AOJSubmit
" When You open one of problems, It Submits Your source code to AOJ.
" Then, AOJ.vim will open unite buffer.
" If You cannot see your ID in it, Please execute redraw command like in unite buffer.
"
" :AOJSubmitByProblemID
" You pass Problem ID as argument. Other behaver is same :AOJSubmit
"
" :AOJViewProblems
" It opens Problem List in unite buffer.
"
" :AOJViewStaticticsLogs
" It opens Submit Statistics List in unite buffer.

"----------------------------------------------------
" Tweetvim
"----------------------------------------------------
nnoremap <silent> ts :<C-u>TweetVimSay<CR>
nnoremap <silent> tt :TweetVimHomeTimeline<CR>
nnoremap <silent> tm :TweetVimMentions<CR>
"// :reload

"" default keymap(default leader is "\")
"nmap <silent> <buffer> <CR> <Plug>(tweetvim_action_enter)
"nmap <silent> <buffer> r  <Plug>(tweetvim_action_reply)
"nmap <silent> <buffer> i  <Plug>(tweetvim_action_in_reply_to)
"nmap <silent> <buffer> u  <Plug>(tweetvim_action_user_timeline)
"nmap <silent> <buffer> o  <Plug>(tweetvim_action_open_links)
"nmap <silent> <buffer> q  <Plug>(tweetvim_action_search)
"nmap <silent> <buffer> <leader>f  <Plug>(tweetvim_action_favorite)
"nmap <silent> <buffer> <leader>uf <Plug>(tweetvim_action_remove_favorite)
"nmap <silent> <buffer> <leader>r  <Plug>(tweetvim_action_retweet)
"nmap <silent> <buffer> <leader>q  <Plug>(tweetvim_action_qt)
"nmap <silent> <buffer> <Leader><Leader>  <Plug>(tweetvim_action_reload)
"
"nmap <silent> <buffer> ff  <Plug>(tweetvim_action_page_next)
"nmap <silent> <buffer> bb  <Plug>(tweetvim_action_page_previous)
"
"nmap <silent> <buffer> H  <Plug>(tweetvim_buffer_previous)
"nmap <silent> <buffer> L  <Plug>(tweetvim_buffer_next)
"
"nnoremap <silent> <buffer> a :call unite#sources#tweetvim_action#start()<CR>
"nnoremap <silent> <buffer> t :call unite#sources#tweetvim_timeline#start()<CR>

"----------------------------------------------------
" VimShell
"----------------------------------------------------
nnoremap <silent> ,sh :VimShell<CR>

"----------------------------------------------------
" VimShell
"----------------------------------------------------
":VimFilerIDEでVimFilerをIDEのように表示する
function! VimFilerIDE()
    VimFiler -split -simple -winwidth=35 -no-quit
endfunction
command! VimFilerIDE call VimFilerIDE()

"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"VimFilerを起動する
nnoremap <silent> ,ff :<C-u>VimFiler<CR>
"現在開いているバッファのディレクトリを開く
nnoremap <silent> ,fe :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> ,fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
