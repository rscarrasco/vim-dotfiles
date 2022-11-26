set autoindent expandtab tabstop=4 shiftwidth=4

set number relativenumber

" Searchs down into subfolders.
"
" This tweak allows any file-related tasks, like :find, to search 
" subdiretories recursively, which enables vim to access any inner files 
" from the project root, and kind of emulates a fuzzy finder, without 
" needing any plugins ;) It also provides tab completion to those very same 
" file-related tasks. I was inspired by a talk from Max Cantor (check first
" reference, bellow).
"
" @see https://www.youtube.com/watch?v=XA2WjJbmmoM
" @see :help path
" @see :help file-searching
" 
set path+=**

" Enables tab-completion menu.
" 
" Combined with 'Searchs down into subdirectories' tweak at path, the
" wildmenu kind of works like a very simple but capable fuzzy finder,
" no plugins required.
"
" @see https://www.youtube.com/watch?v=XA2WjJbmmoM
" @see :help wildmenu
set wildmenu

