local M = {}

M.current_branch = function()
  local root = (package.loaded["lazyvim.util"] and require("lazyvim.util").root.get()) or vim.fn.getcwd()

  local result = vim.fn.systemlist("git -C " .. vim.fn.shellescape(root) .. " branch --show-current")
  local branch = (vim.v.shell_error == 0 and result[1]) or ""
  local ticket = branch:gsub("%s", ""):gsub("^(.+/)", "")
  return ticket or branch
end

return M
