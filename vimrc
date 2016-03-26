"Tom Corcoran
"24 March 2016
".vimrc 1.0

"For C and Python hacking.
"**********************************

"This loads pathogen from the non-default directory that I have it in.
"Instead of being installed in .vim/autoload/ I have it installed to
".vim/bundle/pathogen/ as a submodule so that I can update pathogen 
"itself via the same mechanism as all other plugins.
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

"This activates the single modeline @ the end of the file.
set modeline 

"Leader and Save{{{
let mapleader="," "Changes the leader key from default backslash.
"The next one is a 'super save', which allows for the saving of an
"entire vim session, multiple windows, etc, so they can be reopened
"using 'vim -S'.
nnoremap <leader>s :mksession<CR> 
"}}}
"Line Numbers, Syntax, Colorsheme{{{
set number "Shows line numbers.
syntax enable "Enables syntax processing.
set background=dark "Sets the background to dark mode.
set t_Co=256 "Better color support. NOTE: This isn't ideal.
"Degraded colorscheme due to no solarized support in MATE term.
"let g:solarized_termcolors=256 
colorscheme solarized "The colorscheme.
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
set tabstop=8 "Number of spaces TABs are represented as in read files.
set softtabstop=4 "Number of spaces generated when you press TAB.
set expandtab "This makes TAB generate the four spaces specified above.
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
