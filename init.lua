-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- set cache location for base46
vim.g.base46_cache = vim.fn.stdpath 'data' .. '/base64_cache/'

-- [[ Set up vim.pack ]]
require 'pack'

-- [[ Configure and install plugins ]]
require 'plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
