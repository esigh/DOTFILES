syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set statusline+=%F

set clipboard=unnamedplus

" turn hybrid line numbers on
set number relativenumber
set nu rnu

set backspace=indent,eol,start

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey        

call plug#begin('~/.vim/plugged')
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'davidhalter/jedi-vim'
Plug 'liuchengxu/vista.vim' 
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpict/vim-ftplugin-python'
Plug 'jalvesaq/vimcmdline'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-startify'            " A start menu for vim
Plug 'fisadev/vim-isort'             " Python sort impcrts [dep]: pip3 install isort
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'        " shows git changes in gutter
Plug 'goerz/jupytext.vim'
Plug 'untitled-ai/jupyter_ascending.vim'
Plug 'airblade/vim-rooter'
call plug#end()

colorscheme gruvbox
set background=dark


if executable('rg')
    " execute('echo "here"')
    let g:rg_derive_root='true'
    let g:FZF_DEFAULT_COMMAND='rg --files'
    let g:FZF_DEFAULT_OPTS='--multi --height 50% --border --extended'
    "Side note: FZF.vim :Rg option also searches for file name in addition to the phrase
    "https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
    command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
    " Vim allows us to change the program used by :grep. We can tell Vim to use ripgrep instead of grep by adding this inside our vimrc
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240


let mapleader = "\<space>"
let maplocalleader = "\\" 

" vim-rooter: what pattern to use to find the root project directory:
" to specify the root has a certain directory or file (which may be a glob), just give the name:
let g:rooter_patterns = ['env/']

"easy escape in normal
inoremap jk <Esc>
"similar thing in terminal mode
tnoremap jk <C-\><C-n>

"also add Esp to get out of terminal
tnoremap <Esc> <C-\><C-n>

" Minimal but useful vimrc example (directly from https://github.com/easymotion/vim-easymotion):
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" jupytext.vim options
let g:jupytext_fmt = 'py:percent'

" jupyter_ascending
nmap <space><space>x <Plug>JupyterExecute

""disable arrow keys in non-insert mode 
"" actually changed them to resize split windows
" noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

"fzf shortcuts
noremap <leader>f :Files<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>w :Windows<CR>

"vim-maximizer
nnoremap <silent><leader>mm :MaximizerToggle<CR>
vnoremap <silent><leader>mm :MaximizerToggle<CR>gv
inoremap <silent><leader>mm <C-o>:MaximizerToggle<CR>

" Start terminals for Python sessions '\tr'
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k

" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" Show just the filename
" :let g:airline#extensions#tabline#fnamemod = ':t'


" let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:netrw_browse_split=2
" let g:netrw_banner = 0
" let g:netrw_winsize = 25
" let g:ctrlp_use_caching = 0

" vim-isort 
let g:vim_isort_map = '<C-i>i'

" gitgutter
let g:gitgutter_async=0
set updatetime=100              " set update time for gitgutter update


" let g:slime_target = "tmux"
" let g:slime_paste_file = "$HOME/.slime_paste"

" let g:slime_cell_delimiter = "#%%"
" nmap <leader>z <Plug>SlimeSendCell
" let g:slime_python_ipython = 1                                                     

" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let cmdline_term_height = 15
"let g:cmdline_in_buffer = 0
let g:cmdline_app = {"python": "ipython --no-autoindent"}
let cmdline_tmux_conf = "~/vimcmdline_tmux.conf"
let cmdline_app           = {}
let cmdline_app['python']     = 'ipython'

let NERDTreeShowHidden=0
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <Right> :vertical resize +3<CR>
noremap <silent> <Left> :vertical resize -3<CR>
noremap <silent> <Up> :resize -3<CR>
noremap <silent> <Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" Start terminals for Python sessions '\tr'
" this is useless actually, since it doesn't load the env variables
" automatically
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k

"  this are  from https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>B :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
" I like to use :Buffers from fzf package instead of this
" nmap <leader>bl :ls<CR>


" all bellow are for coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename) "warning: only changes in the open buffers
nnoremap <leader>rn :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Formatting selected code.
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


