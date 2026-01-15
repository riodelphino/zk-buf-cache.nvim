local zk_util = require("zk.util")
local M = {}

---Cache zk info to buffer variable
---@param bufnr integer?
function M.zk_buf_cache(bufnr)
  bufnr = bufnr or 0
  local opts = require("zk_buf_cache.config").options
  local path = vim.api.nvim_buf_get_name(bufnr)
  local notebook_path = zk_util.notebook_root(path)
  if notebook_path then
    require("zk.api").list(
      notebook_path,
      { select = opts.select, hrefs = { path }, limit = 1 },
      function(err, notes)
        if err or #notes == 0 then
          return
        end
        vim.b[bufnr].zk = notes[1]
      end
    )
  end
end

---Cache zk info for all buffers
function M.zk_buf_cache_all()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local is_listed = vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
    if is_listed then
      local name = vim.api.nvim_buf_get_name(bufnr)
      if name:match("%.md$") then
        M.zk_buf_cache(bufnr)
      end
    end
  end
end

return M
