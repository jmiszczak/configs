""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file by Jarek Miszczak 
""""""""""""""""""""""""""""""""""""""""""""""""""
"echom ">^.^<"

:set title

""""""""""""""""""""""""""""""""""""""""""""""""""
" essential shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""
"ab W w
"ab Wq wq
"ab Q q

""""""""""""""""""""""""""""""""""""""""""""""""""
" common aliases
""""""""""""""""""""""""""""""""""""""""""""""""""
command! Q q " Bind :Q to :q
command! W w " Bind :W to :w
command! Wq wq " Bind :Wq to :wq
command! WQ wq " Bind :Wq to :wq

""""""""""""""""""""""""""""""""""""""""""""""""""
" disable Ex mode
""""""""""""""""""""""""""""""""""""""""""""""""""
"map Q <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""
" get rid of the delay when hitting esc!
""""""""""""""""""""""""""""""""""""""""""""""""""
"set noesckeys

""""""""""""""""""""""""""""""""""""""""""""""""""
" basic options for editing any files
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set tabstop=2
set textwidth=80
"set columns=80
set wrapmargin=80
set number
set hlsearch 
set shiftwidth=2 
set expandtab

map <F2> :retab <CR> :wq! <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" for editing LaTeX - also for latexsuite
""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
set sw=2
set iskeyword+=:
" use evince for dvi files
"let g:Tex_ViewRule_dvi = 'evince'
autocmd filetype tex nnoremap <F3> :!rubber -df % && atril %:r.pdf <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" commenting
""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '

noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" spelling
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType haskell setlocal nospell
autocmd FileType latex,tex,md,markdown setlocal nospell
setlocal spell spelllang=en_us

""""""""""""""""""""""""""""""""""""""""""""""""""
" modeline
""""""""""""""""""""""""""""""""""""""""""""""""""
set modeline
set modelines=5

""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim settings
""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
	colorscheme desert
	set guifont=Liberation\ Mono\ 12 
	set lines=40 columns=100
	command! Bt browse tabnew 
	set mousemodel=popup
	map <ESC>o :browse confirm e<CR>
	map <ESC>t :browse tabnew<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" for editing Drupal modules as php files
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	" Drupal *.module files.  
	augroup module
		autocmd BufRead *.module set filetype=php
	augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""
if &filetype == "html"
  augroup html
    ab po <p>
    ab pc </p>
    ab pco </p><CR><p>
    "ab poc <p><CR></p>
  augroup end
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" for editing PhD files
""""""""""""""""""""""""""""""""""""""""""""""""""
"amenu  JaM.Edit\ in\ Tab :call <SID>JaM_EditInTab()<CR>
"amenu  JaM.Save\ PhD\ Session :call <SID>JaM_SavePhDSession()<CR>
"function <SID>JaM_EditInTab()
"  browse tabnew e<CR>
"endfunction
"
"function <SID>JaM_SavePhDSession()
"  mksession! /home/jam/Kuweta/phd-miszczak-en/work.vim
"endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""
" ANTLR syntax
""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4 
