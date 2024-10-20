## Lua idioms

You want to type something and you needed some trivial patterns, you in correct place


## Installation
Not even close. Just `copy` and `paste` all you find usefull.

## TOC

- [Array](lua/vie/array.lua):
    - [`map`](lua/vie/array.lua#L2-L6) — iterate through array
    - [`reverse`](lua/vie/array.lua#L7-L12) — reverse array
    - [`contain`](lua/vie/array.lua#L13-L21) — array contain element
    - [`flat`](lua/vie/array.lua#L22-L47) — full flatten array
    - [`flat_n`](lua/vie/array.lua#L48-L75) — flatten deep `n`
    - [`flat_1`](lua/vie/array.lua#L76-L93) — flatten deep `1`
- [Text](lua/vie/text.lua):
    - [`split`](lua/vie/text.lua#L2-L18) — split text by separator
    - [`replace`](lua/vie/text.lua#L19-L33)— replace substring in text
- [Fs (file system)](lua/vie/fs.lua):
    - [`os_sep`](lua/vie/fs.lua#L2-L4) — separator of current os, if you really need it
    - [`exist`](lua/vie/fs.lua#L5-L9) — check if `filepath` exist
    - [`is_dir`](lua/vie/fs.lua#L10-L14) — check if `file` is directory
    - [`scandir`](lua/vie/fs.lua#L15-L43) — find all files of directory and all subdirectory
    - [`read_lines`](lua/vie/fs.lua#L44-L55) — read `filepath` by line
    - [`read_lines_async`](lua/vie/fs.lua#L56-L64) — read `filepath` by line async **TODO**
    - [`read_file`](lua/vie/fs.lua#L65-L73) — read full file
    - [`read_file_async`](lua/vie/fs.lua#L74-L89) — read full file async
    - [`append`](lua/vie/fs.lua#L90-L98) — append something to `filepath` and save
- [Async (something with coroutine)](lua/vie/async.lua): 
    - [`choice`](lua/vie/async.lua#L2-L26) — async choice, especially for `vim.ui` or something else, if you want to specify user-choice model
- [Vim](lua/vie/vim.lua):
    - [`get_selection`](lua/vie/vim.lua#L2-L4) — get visual selected text
    - [`start_insert`](lua/vie/vim.lua#L5-L12) — into insert mode


## CREDITS
- [@L3MON4D3](https://github.com/L3MON4D3) — `fs/read_lines_async`
- [@FoamScience](https://github.com/FoamScience) — `async/choice`
- [@chrisgrieser](https://github.com/chrisgrieser) — `vim/start_insert`

