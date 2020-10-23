" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'iamcco/coc-flutter'
Plug 'morhetz/gruvbox'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
let g:dart_style_guide = 2
let dart_html_in_string=v:true
let g:lsc_auto_map = v:true

if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'?',
                \ 'Staged'    :'?',
                \ 'Untracked' :'?',
                \ 'Renamed'   :'?',
                \ 'Unmerged'  :'-',
                \ 'Deleted'   :'?',
                \ 'Dirty'     :'?',
                \ 'Ignored'   :'?',
                \ 'Clean'     :'???',
                \ 'Unknown'   :'?',
                \ }

nmap <F6> :NERDTreeToggle<CR>

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

:set undolevels=30
:set ruler
:set relativenumber
:set nowrap
":set guifont=Ubuntu_Mono:h14
:set guifont=Liberation_Mono:h14
:set lines=100 columns=120 linespace=0
:set cursorline

colorscheme gruvbox
syntax on

