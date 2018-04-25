"*****************************************************************************
"Tom Corcoran
"25 April 2018
".vimrc Version 1.1

"For C, Python, and mind hacking.
"*****************************************************************************

"Feb 2018 - TO DO: 
"   
"   1) writing setup - new augroup / function
"   2) ctrlP, youcompleteme, auto list generator? 
"   4) separate ft files 
"   5) move over to ~/.dotfiles/ along with the rest
"   6) look into calling external shell for python execution (for GVim)
"   7) latex support

"Loads pathogen from .vim/bundle/pathogen/ instead of from .vim/autoload/. 
"Its installed as a submodule, so it can be updated via the same mechanism 
"as all other plugins.
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

"This activates the single modeline @ the end of the file.
set modeline 

"Syntastic{{{
"These are the recommended settings from the Syntastic github README.
"I need to look more closely at these and comment.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <F8> :SyntasticReset <CR>
map <F7> :SyntasticCheck <CR>
"}}}
"Airline{{{
set laststatus=2 "See :h laststatus. Makes all windows have status line.
let g:airline#extensions#syntastic#enabled = 1 "Syntastic integration.
"}}}
"Character Encoding{{{
set encoding=utf-8 "Important for python3 and web.
"}}}
"Leader and Save{{{
let mapleader="," "Changes the leader key from default backslash.
"The next one is a 'super save', which allows for the saving of an
"entire vim session, multiple windows, etc, so they can be reopened
"using 'vim -S'.
nnoremap <leader>s :mksession<CR> 
"}}}
"Line Numbers, Syntax, Colorsheme{{{
set number "Shows line numbers.
set relativenumber "Sets line numbers to relative mode.
syntax enable "Enables syntax processing.
set background=dark "Sets the background to dark mode by default.
colorscheme gruvbox "The colorscheme.
"set t_Co=256 "Better color support. NOTE: This isn't ideal.
"For Molokai only. Attempts to bring 256 term version close to GUI colors. 
"let g:rehash256=1
"let g:molokai_original=1
"The following function toggles the background light / dark. 
"See: https://www.ibm.com/developerworks/library/l-vim-script-1/index.html
"for excellent variable scoping and function info. E.g., 'g:foo' is global.
let g:bg_mode = "dark"
function! Toggle_BG()
    if g:bg_mode == "dark"
        set background=light
        let g:bg_mode = "light"
    else
        set background=dark
        let g:bg_mode = "dark"
    endif
endfunction
map <F5> :call Toggle_BG()<CR>
"}}}
"UI Configuration{{{
set showcmd "Shows last command entered @ bottom right of editor.
set cursorline "Highlights/underlines the line where the cursor is.
set showmatch "Highlight matching for [{()}].
set lazyredraw "Tells vim to redraw the screen only when essential.
filetype plugin indent on "Loads ftplugins and indent scripts.
set mouse=a "Mouse mode.
"}}}
 "Folding{{{
set foldenable "Enables folding.
set foldlevelstart=20 "A conservative fold level, range is 0 to 99.
set foldnestmax=10 "Sets max # of folds to 10, prevents insanity.
set foldmethod=indent "Folds get generated based on indentation level.
nnoremap <space> za
"}}}
"Spaces & Tabs{{{
set smarttab
set autoindent "Taken from S.O. suggestions for 'smart tabbing'.
set tabstop=4 "Number of spaces TABs are represented as in read files.
set softtabstop=4 "Number of spaces generated when you press TAB.
set shiftwidth=4 "Controls the depth of autoindentation - needed?
set expandtab "This makes TAB generate the four spaces specified above.
set textwidth=79 "Setting the max line length to 79 chars.
set fileformat=unix "UNIX file format helps with GitHub integration.
set nowrap "Disables word wrapping.
"}}}
"Window Split Navigation Remaps{{{
"Remaps <C-W><C-(movement)> to <C-(movement)> in normal mode.
"This just makes moving between window splits easier.
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-w><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Specifies the behavior of new splits.
set splitbelow
set splitright 
"Handling vim tabs. ':tabe /path/to/file' adds a new tab.
nnoremap <F3> :tabp <CR>
nnoremap <F4> :tabn <CR>
"}}}
"Search Settings{{{
set incsearch "Searches incrementally as you enter characters.
set hlsearch "Highlights found matches.
"This last one allows turning off the highlighted matches from search
"by simply typing <leader><space> instead of manually disabling via
"nohlsearch.
nnoremap <leader><space> :nohlsearch<CR>
"}}}
"Autogroups{{{
augroup python
    "Clears all autocmds for current group.
    autocmd! 
    "Maps python script execution to <F6>.
    "See the below link for more details:
    "https://stackoverflow.com/questions/601039/vim-save-and-run-at-the-same-time
    autocmd FileType python 
        \ nnoremap <buffer> <F6> : exec <ESC>:w<CR>: exec '!python3 %:p'<CR>
        "\ shellescape(@%, 1)<cr>
augroup END
augroup c
    "Clears all autocmds for current group.
    autocmd! 
    "Maps c save, compile, and execution to <F5>.
    "Saves file with proper name, compiles with warnings, executes.
    "Note: < removes the file extension (i.e. '.c').
    autocmd FileType c
        \ nnoremap <buffer> <F5> :w<CR>:!clear; gcc % -Wall -o %< && ./%< <CR>
augroup END
 "}}} 
"Misc.{{{
"1st line below sets <F2> to invert the paste option in normal mode and shows
"the value of that option. The second line allows <F2> to toggle paste on and
"off in insert mode. Third line displays if 'paste' is on in normal mode. 
"See: http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
"set showmode
"}}}

"Modeline, enables section folding.
" vim:foldmethod=marker:foldlevel=0 
