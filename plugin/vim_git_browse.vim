if exists('s:vim_git_browse_loaded')
  finish
endif

let s:vim_git_browse_loaded = 1

if get(g:, 'huy_duong_workspace', 0) == 1
  let g:vim_git_browse_use_default_keymap = 0

  nnoremap <silent> <Leader>go :<C-u> call vim_git_browse#GitBrowse(v:false)<CR>
  xnoremap <silent> <Leader>go :<C-u> call vim_git_browse#GitBrowse(v:true)<CR>

  nnoremap <silent> <Leader>gp :<C-u> call vim_git_browse#GitPullRequest()<CR>
  nnoremap <silent> <Leader>gn :<C-u> call vim_git_browse#GitCreatePullRequest()<CR>
endif

if get(g:, 'vim_git_browse_use_default_keymap', 1) == 1
  nnoremap <silent> <Leader>go :<C-u> call vim_git_browse#GitBrowse(v:false)<CR>
  xnoremap <silent> <Leader>go :<C-u> call vim_git_browse#GitBrowse(v:true)<CR>

  nnoremap <silent> <Leader>gp :<C-u> call vim_git_browse#GitPullRequest()<CR>
  nnoremap <silent> <Leader>gc :<C-u> call vim_git_browse#GitCreatePullRequest()<CR>
endif

