## Lua idioms

You want to type something and you needed some trivial patterns, you in correct place


## Installation
Not even close. Just `copy` and `paste` all you find usefull.

## TOC

- Array:
    - [`map`](lua/vie/array.lua#L2C1-L5C4) — iterate through array
    - `reverse` — reverse array
    - `contain` — array contain element
    - `flat` — full flatten array
    - `flat_n` — flatten deep `n`
    - `flat_1` — flatten deep `1`
- Text:
    -  `split` — split text by separator
    - `replace`— replace substring in text
- File System(fs):
    - `os_sep` — separator of current os, if you really need it
    - `exist` — check if `filepath` exist
    - `is_dir` — check if `file` is directory
    - `scandir` — find all files of directory and all subdirectory
    - `read_lines` — read `filepath` by line
    - `read_lines_async` — read `filepath` by line async **TODO**
    - `read_file` — read full file
    - `read_file_async` — read full file async
    - `append` — append something to `filepath` and save
- Async(something with coroutine): 
    - `choice` — async choice, especially for `vim.ui` or something else, if you want to specify user-choice model
- Vim
    - `get_selection` — get visual selected text
    - `start_insert` — into insert mode


## CREDITS
- [@L3MON4D3](https://github.com/L3MON4D3) — `fs/read_lines_async`
- [@FoamScience](https://github.com/FoamScience) — `async/choice`
- [@chrisgrieser](https://github.com/chrisgrieser) — `vim/start_insert`

