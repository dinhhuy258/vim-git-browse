# vim-git-browse
- You get tired of searching your file on your git repository.
- You feel sick of searching your pull/ merge request.
- You get mad at all steps you need to take to create a pull/ merge request.
`vim-git-browse` plugin is for you, with this plugin you can get rid of all of the annoying steps for creating a pull/merge request, viewing a file, opening a merge/ pull request on your git repository

## Installation

### Dependencies
- git
- awk

### Install
```
Plug 'dinhhuy258/vim-git-browse'
```

## Key mapping

The default mapping is
- <Leader>go to open the file in the git repository
- <Leader>gp to view a pull/merge request 
- <Leader>gc to create a pull/merge request

## Features

| Name | Github | Gitlab | Bitbucket |
| ---- | ------ | ---- | ---- |
| Open project | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| View pull request |  | :white_check_mark: |  |
| Create pull request |  | :white_check_mark: |  |


## Issues

- Not sure the plugin will work on window so pull request are welcome
- Function calls are sync (need to improve to call in async)
