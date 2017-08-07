" For running tests remotely
" set makeprg=remote_nosetests.py\ %

" Copied from klen/python-mode
"
" The following lines set Vim's errorformat variable, to allow the
" quickfix window to show Python tracebacks properly. It is much
" easier to use let than set, because set requires many more
" characters to be escaped. This is much easier to read and
" maintain. % escapes are still needed however before any regex meta
" characters. Hence \S (non-whitespace) becomes %\S etc.  Note that
" * becomes %#, so .* (match any character) becomes %.%#  Commas must
" also be escaped, with a backslash (\,). See the Vim help on
" quickfix for details.
"
" Python errors are multi-lined. They often start with 'Traceback', so
" we want to capture that (with +G) and show it in the quickfix window
" because it explains the order of error messages.
let &efm  = '%+GTraceback%.%#,'

" The error message itself starts with a line with 'File' in it. There
" are a couple of variations, and we need to process a line beginning
" with whitespace followed by File, the filename in "", a line number,
" and optional further text. %E here indicates the start of a multi-line
" error message. The %\C at the end means that a case-sensitive search is
" required.
let &efm .= '%E  File "%f"\, line %l\,%m%\C,'
let &efm .= '%E  File "%f"\, line %l%\C,'

" The possible continutation lines are idenitifed to Vim by %C. We deal
" with these in order of most to least specific to ensure a proper
" match. A pointer (^) identifies the column in which the error occurs
" (but will not be entirely accurate due to indention of Python code).
let &efm .= '%C%p^,'

" Any text, indented by more than two spaces contain useful information.
" We want this to appear in the quickfix window, hence %+.
let &efm .= '%+C    %.%#,'
let &efm .= '%+C  %.%#,'

" The last line (%Z) does not begin with any whitespace. We use a zero
" width lookahead (\&) to check this. The line contains the error
" message itself (%m)
let &efm .= '%Z%\S%\&%m,'

" We can ignore any other lines (%-G)
let &efm .= '%-G%.%#'
