call vimtest#StartTap()
call vimtap#Plan(12) " <== XXX  Keep plan number updated.  XXX
"call vimtap#Diag('Test')
append
abc abc abc abc abc abc
abcd abcd abcd abcd abcd
abcde
.

" run these tests twice; the first time without f,ing loaded
for loop in range(2)

  normal 1G0vfcy
  call LineColPos(1, 1)  " <== XXX Account for 2 tests each call XXX
  call VisualMatch('abc')

  normal 1G0fcv2fcy
  call LineColPos(1, 3)
  call VisualMatch('c abc abc')

  normal 1G0fcv2fc;y
  call LineColPos(1, 3)
  call VisualMatch('c abc abc abc')

  runtime plugin/fanfingtastic.vim
endfor

call vimtest#Quit()