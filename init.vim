" Fixes WSL weird black background
"set t_ut=

" Read inline vim config from file
set modeline

" Colorscheme
"let g:airline_powerline_fonts=1
set termguicolors
set background=dark
"let g:gruvbox_italic=1
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
nnoremap <Leader>s :split<Cr>

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

set shortmess+=wrI

" Search
set ignorecase
set smartcase
set incsearch

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
autocmd BufNewFile,BufReadPre,FileReadPre *.{tsx,ts} set filetype=typescript.tsx "packadd vim-jsx-typescript | packadd typescript-vim | 
autocmd Filetype typescript,rust,typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufNewFile,BufReadPre,FileReadPre *.tig set filetype=tiger
autocmd BufNewFile,BufReadPre,FileReadPre *.em set filetype=emerald
autocmd BufNewFile,BufReadPre,FileReadPre *.{jsx,js} packadd vim-jsx
" Solidity support
autocmd BufNewFile,BufReadPre,FileReadPre *.sol set filetype=solidity
" Babel support
autocmd BufNewFile,BufReadPre,FileReadPre .babelrc set filetype=json

" FZF
imap <C-X><C-F> <Plug>(fzf-complete-path)
imap <C-X><C-L> <Plug>(fzf-complete-line)

nmap <Leader><tab> <Plug>(fzf-maps-n)
xmap <Leader><tab> <Plug>(fzf-maps-x)
omap <Leader><tab> <Plug>(fzf-maps-o)

" Hide statusline when showing fzf results
autocmd FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Prevent hiding and showing column
set signcolumn=yes
set hidden

set shortmess+=c

if filereadable(".vimrc")
	source .vimrc
endif

"let g:python3_host_prog="/usr/bin/python3"

set rtp+=~/.fzf

" LSP

lua << EOF
local lspconfig = require'lspconfig'

lspconfig.rust_analyzer.setup{
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
	settings = {
		["rust-analyzer"] = {},
	},
}

lspconfig.tsserver.setup{
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
}
EOF

nnoremap <silent> <Leader>cd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>cD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>ck <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>cr <cmd>lua vim.lsp.buf.references()<CR>
inoremap <silent> <C-Space> <C-X><C-O>
nnoremap <silent> <Leader>cc <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <Leader>cfc <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>cn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <Leader>cp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
