if exists('s:vim_git_browse_loaded')
  finish
endif

let s:vim_git_browse_loaded = 1

nnoremap <Leader>go :<C-u> call vim_git_browse#GitBrowse(v:false)<CR>
xnoremap <Leader>go :<C-u> call vim_git_browse#GitBrowse(v:true)<CR>

nnoremap <Leader>gp :<C-u> call vim_git_browse#GitPullRequest()<CR>
nnoremap <Leader>gc :<C-u> call vim_git_browse#GitCreatePullRequest()<CR>
