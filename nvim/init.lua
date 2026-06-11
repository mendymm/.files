
require("precognition").setup({
  -- your options here
})

vim.opt.number = true
vim.opt.relativenumber = true

-- configure tab width for lua
function configure_indent(file_type, width)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = file_type,
    callback = function()
      vim.bo.shiftwidth = width
    end,
  })
end

configure_indent("nix", 2)
configure_indent("lua", 2)
