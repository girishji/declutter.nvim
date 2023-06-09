local M = {}

M.markdown_hl_fenced_code_block = function()
  -- cursorline bug: https://github.com/atusy/tsnode-marker.nvim/issues/6
  -- help: https://www.youtube.com/watch?v=86sgKa0jeO4

  local function p(arg)
    vim.print(arg)
  end

  local function setup_sign_hl()
    local bufnr = vim.api.nvim_get_current_buf()
    local query = vim.treesitter.query.parse('markdown', [[
      (fenced_code_block
        (code_fence_content) @code_block)
      (block_quote) @block_quote
      ]])
    -- (codeblock
    --   (code) @code_block)
    -- (codespan) @code_block
    local parser = vim.treesitter.get_parser(bufnr, 'markdown')
    local tree = parser:parse()
    -- p(getmetatable(tree[1]))

    local function set_linehl(rstart, rend, sign_name)
      for line = rstart, rend do
        vim.fn.sign_place(0, 'declutter_sign_grp', sign_name, bufnr, { lnum = line })
      end
    end

    vim.fn.sign_define('code_block', { linehl = 'FencedCodeBlock' })
    vim.fn.sign_define('block_quote', { linehl = 'BlockQuote' })
    vim.fn.sign_unplace('declutter_sign_grp', { buffer = bufnr })

    ---@diagnostic disable-next-line: missing-parameter
    for _, match, metadata in query:iter_matches(tree[1]:root(), bufnr) do
      local node = match[1] or match[2]
      local sign_name = match[1] and 'code_block' or 'block_quote'
      local range = vim.treesitter.get_range(node, bufnr, metadata)
      set_linehl(range[1] + 1, range[4], sign_name)
    end
  end

  local group = vim.api.nvim_create_augroup("EmphasizedRegion", {})
  vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePost" }, {
    group = group,
    -- pattern = { "*.md", "help" },
    pattern = "*.md",
    callback = setup_sign_hl,
  })
end

return M
