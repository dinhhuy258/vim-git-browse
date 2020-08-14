let s:cpo_save = &cpo
set cpo&vim

function! s:GetGitRemoteUrl()
  let l:git_remote_url = system('git remote get-url origin | tr -d "\n"')
  return l:git_remote_url[0:strlen(git_remote_url) - 5]
endfunction

function! s:GetGitRootPath() abort
  let l:git_root_path = system('git rev-parse --show-toplevel | tr -d "\n"')
  if l:git_root_path =~ '\fatal:'
    return v:null
  endif

  return l:git_root_path
endfunction

function! s:GetCurrentBranchName() abort
  return system('git rev-parse --abbrev-ref HEAD | tr -d "\n"')
endfunction

function! s:ShouldOpenGitFile() abort
  return !empty(expand('%:h'))
endfunction

function! s:GetRelativePath(git_root_path) abort
  let l:absolute_path = expand('%:p')
  return substitute(l:absolute_path, a:git_root_path . '/', '', '')
endfunction

function! s:OpenGitRepositoryInBrowser(visual_mode, git_remote_url, branch_name, git_root_path) abort
  if s:ShouldOpenGitFile() == v:false
     let l:git_url = a:git_remote_url . '/tree/' . a:branch_name
     call system('open ' . l:git_url)
     return
  endif

  let l:relative_path = s:GetRelativePath(a:git_root_path)
  let l:git_url = a:git_remote_url . '/blob/' . a:branch_name . '/' . s:GetRelativePath(a:git_root_path)

  if a:visual_mode
    let l:first_line = getpos("'<")[1]
    let l:git_url .= '#L' . l:first_line
    let l:last_line = getpos("'>")[1]
    if l:last_line != l:first_line | let l:git_url .= '-L' . l:last_line | endif
    call system('open ' . l:git_url)
  else
    let l:line = line('.')
    let l:git_url .= '#L' . l:line
    call system('open ' . l:git_url)
  endif
endfunction

function! vim_git_browse#GitBrowse(visual_mode) abort
  let l:git_root_path = s:GetGitRootPath()
  if l:git_root_path is v:null
    echo '[vim-git-browse] Please use in git project'
  endif

  let l:git_remote_url = s:GetGitRemoteUrl()
  let l:branch_name = s:GetCurrentBranchName()

  call s:OpenGitRepositoryInBrowser(a:visual_mode, l:git_remote_url, l:branch_name, l:git_root_path)
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
