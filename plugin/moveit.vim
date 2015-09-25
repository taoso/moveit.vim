" Vim completion plugin
let s:save_cpo = &cpo
set cpo&vim

noremap <silent> H :call moveit#left()<CR>
noremap <silent> L :call moveit#right()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker:noexpandtab:ts=4:sts=4:sw=4
