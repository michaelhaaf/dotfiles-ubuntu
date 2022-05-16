" --- [ Snippets ] ---

" Move to the next placeholder
inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
" Heading
inoremap <buffer> ,1 # <Enter><++><Esc>kA
inoremap <buffer> ,2 ## <Enter><++><Esc>kA
inoremap <buffer> ,3 ### <Enter><++><Esc>kA
inoremap <buffer> ,4 #### <Enter><++><Esc>kA
inoremap <buffer> ,5 ##### <Enter><++><Esc>kA
" Bold
inoremap <buffer> ,b ****<++><Esc>F*hi
" Strikethrough
inoremap <buffer> ,s ~~~~<++><Esc>F~hi
" Emphasis (italic)
inoremap <buffer> ,e **<++><Esc>F*i
" Code
inoremap <buffer> ,` ``<++><Esc>F`i
" Horizontal rule
inoremap <buffer> ,h ---<Enter><Enter>
" Link
inoremap <buffer> ,a [](<++>)<++><Esc>F[a
" Image
inoremap <buffer> ,i ![](<++>)<++><Esc>F[a
" Code block
inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
" Task
inoremap <buffer> ,t - [] <++><Esc>F[a

" --- [ Plugin config ] ---

" vim-instant-markdown

let g:instant_markdown_autostart = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
let g:instant_markdown_browser = "safari"

nnoremap <silent> \m :call markdown#TogglePreview()<CR>
