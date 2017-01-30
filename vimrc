"*****************************************************************************
"Tom Corcoran
"29 Jan. 2017
".vimrc Version 1.1

"For C, JavaScript, and Python hacking.
"*****************************************************************************

"Jan 2017: TO DO: ctrlP, youcompleteme, separate ft files, new colors, move
"over to ~/.dotfiles/ along with the rest. 

"This loads pathogen from the non-default directory that I have it in.
"Instead of being installed in .vim/autoload/ I have it installed to
".vim/bundle/pathogen/ as a submodule so that I can update pathogen 
"itself via the same mechanism as all other plugins.
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
"set background=dark "Sets the background to dark mode.
colorscheme desert "The colorscheme.
set t_Co=256 "Better color support. NOTE: This isn't ideal.
"Degraded colorscheme for when no solarized support is available.
"let g:solarized_termcolors=256 
"call togglebg#map('<F5>') "Change solarized bg light/dark with <F5>.
"}}}
"UI Configuration{{{
set showcmd "Shows last command entered @ bottom right of editor.
set cursorline "Highlights/underlines the line where the cursor is.
set showmatch "Highlight matching for [{()}].
set lazyredraw "Tells vim to redraw the screen only when essential.
filetype plugin indent on "Loads ftplugins and indent scripts.
"}}}
 "Folding{{{
set foldenable "Enables folding.
set foldlevelstart=20 "A conservative fold level, range is 0 to 99.
set foldnestmax=10 "Sets max # of folds to 10, prevents insanity.
set foldmethod=indent "Folds get generated based on indentation level.
"This last one remaps the open/close fold command from za to space.
nnoremap <space> za
"}}}
"Spaces & Tabs{{{
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
    "Maps python script execution to <F9>.
    autocmd FileType python 
        \ nnoremap <buffer> <F9> : exec '!python3'
        \ shellescape(@%, 1)<cr>
augroup END
"}}}

"Modeline, enables section folding.
" vim:foldmethod=marker:foldlevel=0 
