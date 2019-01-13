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
syn match soliloquy /([^()]*)/

" Subject line for the proceeding section
" Terminated with :
syn match subjectLine /.*:\n/ contains=numberLiteral,substring,soliloquy,trailingSpaces

" A comment made with respect to the previous line
syn match relatedCommentLine /\V\->\.\*\n/ contains=numberLiteral,substring,soliloquy,trailingSpaces

" Comments, at least 4 spaces and then a -
syn match commentLine /[ ]\{4,\}-\+[^>].*\n/ contains=numberLiteral,substring,soliloquy,trailingSpaces
syn match queryLine "\V?\.\*?" contains=numberLiteral,substring,soliloquy,trailingSpaces
syn match statementLine /!!.*!!/ contains=numberLiteral,substring,soliloquy,trailingSpaces

" For school note taking, define a concept and a definition
syn match conceptDefinition /#.*:=\_[^#]*#/ contains=concept,definition
syn match concept /#.*:/ containedin=conceptDefinition contained
syn match definition /=\_[^#]*#/ containedin=conceptDefinition contained contains=numberLiteral,soliloquy,trailingSpaces

" I hate trailing white space
syn match trailingSpaces /[[:space:]]\+$/

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
highlight trailingSpaces ctermbg=Red

" allows subsections to be highlighted with other syntax highlighters
function! TextEnableCodeSnip(filetype, start, end, textSnipHl) abort
    let ft=toupper(a:filetype)
    let group='textgroup'.ft
    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        unlet b:current_syntax
    endif
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
    catch
    endtry
    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif
    execute 'syntax region textSnip'.ft.'
    \ matchgroup='.a:textSnipHl.'
    \ keepend
    \ start="'.a:start.'" end="'.a:end.'"
    \ contains=@'.group 
endfunction

let b:current_syntax = "notes"

call TextEnableCodeSnip('python', 'py|', '|py', 'SpecialComment')
call TextEnableCodeSnip('cpp', 'cpp|', '|cpp', 'SpecialComment')
call TextEnableCodeSnip('sql', 'sql|', '|sql', 'SpecialComment')
