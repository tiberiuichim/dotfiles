if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
"
" {{{ ---- Plugin configuration ----

" To reload plugins, after changing here:
" :so %
" :PlugInstall
" To uninstall a plugin:
" 	remove from below
" 	call:
" 	:PlugClean!

call plug#begin('~/.vim/plugged')

" NOTE: Make sure you use single quotes

" The inimitable NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" BufferBye, gives :Bdelete command to delete buffers
Plug 'moll/vim-bbye'

" Everything programming language syntax and indent
Plug 'sheerun/vim-polyglot'

" Show git status stull in guter column (next to numbers)
Plug 'airblade/vim-gitgutter'
" Plug 'kshenoy/vim-signature'

" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" and Vim 8 while you edit your text files.
" See https://github.com/maralla/validator.vim for a better one??
" or https://github.com/neomake/neomake
Plug 'w0rp/ale'

" Python "tags" in a tagbar
Plug 'majutsushi/tagbar'

" Vim Substitute as operator plugin
Plug 'kana/vim-operator-user'	" dependency of vim-operator-substitute
Plug 'milsen/vim-operator-substitute'
 
" Toggle comments with tcc
Plug 'tomtom/tcomment_vim'

" EditorConfig, global/per project configuration of whitespace settings
Plug 'editorconfig/editorconfig-vim'

" Colorthemes
Plug 'iCyMind/NeoSolarized'
Plug 'rakr/vim-two-firewatch'
Plug 'romainl/Apprentice'
Plug 'jonathanfilip/vim-lucius'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'MaxSt/FlatColor'
Plug 'jacoborus/tender.vim'

" Nice colors in status bar
Plug 'itchyny/lightline.vim'

" Plug 'chriskempson/tomorrow-theme', {'rtp':'vim'}
" Plug 'vim-scripts/calmar256-lightdark.vim'

" Plug 'klen/python-mode'
" Plug 'tmhedberg/SimpylFold'
"

" Plug 'mileszs/ack.vim'
", { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-sensible'

Plug 'junegunn/vim-easy-align'

" Plug 'junegunn/vim-github-dashboard'
"

" Tabline / bufferline plugins. Not all of them work with airline
" See vim-buftabline github page for alternatives
Plug 'ap/vim-buftabline'

" Plug 'bling/vim-bufferline'
"
" Buffers integration with tabs and windows
" Plug 'zefei/vim-wintabs'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Add plugins to &runtimepath
call plug#end()

" http://www.calmar.ws/dotfiles/dotfiledir/calmar256-dark.vim
" set t_Co=256

filetype plugin indent on

" }}}

" asynchronous lint engine (ale) settings

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_sign_column_always = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'


"Settings lifted from sensible.vim {{{
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal
"
" undo settings
set undolevels=10000
set undofile

highlight SpellBad term=underline gui=undercurl guisp=Orange

set ttimeout
set ttimeoutlen=100

set hlsearch
set noincsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
	set scrolloff=1
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
set display+=lastline

" set encoding=utf-8

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
" }}}

" Personal preferences {{{
set t_Co=256
if has('autocmd')
	filetype plugin indent on
endif

syntax enable

set guifont=Inconsolata\ 11
"set guifont=Liberation\ Mono\ 10
set guioptions-=m
set guioptions-=T

set number
set textwidth=79
set visualbell
set cursorline
set history=1000
set lazyredraw

" set autoformat options (think gq). See http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set formatoptions=tcqrn1

set nospell
" set clipboard+=unnamed      "also include system clipboard in the default yank registers

set showmode
set showcmd

" when searching, ignore case if all letters lowercase
set ignorecase
set smartcase
set showmatch

set listchars=tab:▸\ ,eol:¬
" Use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL


" folding stuff
set foldenable
set foldlevelstart=0	" most folds opened by default
set foldmethod=marker   " fold based on markers level
" space open/closes folds
nnoremap <space> za

" backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" Improve :terminal experience, same as above, except using hjkl
" Escape from terminal with Esc:
" :tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


" buffer movement
noremap <C-left> :bprev!<CR>
noremap <C-right> :bnext!<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
" Remember info about open buffers on close
set viminfo^=%

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	"set stal=2
catch
endtry

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" hit \D to insert date in format 2014-05-30
:nnoremap <Leader>D "=strftime("%Y-%m-%d")<CR>P
:inoremap <Leader>D <C-R>=strftime("%Y-%m-%d")<CR>

