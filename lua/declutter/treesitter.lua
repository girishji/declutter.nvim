local M = {}

M.markdown_hl_fenced_code_block = function()
  -- cursorline bug: https://github.com/atusy/tsnode-marker.nvim/issues/6
  -- help: https://www.youtube.com/watch?v=86sgKa0jeO4

  -- local function p(arg)
  --   vim.print(arg)
  -- end

  local function set_sign_hl()
    -- local bufnr = 0
    local bufnr = vim.api.nvim_get_current_buf()
    local query = vim.treesitter.query.parse('markdown', '(fenced_code_block) @codeblock')
    local parser = vim.treesitter.get_parser(bufnr, 'markdown')
    local tree = parser:parse()
    -- p(getmetatable(tree[1]))

    local function set_linehl(rstart, rend)
      for line = rstart, rend do
        vim.fn.sign_place(0, 'declutter_sign_grp', 'codeblock', bufnr, { lnum = line })
      end
    end

    vim.fn.sign_define('codeblock', { linehl = 'FencedCodeBlock' })
    vim.fn.sign_unplace('declutter_sign_grp', { buffer = bufnr })

    ---@diagnostic disable-next-line: missing-parameter
    for _, match, metadata in query:iter_matches(tree[1]:root(), bufnr) do
      local node = match[1]
      local range = vim.treesitter.get_range(node, bufnr, metadata)
      set_linehl(range[1] + 1, range[4])
    end
  end

  local group = vim.api.nvim_create_augroup("FenceCodeBlock", {})
  vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePost" }, {
    group = group,
    pattern = "*.md",
    callback = set_sign_hl,
  })
end

return M
