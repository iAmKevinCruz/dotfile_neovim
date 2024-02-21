let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +56 lua/mappings.lua
badd +71 init.lua
badd +1 lua/options.lua
badd +1 ~/.config/nvim_new/lua/plugins/init.lua
badd +1 ~/.config/nvim_new/lua/plugins/telescope.lua
badd +11 ~/.config/nvim_backup/after/plugin/telescope.lua
badd +201 ~/.config/nvim_backup/lua/core/packer.lua
badd +28 lua/plugins/indent-blankline.lua
badd +17 lua/plugins/lualine.lua
badd +1 lua/plugins/colorscheme.lua
badd +35 lua/plugins/git.lua
badd +1 lua/plugins/neogit.lua
badd +30 lua/plugins/symbols-outline.lua
badd +10 lua/plugins/neoclip.lua
badd +1 ~/.config/nvim_new/lua/plugins/codeium.lua
badd +1 ~/.config/nvim_new/lua/plugins/neorg.lua
badd +1 ~/.config/nvim_new/lua/plugins/orgmode.lua
badd +1 ~/.config/nvim_new/lua/custom/org-modern/menu.lua
badd +1 ~/.config/nvim_new/lua/plugins/undotree.lua
badd +1 undotree_2
badd +1 ~/.config/nvim_new/lua/plugins/telescope-undo.lua
badd +1 ~/.config/nvim_new/lua/plugins/oil.lua
badd +1 ~/.config/nvim_new/lua/plugins/vim-visual-multi.lua
badd +1 ~/.config/nvim_new/lua/plugins/dropbar.lua
badd +1 ~/.config/nvim_new/lua/plugins/treesitter.lua
badd +1 ~/.config/nvim_new/lua/plugins/buffer-manager.lua
badd +1 ~/.config/nvim_new/lua/plugins/specs.lua
badd +1 ~/.config/nvim_new/lua/plugins/true-zen.lua
badd +1 ~/.config/nvim_new/lua/plugins/mini.lua
badd +1 ~/.config/nvim_new/lua/plugins/harpoon.lua
badd +2 ~/.config/nvim_backup/after/plugin/harpoon.lua
badd +1 ~/.config/nvim_new/lua/plugins/flash.lua
badd +1 ~/.config/nvim_new/lua/utils/utils.lua
badd +1 ~/.config/nvim_new/lua/plugins/prettier.lua
badd +1 ~/.config/nvim_new/lua/plugins/lsp.lua
badd +226 ~/.config/nvim_backup/after/plugin/lsp.lua
badd +1 ~/.config/nvim_new/lua/plugins/cmp.lua
badd +1 ~/.config/nvim_new/lua/plugins/nvim-tree.lua
badd +1 ~/.config/nvim_new/lua/plugins/nvim-web-devicons.lua
badd +47 lua/plugins/mini.lua
badd +58 lua/plugins/cmp.lua
badd +200 lua/plugins/lsp.lua
badd +1 lua/plugins/vim-matchup.lua
badd +24 lua/autocmds.lua
badd +8 lua/plugins/dropbar.lua
badd +10 lua/plugins/telescope.lua
badd +1 lua/plugins/wrapping.lua
badd +167 lua/utils/utils.lua
badd +11 lua/plugins/noice.lua
badd +5 lua/plugins/vim-visual-multi.lua
badd +29 lua/plugins/rainbow-delimiter.lua
badd +1 health://
badd +13 lua/plugins/flash.lua
badd +8 lua/plugins/zen-mode.lua
badd +154 lua/plugins/treesitter.lua
badd +1 lua/plugins/better-escape.lua
badd +23 lua/plugins_neovide/toggle_term.lua
argglobal
%argdel
edit lua/mappings.lua
argglobal
balt lua/plugins/colorscheme.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 56 - ((27 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 56
normal! 0
lcd ~/.config/nvim
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
