# vim-git-browse
- You get tired of searching your file on your git repository.
- You feel sick of searching your pull/ merge request.
- You get mad at all steps you need to take to create a pull/ merge request.

`vim-git-browse` plugin is for you, with this plugin you can get rid of all of the annoying steps for creating a pull/merge request, viewing a file, opening a merge/ pull request on your git repository

## Installation

### Dependencies
- git
- awk
- sed

### Install
```
Plug 'dinhhuy258/vim-git-browse'
```

## Key mapping

The default mapping is
- <Leader>go to open the file in the git repository
- <Leader>gp to view a pull/merge request 
- <Leader>gc to create a pull/merge request
  
If you want to make your own custom keymap, then put the following in your `.vimrc`
```
let g:vim_git_browse_use_default_keymap = 0
nnoremap <Leader>go :<C-u> call vim_git_browse#GitBrowse(v:false)<CR>
xnoremap <Leader>go :<C-u> call vim_git_browse#GitBrowse(v:true)<CR>

nnoremap <Leader>gp :<C-u> call vim_git_browse#GitPullRequest()<CR>
nnoremap <Leader>gc :<C-u> call vim_git_browse#GitCreatePullRequest()<CR>
```

## Vim variables

- `g:vim_git_browse_use_default_keymap` use the default key mappings (default: `1`)
- `g:vim_git_browse_target_branch` the target branch for creating pull/merge request (default: `master`)
- `g:open_url_browser_default` changes default browser for linux user (default: `xdg-open`)

## Features

| Name | Github | Gitlab | Bitbucket |
| ---- | ------ | ---- | ---- |
| Open project | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| View pull request | :white_check_mark: | :white_check_mark: |  |
| Create pull request | :white_check_mark: | :white_check_mark: |  |


## Issues

- Not sure the plugin will work on window so pull request are welcome
- Function calls are sync (need to improve to call in async)
