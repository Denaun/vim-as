" Vim indent file
" Language:     Kawasaki AS
" Maintainer:   Zucchelli Maurizio
" Last Change:  May 06, 2014
" Version:      1

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetAsIndent()

if exists("*GetAsIndent")
  finish
endif

function! s:GetPrevNonCommentLineNum()

  let SKIP_LINES = '^\s*;'

  let nline = v:lnum
  while nline > 0
    let nline = prevnonblank(nline-1)
    if getline(nline) !~? SKIP_LINES
      break
    endif
  endwhile

  return nline
endfunction

function! GetAsIndent()
  if v:lnum <= 1
    return 0
  endif

  let this_line = getline(v:lnum)
  let prev_codeline_num = s:GetPrevNonCommentLineNum()
  let prev_codeline = getline(prev_codeline_num)
  let prev_codeline_indent = indent(prev_codeline_num)

  if this_line =~? '\<\.\?end\>'
    return prev_codeline_indent - &sw
  endif

  if this_line =~? '\<\.\?end\>'
    return prev_codeline_indent - &sw
  endif

  if this_line =~? '\<until\|while\>\(\(do\)\@!.\)*$'
    return prev_codeline_indent - &sw
  endif

  if prev_codeline =~? '\%(then\|do\|program\)'
    return prev_codeline_indent + &sw
  endif

  return prev_codeline_indent
endfunction
