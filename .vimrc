call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
"================================================================================="
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/jmcantrell/vim-virtualenv'
Plug 'Yggdroot/indentLine'
"autocomplete for python "
Plug 'https://github.com/davidhalter/jedi-vim.git'

"autocomplete for c"
Plug 'https://github.com/xavierd/clang_complete.git'
Plug 'cwfoo/vim-text-omnicomplete', { 'do': 'make' }
Plug 'preservim/nerdcommenter'
Plug 'xolox/vim-easytags', { 'frozen': 1 }
"Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs', { 'frozen': 1 }
Plug 'webastien/vim-ctags',{ 'frozen': 1 }
Plug 'vim-scripts/taglist.vim',{ 'frozen': 1 }
Plug 'xolox/vim-misc',{ 'frozen': 1 }
"autocomplete for javascript"
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }

" path to directory where library can be found "
"let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_library_path='C:\Program Files\LLVM\bin\'

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"let g:NERDTreeFileNode.GetSelected()
"let s:tlist_def_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;' . 
"                              \ 'c:class;g:enum;s:struct;u:union;f:function;m:member;' .
"                                 \ 'p:prototype'


let g:indentLine_enabled = 1
"let g:expandtab =1
"let g:shiftwidth=4
"let g:smartindent=1
:set number
:set expandtab
:set shiftwidth=4
:set smartindent

let g:indentLine_setColors = 0
let g:indentLine_char = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_solarized_bg='light'
let g:airline_symbols = {}
if !exists('g:airline_symbols')
    let g:airline_symbols = {}

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '?'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '?'
    let g:airline_symbols.crypt = '??'
    let g:airline_symbols.linenr = '?'
    let g:airline_symbols.linenr = '?'
    let g:airline_symbols.linenr = '?'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '?'
    let g:airline_symbols.branch = '?'
    let g:airline_symbols.paste = '?'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '?'
    let g:airline_symbols.spell = '?'
    let g:airline_symbols.notexists = '?'
    let g:airline_symbols.whitespace = '?'

    " powerline symbols
    let g:airline_left_sep = '?'
    let g:airline_left_alt_sep = '?'
    let g:airline_right_sep = '?'
    let g:airline_right_alt_sep = '?'
    let g:airline_symbols.branch = '?'
    let g:airline_symbols.readonly = '?'
    let g:airline_symbols.linenr = '?'
    let g:airline_symbols.maxlinenr = '?'
endif








"=======================================================================================
"function! DelTagOfFile(file)
"  let fullpath = a:file
  "let cwd = getcwd()
  "let tagfilename = cwd . "/tags"
  "let f = substitute(fullpath, cwd . "/", "", "")
  "let f = escape(f, './')
  "let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  "let resp = system(cmd)
"endfunction

"function! UpdateTags()
"  let f = expand("%:p")
"  let cwd = getcwd()
"  let tagfilename = cwd . "/tags"
"  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
"  call DelTagOfFile(f)
"  let resp = system(cmd)
"endfunction
autocmd BufWritePost *.cpp,*.hpp,,*.h,*.c call UpdateTags()


" Save session on quitting Vim
" autocmd VimLeave * NERDTreeClose
" autocmd VimLeave * mksession! [filename]

" Restore session on starting Vim
"autocmd VimEnter * call MySessionRestoreFunction()
"autocmd VimEnter * NERDTree"







"=======================================================================================
"let g:tags="tags,tags;"
"filetype plugin on

" Initialize plugin system
call plug#end()
