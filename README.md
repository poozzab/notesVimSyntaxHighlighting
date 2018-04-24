To install:

    - Create folders ~/.vim/syntax and ~/.vim/ftdetect if they do not already exist
    - copy "notes.vim" to ~/.vim/syntax
    - copy "notesDetect.vim" to ~/.vim/ftdetect

now any file you write that is appended with either ".notes" or ".IGNOREME" extensions will abide by a custom syntax highlighter. It is a very simple syntax to follow:

Subject lines are defined by an ending :
    -> anything that ends with a : will be highlighted
    example sentence containing : but isn't a subject line

comment lines have at least 4 spaces preceeding a -

related comments (ones pertaining to the preceeding line) start with ->

number literals are highlighted specially within any type of line 
    - +1234.5 and -234 are examples!

open questions (for yourself) are enclosed in "?"s such as ? why is this brown? ? 
    -> note that the final ? is technically extraneous as the regex matched the ? after red

To explicitly highlight a substring, wrap it in " quotes "
    -> this can be done anywhere

You can write in ( grey ) too. These are typically remarks to yourself that can usually be ignored.

!! If you want to draw attention to a statement, wrap it in !!

For school note taking purposes, you can define a concept using the following format
# concept := concept definition #

Concepts are restricted to singular lines, but definitions can span multiple lines and look like this
# concept := concept
definition
#

To see the syntax in action, open this file in vim and use command ":set filetype=notes"
