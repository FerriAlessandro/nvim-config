
 -- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' ' 

-- Disable the default behaviour of the spacebar in normal and visual mode
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true}) 

-- For conciseness, options to use in vim.keymap.set; 
local opts = {noremap = true, silent = true} 

-- salve file with ctrl+s. <C-s> is ctrl+s; <cmd> is command mode (mode when you press ':'), w is the key and <CR> is the enter
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
--vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- close file with ctrl+q
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character WITHOUT copying it to the register
vim.keymap.set('n', 'x', '"_x', opts)

-- Allow moving the cursor through wrapped lines with j, k (i.e. if a line is too long and goes on a new line, j and k will still move 1 row up or down)
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights (e.g. after a search all the words stay highlighted even after Esc is pressed, this avoids that)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Resize splits with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)-- Diagnostic keymaps
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffer
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>q', ':bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer


-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>sq', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Use Tab to indent right (gv will re-select the text after intendin
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })

-- Use Shift+Tab to indent left
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
-- Keep last yanked when pasting (by default, when pasting on a selection, VIM copies the overridden text. This disables that.
vim.keymap.set('v', 'p', '"_dP', opts)

-- Save and load session (open buffers, window layouts etc..)
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>x', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Toggle line wrapping (in case a line is too long for the non-line wrapping setting)
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)


-- Tabs (Tabs in vim are a bit strange. Buffers and windows should be enough)
--vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
--vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
--vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
--vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)     --  go to previous tab

-- Vertical scroll and center (when moving up and down with ctrl+d or ctrl+u keep the cursor always in the middle)
--vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
--vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center(when moving to the next search word using n or N keep the cursor always in the middle)
--vim.keymap.set('n', 'n', 'nzzzv')
--vim.keymap.set('n', 'N', 'Nzzzv')


