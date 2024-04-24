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
badd +81 lua/mappings.lua
badd +27 init.lua
badd +1 lua/options.lua
badd +1 ~/.config/nvim_new/lua/plugins/init.lua
badd +1 ~/.config/nvim_new/lua/plugins/telescope.lua
badd +11 ~/.config/nvim_backup/after/plugin/telescope.lua
badd +201 ~/.config/nvim_backup/lua/core/packer.lua
badd +28 lua/plugins/indent-blankline.lua
badd +28 lua/plugins/lualine.lua
badd +1 lua/plugins/colorscheme.lua
badd +20 lua/plugins/git.lua
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
badd +32 lua/plugins/mini.lua
badd +58 lua/plugins/cmp.lua
badd +197 lua/plugins/lsp.lua
badd +1 lua/plugins/vim-matchup.lua
badd +24 lua/autocmds.lua
badd +8 lua/plugins/dropbar.lua
badd +43 lua/plugins/telescope.lua
badd +1 lua/plugins/wrapping.lua
badd +167 lua/utils/utils.lua
badd +11 lua/plugins/noice.lua
badd +5 lua/plugins/vim-visual-multi.lua
badd +29 lua/plugins/rainbow-delimiter.lua
badd +1 health://
badd +1 lua/plugins/flash.lua
badd +3 lua/plugins/zen-mode.lua
badd +4 lua/plugins/treesitter.lua
badd +1 lua/plugins/better-escape.lua
badd +23 lua/plugins_neovide/toggle_term.lua
badd +8 lua/plugins/fzf-lua.lua
badd +2 lua/plugins/neorg.lua
badd +16 ~/Library/Application\ Support/lazygit/config.yml
badd +25 ~/Library/Application\ Support/lazygit/bin/nvim-dynamic-server
badd +19 lua/plugins/harpoon.lua
badd +1 lua/custom/mappings.lua
badd +1 lua/custom/plugins.lua
badd +1 lua/custom/highlights.lua
badd +130 lua/plugins/orgmode.lua
badd +1 .DS_Store
badd +2 lua/plugins/buffer-manager.lua
badd +15 lua/plugins/rust-config.lua
badd +6 after/ftplugin/rust.lua
badd +5 lua/plugins/typescript-config.lua
badd +0 lua/plugins/prettier.lua
argglobal
%argdel
edit lua/plugins/prettier.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt lua/plugins/typescript-config.lua
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
let s:l = 8 - ((7 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 0
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/plugins/lsp.lua", ":p")) | buffer ~/.config/nvim/lua/plugins/lsp.lua | else | edit ~/.config/nvim/lua/plugins/lsp.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/plugins/lsp.lua
endif
balt ~/.config/nvim/after/ftplugin/rust.lua
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
let s:l = 194 - ((34 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 194
normal! 0
lcd ~/.config/nvim
wincmd w
2wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
