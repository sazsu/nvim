vim.treesitter.start()

if not vim.g.nix_npairs_enabled then
  local npairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')
  vim.g.nix_npairs_enabled = true
  npairs.add_rule(
    Rule('= ', ';', 'nix')
    :with_pair(function(opts)
      local before = opts.line:sub(opts.col - 2, opts.col - 2)
      return not before:match('[=<>!]')
    end)
  )
end
