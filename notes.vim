" Vim syntax file
" Language: Personal Notes files
" File types intended to be supported: .IGNOREME, .notes, .info
" Maintainer: Daniel Barker
" Latest Revision 11 April 2018

" Quit if a syntax file is already loaded
if exists("b:current_syntax")
    finish
endif

" Numbers
syn match numberLiteral /[0-9]\+/
syn match numberLiteral /[+-]\=[0-9]\+\.[0-9]\+/

syn match substring /\".*\"/

"soliloquey
syn match soliloquey /(.*)/

" Subject line for the proceeding section
" Initiated with # or terminated with :
syn match subjectLine /\V#\.\*/ contains=numberLiteral,substring,soliloquey
syn match subjectLine /.*:\n/ contains=numberLiteral,substring,soliloquey

" A comment made with respect to the previous line
syn match relatedCommentLine /\V\->\.\*\n/ contains=numberLiteral,substring,soliloquey

" Comments, at least 4 spaces and then a -
syn match commentLine /[ ]\{4,\}-\+[^>].*\n/ contains=numberLiteral,substring,soliloquey
syn match queryLine "\V?\.\*?" contains=numberLiteral,substring,soliloquey

highlight numberLiteral ctermfg=Cyan guifg=#00ffff
highlight subjectLine ctermfg=Blue  guifg=#0000ff
highlight relatedCommentLine ctermfg=Yellow guifg=#c4ad00
highlight commentLine ctermfg=Green guifg=#1f9901
highlight queryLine ctermfg=Red guifg=#d10404
highlight substring ctermfg=LightBlue guifg=#00afaa
highlight soliloquey ctermfg=Grey guifg=#c4c4c4

let b:current_syntax = "notes"
