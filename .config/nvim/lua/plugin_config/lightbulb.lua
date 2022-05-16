require 'nvim-lightbulb'.setup {
  sign = {
    enabled = true,
    priority = 20,
  },
  float = {
    enabled = false,
    text = "💡",
    win_opts = {
      border = 'none',
    },
  },
}

-- Modify the lightbulb sign (see :h sign-define)
vim.fn.sign_define('LightBulbSign', { text = "💡", texthl = "SignColumn", linehl = "", numhl = "" })

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