" preferences for where the split happens
set splitbelow
set splitright

" colo molokai
set termguicolors
" default value is "normal", Setting this option to "high" or "low" does use the 
" same Solarized palette but simply shifts some values up or down in order to 
" expand or compress the tonal range displayed.
" let g:neosolarized_contrast = "high"
" Special characters such as trailing whitespace, tabs, newlines, when displayed 
" using ":set list" can be set to one of three levels depending on your needs. 
" Default value is "normal". Provide "high" and "low" options.
" let g:neosolarized_visibility = "normal"

" If you wish to enable/disable Solarized from displaying bold, underlined or italicized 
" typefaces, simply assign 1 or 0 to the appropriate variable.
" let g:neosolarized_bold = 1
" let g:neosolarized_underline = 1
" let g:neosolarized_italic = 0
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" colo Tomorrow-Night-Bright
" set background=dark
" colo calmar256-dark

" buftabline configuration
let g:buftabline_numbers = 2 	" show buffer position next to each buffer label
" use \1 to go to tab 1
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" set background=dark
"highlight Normal guibg=black guifg=white
" colorscheme NeoSolarized
"colorscheme lucius
"colorscheme onedark
colorscheme flatcolor
highlight Normal guibg=black
" highlight LineNr guibg=black
" highlight SignColumn guibg=black

" }}}

" Plugin configurations {{{

runtime! macros/matchit.vim

" let g:lightline = {
"       \ 'component': {
"       \   'readonly': '%{&readonly?"":""}',
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' }
"       \ }


" Auto-open NerdTree on all vims
" autocmd vimenter * NERDTree
let g:NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ "Unknown"   : "?"
			\ }
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.egg-info$', '\~$', '\.git$', '\.eggs']

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" toggle ag
if executable('ag')
	"let g:ackprg = 'ag --vimgrep'
	let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" nnoremap <leader>a :Ack!<enter>

" Visual mode pressing * or # searches for the current selection
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>

" Close the current buffer
:nnoremap <Leader>fq :Bdelete<CR>
" nnoremap <Leader>fc <Esc>:call CleanClose(1)<CR>
" nnoremap <Leader>fq <Esc>:call CleanClose(0)<CR>
" map <leader>bd :Bclose<cr>

"add a shortcut to insert pdb by doing \pdb
"now is \b
" map <Leader>pdb oimport pdb; pdb.set_trace()<Esc><CR>
map <leader>pdb oimport pdb; pdb.set_trace()<enter><esc>

" add a :DiffOrig command to see differences to last saved version
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

nnoremap <silent> <Leader>f :NERDTreeFind<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" use f2 to format an xml file
map <F2> <Esc>:1,$!xmllint --format -<CR>

" }}}

" File type based settings {{{
"

augroup configgroup
	autocmd!
" 	autocmd VimEnter * highlight clear SignColumn
"
" 	autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
"
" 	autocmd FileType xml setlocal foldmethod=syntax
" 	autocmd FileType xml setlocal shiftwidth=4 expandtab ts=4 smarttab
"
 	autocmd BufNewFile,BufRead *.pt setlocal filetype=html
	autocmd BufNewFile,BufRead *.vue setlocal filetype=html

	autocmd BufNewFile,BufRead *.zcml setlocal filetype=xml
"
" 	autocmd FileType java setlocal noexpandtab
" 	autocmd FileType java setlocal list
" 	autocmd FileType java setlocal listchars=tab:+\ ,eol:-
" 	autocmd FileType java setlocal formatprg=par\ -w80\ -T4
"
" 	autocmd FileType php setlocal expandtab
" 	autocmd FileType php setlocal list
" 	autocmd FileType php setlocal listchars=tab:+\ ,eol:-
" 	autocmd FileType php setlocal formatprg=par\ -w80\ -T4
"
 	autocmd Filetype html setlocal ts=2 sw=2 expandtab
