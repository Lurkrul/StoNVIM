local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Formatting ]]
vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- You can specify filetypes to autoformat on save here:
    local enabled_filetypes = {
      lua = true,
      -- python = true,
      c = true,
      cpp = true,
      cmake = true,
      glsl = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
  -- You can also specify external formatters in here.
  formatters_by_ft = {
    -- rust = { 'rustfmt' },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    c = { 'clang_format' },
    cpp = { 'clang_format' },
    cmake = { 'cmake_format' },
    glsl = { 'clang_format' },
    -- You can use 'stop_after_first' to run the first available formatter from the list
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
  },
  formatters = {
    clang_format = {
      prepend_args = function(_, ctx)
        local local_config = vim.fs.find({ '.clang-format', '_clang-format' }, { path = ctx.dirname, upward = true })[1]
        if local_config then return {} end
        return {
          '--style=file:' .. vim.fn.stdpath 'config' .. '/config/clang-format.yaml',
        }
      end,
    },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })

-- vim: ts=2 sts=2 sw=2 et
