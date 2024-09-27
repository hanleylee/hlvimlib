" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" convert virtcol to charcol
function! hlvimlib#text#VirtcolToCharcol(win_id, line_num, virt_col)
    let l:end_virt_col = virtcol([a:line_num, '$'])

    " 确保列存在, 否则就用空格填充
    if a:virt_col >= l:end_virt_col
        echoerr 'must ensure virt_col is less then end virtcol, endcol: ' . l:end_virt_col . ', virt_col => ' . a:virt_col
        return
    endif
    let line_content = getline(a:line_num)
    " convert virtcol to byte based col
    let byte_col = virtcol2col(a:win_id, a:line_num, a:virt_col)
    " convert byte based col to character index col
    let char_col = charidx(line_content, byte_col)
    return char_col
endfunction

function! hlvimlib#text#GetCharAtLineCol(line, char_col)
    let line_content = getline(a:line)
    let cur_char = strcharpart(line_content, a:char_col - 1, 1, 0)
    return cur_char
endfunction