"
" 	autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
" 	autocmd FileType ruby setlocal tabstop=2
" 	autocmd FileType ruby setlocal shiftwidth=2
" 	autocmd FileType ruby setlocal softtabstop=2
" 	autocmd FileType ruby setlocal commentstring=#\ %s
"
  	autocmd FileType python setlocal commentstring=#\ %s
  	autocmd Filetype python setlocal ts=4 sw=4 expandtab smarttab autoindent
  	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
  	autocmd FileType python match Excess /\%120v.*/
  	autocmd FileType python setlocal nowrap
  	autocmd FileType python setlocal foldlevel=99
  	autocmd VimEnter *.py nested TagbarOpen
" 	"
" 	" autocmd FileType python setlocal foldmethod=indent
" 	" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" 	" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" 	"autocmd FileType python setlocal foldlevelstart=1
"
" 	autocmd BufNewFile,BufRead *.css.dtml setlocal filetype=css
"
" 	autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
"
" 	autocmd BufEnter *.cls setlocal filetype=java
" 	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
" 	autocmd BufEnter Makefile setlocal noexpandtab
" 	autocmd BufEnter *.sh setlocal tabstop=2
" 	autocmd BufEnter *.sh setlocal shiftwidth=2
" 	autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}

" Custom functions {{{

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
	" save last search & cursor position
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction

function! VisualSelection(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

" }}}
 
" {{{ Airline configuration
"
let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" }}}




 
" To test for fullcolor support in terminal:
" awk 'BEGIN{
"     s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
"     for (colnum = 0; colnum<77; colnum++) {
"         r = 255-(colnum*255/76);
"         g = (colnum*510/76);
"         b = (colnum*255/76);
"         if (g>255) g = 510-g;
"         printf "\033[48;2;%d;%d;%dm", r,g,b;
"         printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
"         printf "%s\033[0m", substr(s,colnum+1,1);
"     }
"     printf "\n";
" }'
"
" Tmux
"
" Currently, vim can not work well in tmux. But neovim works perfect.
" If you meet a color issue when using tmux. Make sure:
"
"     using lastest tmux (v2.2)
"     your $TERM variable set to "xterm-256color"
"
"     add the line below to your .tmux.conf file.
"
"     set-option -ga terminal-overrides ",xterm-256color:Tc"
"
" "

" {{{ Stuff that's commented 
"
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" " insert mode - line 
" let &t_SI .= "<Esc>[5 q" 
" "replace mode - underline 
" "let &t_SR .= "<Esc>[4 q" 
" "common - block 
" let &t_EI .= "<Esc>[3 q"


" Don't close window, when deleting a buffer
" command! Bclose call <SID>BufcloseCloseIt()
" function! <SID>BufcloseCloseIt()
" 	let l:currentBufNum = bufnr("%")
" 	let l:alternateBufNum = bufnr("#")
"
" 	if buflisted(l:alternateBufNum)
" 		buffer #
" 	else
" 		bnext
" 	endif
"
" 	if bufnr("%") == l:currentBufNum
" 		new
" 	endif
"
" 	if buflisted(l:currentBufNum)
" 		execute("bdelete! ".l:currentBufNum)
" 	endif
" endfunction
"
"
" function! CleanClose(tosave)
" 	if (a:tosave == 1)
" 		w!
" 	endif
" 	let todelbufNr = bufnr("%")
" 	let newbufNr = bufnr("#")
" 	if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
" 		exe "b".newbufNr
" 	else
" 		bnext
" 	endif
"
" 	if (bufnr("%") == todelbufNr)
" 		new
" 	endif
" 	exe "bd".todelbufNr
" 	" call Buftabs_show()
" endfunction
"
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
" let g:pymode_rope = 0
"
" " Documentation
" let g:pymode_doc = 0
" let g:pymode_doc_key = 'K'
"
" "Linting
" let g:pymode_lint = 1
" let g:pymode_lint_message = 1
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" " let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" " Auto check on save
" let g:pymode_lint_write = 1
" "
" "   let g:pymode_lint_ignore = "E501,W"

" Support virtualenv
" let g:pymode_virtualenv = 0
"
" " Enable breakpoints plugin
" let g:pymode_breakpoint = 0
" let g:pymode_breakpoint_key = 'b'
"
" " syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Show leader guide for all key mappings
" Plug 'hecal3/vim-leader-guide'

" }}}
