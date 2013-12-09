" :Less
" turn vim into a pager for psql aligned results 
fun! Less()
  set nocompatible
  set nowrap
  set scrollopt=hor
  set scrollbind
  set number

  execute 'above split'

  " resize upper window to one line; two lines are not needed because vim adds separating line
  execute 'resize 1'

  " switch to lower window and scroll 2 lines down
  wincmd j
  execute "norm! 2\<C-E>"

  " hide statusline in lower window
  set laststatus=0

  " hide contents of upper statusline. editor note: do not remove trailing spaces in next line!
  set statusline=\  

  " arrows do scrolling instead of moving
  nmap <right> zL
  nmap <down> <C-E>
  nmap <left> zH
  nmap <up> <C-Y>

  " scroll one pagefull
  nmap <Space> <PageDown>

  " faster quit (I tend to forget about the upper panel)
  nmap q :qa!<cr>
  nmap Q :qa!<cr>
endfun

command! -nargs=0 Less call Less()

