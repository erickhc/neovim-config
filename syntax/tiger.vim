" Vim syntax file
" Language: Tiger
" Maintainer: Erick Hernandez Curiel
" Latest Revision: 2020-05-17

if exists("b:current_syntax")
	finish
endif

" Keywords
syn keyword tigKeyword let in end of import
syn keyword tigDeclaration var nextgroup=tigVarName skipwhite skipempty
syn keyword tigFunction function primitive nextgroup=tigFunctionName,tigFunctionNameError skipwhite skipempty
syn keyword tigType type array
syn keyword tigObject class extends new method
syn keyword tigConditional if then else
syn keyword tigLoop for to do while break
syn keyword tigNil nil
syn keyword tigPrimitives int string

" Integer with - + or nothing in front
syn match tigInteger '\d\+'
syn match tigInteger '[-+]\d\+'

" Comments
syn region tigComment start="/\*" end="\*/" contains=tigCommentTodo,tigComment extend
syn keyword tigCommentTodo TODO FIXME TBD contained

" Let expression
syn region tigLetIn start="let" end="in" fold transparent
syn region tigInEnd start="in" end="end" fold transparent

" Function
" Function name
syn match tigFunctionNameError /[a-zA-Z0-9_][a-zA-Z0-9_]*/ display contained
syn match tigFunctionName /_main/ display contained nextgroup=tigFunctionNameError
syn match tigFunctionName /\%([a-zA-Z][a-zA-Z0-9_]*\)/ display contained

" Var name
syn match tigVarName /[a-zA-Z][a-zA-Z0-9_]*/ display contained skipwhite skipempty

" String
syn region tigString start=/"/ skip=/\\"/ end=/"/

" Coloring
hi def link tigKeyword Keyword
hi def link tigDeclaration Keyword
hi def link tigFunction Keyword
hi def link tigType Keyword
hi def link tigObject Keyword
hi def link tigLoop Keyword
hi def link tigConditional Conditional
hi def link tigFunctionName Function
hi def link tigString String
hi def link tigInteger Number
hi def link tigComment Comment
hi def link tigCommentTodo Todo
hi def link tigNil Type
hi def link tigPrimitives Type
hi def link tigFunctionNameError Error

let b:current_syntax = "tiger"
