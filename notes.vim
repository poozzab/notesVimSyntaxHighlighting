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

"soliloquy
syn match soliloquy /(.*)/

" Subject line for the proceeding section
" Terminated with :
syn match subjectLine /.*:\n/ contains=numberLiteral,substring,soliloquy

" A comment made with respect to the previous line
syn match relatedCommentLine /\V\->\.\*\n/ contains=numberLiteral,substring,soliloquy

" Comments, at least 4 spaces and then a -
syn match commentLine /[ ]\{4,\}-\+[^>].*\n/ contains=numberLiteral,substring,soliloquy
syn match queryLine "\V?\.\*?" contains=numberLiteral,substring,soliloquy
syn match statementLine /!!.*!!/ contains=numberLiteral,substring,soliloquy

" For school note taking, define a concept and a definition
syn match conceptDefinition /#.*:=\_[^#]*#/ contains=concept,definition
syn match concept /#.*:/ containedin=conceptDefinition contained 
syn match definition /=\_[^#]*#/ containedin=conceptDefinition contained contains=numberLiteral,soliloquy

highlight numberLiteral ctermfg=Cyan guifg=#00ffff
highlight subjectLine ctermfg=Blue  guifg=#0000ff
highlight relatedCommentLine ctermfg=Yellow guifg=#c4ad00
highlight commentLine ctermfg=Green guifg=#1f9901
highlight queryLine ctermfg=Brown guifg=#d34545
highlight substring ctermfg=LightBlue guifg=#00afaa
highlight soliloquy ctermfg=Grey guifg=#c4c4c4
highlight statementLine ctermfg=Red guifg=#d10404
highlight concept ctermfg=DarkGreen 
highlight definition ctermfg=DarkBlue 


let b:current_syntax = "notes"
