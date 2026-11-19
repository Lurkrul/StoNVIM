vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'base46' and ev.data.kind ~= 'delete' then require('base46').load_all_highlights() end
  end,
})

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvchad/base46',
  'https://github.com/nvchad/ui',
  'https://github.com/nvchad/volt',
}

require 'nvchad'

if vim.fn.isdirectory(vim.g.base46_cache) == 0 then require('base46').load_all_highlights() end

for _, file in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. file)
end
