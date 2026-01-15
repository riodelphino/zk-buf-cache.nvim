local M = {}

---@param user_opts table?
function M.setup(user_opts)
  local config = require("zk_buf_cache.config")
  config.options = vim.tbl_deep_extend("force", config.options, user_opts)
  require("zk_buf_cache.autocmds")
end

return M
