set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
let $LANG = 'en_US' "sets the language of the UI

set background=dark

"
"===================================================================
" THE NECESSARY STUFF" for VimOrganizer
" =================================================================
let g:ft_ignore_pat = '\.org'
filetype plugin indent on
" and then put these lines in vimrc somewhere after the line above
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()
"let g:org_command_for_emacsclient = "emacsclientw.exe"
"let g:org_agenda_files = split(glob("~/Dropbox/OrgNotes/*.org"),"\n")
let g:agenda_files = split(glob("~/Dropbox/OrgNotes/*.org"),"\n")
"let g:org_agenda_dirs=["c:/Users/paixao/Dropbox/OrgNotes"]
let g:org_agenda_select_dirs=["c:/Users/paixao/Dropbox/OrgNotes"]

""""""""""""""""""""""""""""""
""""""" MY OPTIONS
""""""""""""""""""""""""""""""

"colorscheme
set nocompatible
"colorscheme koehler
syntax enable
"display unicode
set encoding=utf-8

"proper tab completion
set wildmode=longest,list,full
set wildmenu

"set visual wrap
set wrap
set linebreak
set showbreak=>
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
"disable hard line breaks
set formatoptions-=t
"make travelling behave normally
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
"easy out of insert mode
inoremap jj <Esc>
inoremap kk <Esc>
"make switching between buffers easier:
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>
"set hidden " this will go along
" set leader key to somthing easier
let mapleader = ","
"insert new lines in normal mode 
""map <S-Enter> O<Esc>
"stop typing shift for Ex commands (:)
nnoremap ; :

" 
set laststatus=2
" get rid of the toolbar
set guioptions-=T

"set nolist
set ignorecase smartcase gdefault "makes searching better and replacing always use the global attribute
syntax on
set incsearch
set shiftwidth=2
set tabstop=2
set smarttab autoindent
set hlsearch "This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%04l\L,%04v\C][%p%%]\ [%L\ lines] 
map <C-Down> ddp
map <C-Up> dd<Up>P

"make searches center the screen
nmap n nzz
nmap N Nzz
nmap <space> zz

"abreviations==========
"insert date and time
iab <expr> dts strftime("%c")

""" my filetype option 
augroup filetypedetect
		"make .md => markdown (instead of modula2)
    au BufRead,BufNewFile *.md set filetype=markdown
		"make .tag (riotJS) => html (or javascript?)
    au BufRead,BufNewFile *.tag set filetype=html
augroup END

call pathogen#infect()
call pathogen#helptags()



""""""""""""""""""""""""""""""
""""""" Plugin Configuration
""""""""""""""""""""""""""""""
"
" colorschemes
set background=dark
"colorscheme solarized
colorscheme molokai



" Unite keybindings
nnoremap <leader>uf :Unite file<CR>
nnoremap <leader>ub :Unite buffer<CR>
nnoremap <leader>ur :Unite register<CR>
nnoremap <leader>uw :Unite window:no-current<CR>
nnoremap <leader>ul :Unite line<CR>

"map key for tagbar
nmap <leader>t :TagbarToggle<CR>
"map key to run ctags on the current directory
"map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"jump between closed folds
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

"""""""""""""""" 
"""""""Airline/lightline
""""""""""""""""
"let g:Powerline_symbols='compatible'

	if has("gui_running")
		set guioptions-=e
		if has("gui_gtk2")
			"set guifont=Luxi\ Mono\ 12
			set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
		elseif has("x11")
			" Also for GTK 1
			"set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
			set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
		elseif has("gui_win32")
			"set guifont=Luxi_Mono:h12:cANSI
			set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
		else
			set guifont=DejaVu\ Sans\ Mono\ 12
		endif
	else
		set t_Co=256
	endif

""" Lightline
set showtabline=2
let g:lightline = { 'separator': { 'left': '', 'right': '' }, 'subseparator': { 'left': '', 'right': '' } }
	
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['none']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

"set guifont=dejavu_sans_mono:h12
"set guifont=Consolas:h15
"set guifont=Inconsolata:h11
"set guifont=Anonymice\ Powerline:h11
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
"set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11
"set guifont=Inconsolata\ for\ Powerline:h12
"let g:Powerline_symbols='compatible'
let g:airline_powerline_fonts=1
let g:airline_section_warning=''
let g:airline_extensions = ['tabline']
"let s:show_buffers=1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"options for the notes plugin
"see more at peterodding.com/code/vim/notes
let g:notes_unicode_enabled = 0
if has("win64") || has("win32") || has("win16")
	let g:notes_directories=['~\Dropbox\Notes']
	let g:notes_suffix='.txt'
	let g:notes_tagsindex='~\Dropbox\Notes\tags.txt'
else
	let g:notes_directories=['~/Dropbox/Notes']
	let g:notes_suffix='.txt'
	let g:notes_tagsindex='~/Dropbox/Notes/tags.txt'
endif
"define a command to list all notes
command ListNotes execute "e ".g:notes_directories[0] 

"options for Voom
let g:voom_ft_modes = {'notes': 'markdown', 'markdown': 'markdown', 'tex': 'latex','org': 'org'}
"let g:voom_return_key = "<C-Return>"
"let g:voom_tab_key = "<C-Tab>"

" make Vim behave in windows
"if has("win64") || has("win32") || has("win16")
	"source $VIMRUNTIME/mswin.vim
	""" use this instead
	if has("clipboard")
		" CTRL-X and SHIFT-Del are Cut
		vnoremap <C-X> "+x
		vnoremap <S-Del> "+x

		" CTRL-C and CTRL-Insert are Copy
		vnoremap <C-C> "+y
		vnoremap <C-Insert> "+y

		" CTRL-V and SHIFT-Insert are Paste
		map <C-V>		"+gP
		map <S-Insert>		"+gP

		cmap <C-V>		<C-R>+
		cmap <S-Insert>		<C-R>+
	endif
	"behave mswin
"endif

"Options for LatexBox
let g:LatexBox_fold_automatic=0
let g:LatexBox_Folding=1
let g:LatexBox_quickfix=4
nmap <leader>ce <Plug>LatexChangeEnv
vmap <leader>lw <Plug>LatexWrapSelection
vmap <leader>lW <Plug>LatexEnvWrapSelection
if has("win64") || has("win32") || has("win16")
	let g:LatexBox_viewer="PDFXCview.exe /A nolock=yes=OpenParameters"
endif

"Options for viki and vikitasks
"let g:vikitasks#files = ["/Dropbox/OrgNotes/*.org"]
let g:vikitasks#files = ["C://Users/paixao/Dropbox/OrgNotes/*.org"]

