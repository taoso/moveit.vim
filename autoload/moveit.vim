function! moveit#left()
	call moveit#move(-1, 0)
endfunction

function! moveit#right()
	call moveit#move(1, 0)
endfunction

function! moveit#up()
	" TODO
endfunction

function! moveit#down()
	" TODO
endfunction

function! moveit#move(x, y)
	let col0 = virtcol("'<")
	let row0 = line("'<")
	let col1 = virtcol("'>")
	let row1 = line("'>")

	let width = col1 - col0
	let height = row1 - row0

	if col1 + a:x >= winwidth(0)
		return
	endif

	normal! gv"ay
	call moveit#clear()

	call s:goto(col0 + a:x, row0 + a:y)
	execute 'normal! '.width.'l'.height.'j"ap'
endfunction

function! moveit#clear()
	let col0 = virtcol("'<")
	let row0 = line("'<")
	let col1 = virtcol("'>")
	let row1 = line("'>")

	let r = row0
	while r <= row1
		let c = col0
		while c <= col1
			call s:setCharAt(' ', c, r)
			let c = c + 1
		endwhile
		let r = r + 1
	endwhile
	call s:goto(col0, row0)
endfunction

function s:goto(x, y)
	execute a:y
	execute "normal! ".a:x."|"
endfunction

function! s:setCharAt(chr, x, y)
	execute a:y
	if a:x <= 1
		execute "normal! 0r".a:chr
	else
		execute "normal! 0".(a:x-1)."lr".a:chr
	endif
endfunction

" vim: foldmethod=marker:noexpandtab:ts=4:sts=4:sw=4
