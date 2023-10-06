local ok, plenary_reload = pcall(require, "plenary.reload")
if not ok then
  reloader = require
else
  reloader = plenary_reload.reload_module
end

P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
  return reloader(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

FoldStart = function(minlines, level)
    level = level or 2
    minlines = minlines or 1
    vim.opt.foldlevel=level
    vim.opt.foldminlines=minlines
    vim.opt_local.foldmethod="expr"
    vim.opt_local.foldexpr="nvim_treesitter#foldexpr()"
    vim.cmd('echo "Folding Activated"')
end

