local ls = require "luasnip"
local s, i, f = ls.snippet, ls.insert_node, ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

-- <ROOT>_<NAME>_<EXT>, e.g. MYPROJ_FOO_H for <project>/src/foo.h.
-- The root is the git root (or cwd when not in a repo).
local function header_guard()
  local root = vim.fs.root(0, ".git") or vim.fn.getcwd()
  local parts = {
    vim.fs.basename(root),
    vim.fn.expand "%:t:r",
    vim.fn.expand "%:e",
  }
  local guard = table.concat(parts, "_")
  return (guard:gsub("[^%w]", "_"):upper())
end

local snippets = {
  s(
    { trig = "guard", desc = "Header include guard" },
    fmt(
      [[
#ifndef {}
#define {}

{}

#endif
]],
      { f(header_guard), f(header_guard), i(0) }
    )
  ),
}

ls.add_snippets("c", snippets)
ls.add_snippets("cpp", snippets)
