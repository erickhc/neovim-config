" Fixes WSL weird black background
"set t_ut=

" Read inline vim config from file
set modeline

" Colorscheme
let g:airline_powerline_fonts=1
set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

" Vim leader maps
let mapleader = ' '

nnoremap <Leader>w :write<Cr>
nnoremap <Leader>x :xit<Cr>
nnoremap <Leader>q :quit<Cr>
nnoremap <Leader>Q :quit!<Cr>
nnoremap <Leader>a :qall<Cr>
nnoremap <Leader>A :qall!<Cr>
nnoremap <Leader>e :edit<Space>
nnoremap <Leader>z <C-z>
nnoremap <Leader><Cr> :noh<Cr>

" Fuzzy find
nnoremap <Leader>f :FZF<Cr>
nnoremap <leader>be :Buffers<Cr>
nnoremap <leader>/ :Lines<Space>

" Fuzzy find with ripgrep
nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>rw :Rg <C-R><C-W><Cr>

" Window leader maps
nnoremap <leader>v :vsplit<Cr>

" Buffer leader maps
nnoremap <leader>bn :bnext<Cr>
nnoremap <leader>bp :bprevious<Cr>
nnoremap <leader>b3 :b#<Cr>
nnoremap <leader>bd :bdelete<Space>

" Tabs
nnoremap <Leader>tw :tabnew<Cr>

" Terminal
nnoremap <Leader>te :terminal<Cr>
tnoremap jk <C-\><C-N>

" Prevent moving one character to the right if no command after space
nnoremap <Space> <nop>

" Command mappings to act like shell
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>b <S-Left>

" Improve experience
set number
set relativenumber
set wildignorecase

" Search
set ignorecase
set smartcase

" Ergonomics
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
inoremap JK <Esc>

nnoremap <expr> j (v:count > 1 ? 'j' : 'gj')
nnoremap <expr> k (v:count > 1 ? 'k' : 'gk')

" Always undo
set undofile

" Typescript support
autocmd BufNewFile,BufReadPre,FileReadPre *.{tsx,ts} packadd vim-jsx-typescript | packadd typescript-vim | set filetype=typescript.tsx
autocmd BufNewFile,BufReadPre,FileReadPre *.{jsx,js} packadd vim-jsx
" Solidity support
autocmd BufNewFile,BufReadPre,FileReadPre *.sol set filetype=solidity
" Babel support
autocmd BufNewFile,BufReadPre,FileReadPre .babelrc set filetype=json

" Fuzzy find
set rtp+=~/.fzf

" FZF
imap <C-X><C-F> <Plug>(fzf-complete-path)
imap <C-X><C-L> <Plug>(fzf-complete-line)

nmap <Leader><tab> <Plug>(fzf-maps-n)
xmap <Leader><tab> <Plug>(fzf-maps-x)
omap <Leader><tab> <Plug>(fzf-maps-o)

" Hide statusline when showing fzf results
autocmd FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Coc
" Prevent hiding and showing column
set signcolumn=yes
set hidden

set updatetime=300

" Show more info
set cmdheight=2
set shortmess+=c

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> <Leader>cd <Plug>(coc-definition)
nmap <silent> <Leader>cy <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>cr <Plug>(coc-references)

nmap <silent> <Leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>cn <Plug>(coc-diagnostic-next)

nmap <silent> <Leader>cc <Plug>(coc-rename)

nmap <Leader>cfl <Plug>(coc-codeaction)
nmap <Leader>cfc <Plug>(coc-fix-current)

if filereadable(".vimrc")
	source .vimrc
endif
