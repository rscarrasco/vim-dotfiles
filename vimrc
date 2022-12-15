set autoindent expandtab tabstop=4 shiftwidth=4

" Enables hybrid number (absolute + relative).
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

" Enables true color & sets tokyonight as the default color scheme.
"
" According to the original author:
"
" > (...) this doesn't hard-code any color configuration in vim, which is a 
" > clean approach. You should never have to force vim to use 256 color.
" > The terminal is responsible to tell vim whether 256 colors are
" > supported or not.
"
" @see https://stackoverflow.com/a/68793002/1036669 
" @see :help true-color
if &term =~ '256color'
  " Enable true (24-bit) colors instead of (8-bit) 256 colors.
  " :h true-color
  if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
  colorscheme tokyonight
endif

" Source a file if it exists.
"
" @see https://devel.tech/snippets/n/vIIMz8vZ/load-vim-source-files-only-if-they-exist
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

" Sources local vim file
"
" The local.vim should contain settings specific to the local environment.
" This allows for local tweaking without messing with the repo files. As
" such, local.vim is ignored by git, and should be kept that way. It is 
" imperative that this block always stays at the bottom of this file,
" in order to allow full local overriding.
call SourceIfExists('~/.vim/local.vim')

