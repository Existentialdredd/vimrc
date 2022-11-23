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

TabelInsertNoDuplicates = function(root, extensions, tbl, member_tbl)
    for _, extension in pairs(extensions) do
        local full_path = root .. extension
        if member_tbl[full_path] == nil then
            table.insert(tbl, full_path)
            print("Inserted \n" .. full_path)
        else
            print("Already Present In Table \n" .. full_path)
        end
    end
end

MemberTable = function (tbl)
    local member_tbl = {}
    for _, val in pairs(tbl) do
        member_tbl[val] = true
    end
    return member_tbl
end
