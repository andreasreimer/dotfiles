" Dashboard - Startup Screen " Plugin to run R Code in Neovim
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'jalvesaq/vimcmdline'

Plug 'POPE/vim-commentary'
Plug 'POPE/vim-surround'
" Vim games
Plug 'ThePrimeagen/vim-be-good'

Plug 'kshenoy/vim-signature'
Plug 'chrisbra/csv.vim'


for libr     
for libr     
for libr     
" AR Setup to Nvim-R
"

" start R with F2 key
<!-- map <F2> <Plug>RStart --> 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" R version can be specified like this:
" let vimrplugin_r_path = "/opt/R/3.1.2-release/bin/R"
" Send selection or line to R with space bar, respectively.
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Shortcut for R's assignment operator: 0 turns it off; 1 assigns underscore; 2 assigns two underscores
let R_assign = 2


" Use Ctrl-Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>

" The following provides a zoom functionality, similar to Tmux's Ctrl-a z, by pressing 'gz' in normal mode. 
function ZoomWindow()
        let cpos = getpos(".")
        tabnew %
        redraw
        call cursor(cpos[1], cpos[2])
        normal! zz
    endfunction
    nmap gz :call ZoomWindow()<CR>


syntax enable
colorscheme dracula


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
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




" Use github copilot
Plug 'github/copilot.vim'

