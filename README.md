To install:

    - Create folders ~/.vim/syntax and ~/.vim/ftdetect if they do not already exist
    - copy "notes.vim" to ~/.vim/syntax
    - copy "notesDetect.vim" to ~/.vim/ftdetect

now any file you write that is appended with either ".notes" or ".IGNOREME" extensions will abide by a custom syntax highlighter. It is a very simple syntax to follow:

Subject lines are defined by a leading # or ending :
    -> anything that ends with a : will be highlighted
    example sentence containing : but isn't a subject line

comment lines have at least 4 spaces preceeding a -

related comments (ones pertaining to the preceeding line) start with ->

number literals are highlighted specially within any type of line 
    - +1234.5 and -234 are examples!

open questions are enclosed in ?s such as ? why is this red? ?
    -> note that the final ? is technically extraneous as the regex matched the ? after red

To explicitly highlight a substring, wrap it in " quotes "
    -> this can be done anywhere

To see the syntax in action, open this file in vim and use command ":set filetype=notes"
