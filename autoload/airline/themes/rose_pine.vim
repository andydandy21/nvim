" Minimal Rosé Pine theme for vim-airline (truecolor)
if exists('g:loaded_airline_theme_rose_pine')
  finish
endif
let g:loaded_airline_theme_rose_pine = 1

let g:airline#themes#rose_pine#palette = {}

" ---- Rosé Pine (main) palette ----
let s:base     = '#191724'
let s:surface  = '#1f1d2e'
let s:overlay  = '#26233a'
let s:text     = '#e0def4'
let s:muted    = '#6e6a86'
let s:foam     = '#9ccfd8'
let s:iris     = '#c4a7e7'
let s:gold     = '#f6c177'
let s:love     = '#eb6f92'

" To make the bar transparent instead, set some guibg to 'NONE' below.

" Arrays are [guifg, guibg, ctermfg, ctermbg]
let s:N1 = [ s:base, s:foam, 0, 0 ]     " mode
let s:N2 = [ s:text, s:overlay, 0, 0 ]  " mid
let s:N3 = [ s:text, s:base, 0, 0 ]     " right
let g:airline#themes#rose_pine#palette.normal  = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1 = [ s:base, s:iris, 0, 0 ]
let g:airline#themes#rose_pine#palette.insert  = airline#themes#generate_color_map(s:I1, s:N2, s:N3)

let s:V1 = [ s:base, s:gold, 0, 0 ]
let g:airline#themes#rose_pine#palette.visual  = airline#themes#generate_color_map(s:V1, s:N2, s:N3)

let s:R1 = [ s:base, s:love, 0, 0 ]
let g:airline#themes#rose_pine#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)

let s:IA = [ s:muted, s:surface, 0, 0 ]
let g:airline#themes#rose_pine#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Optional: command-line mode styling
let g:airline#themes#rose_pine#palette.commandline =
      \ airline#themes#generate_color_map([s:base, s:gold, 0, 0], s:N2, s:N3)
