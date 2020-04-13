" Vim syntax file
" Language: Feather
" Maintainer: Erick Hernandez Curiel
" Latest Revision: 2020-03-04

if exists("b:current_syntax")
	finish
endif

" Keywords
syn keyword featherKeyword def nextgroup=featherFuncName skipwhite skipempty
syn keyword featherKeyword begin end
syn keyword featherKeyword let
syn keyword featherKeyword then
syn keyword featherKeyword is
syn keyword featherConditional if else

" Identifiers
syn match featherFuncName "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:space:][:punct:]]\|_\)*" display contained

" String
syn region featherString start=/"/ skip=/\\"/ end=/"/
syn region featherString start=/`/ skip=/\\`/ end=/`/

" Number literals
syn match featherDecNumber display "\<[0-9]+\="

hi def link featherKeyword Keyword
hi def link featherConditional Conditional
hi def link featherString String
hi def link featherDecNumber Number
hi def link featherFuncName Function

let b:current_syntax = "feather"
