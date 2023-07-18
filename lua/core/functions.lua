local cache = {}

local function load_json(filename)
  local path = vim.fn.stdpath('config') .. '/' .. filename .. '.json'
  if not cache[path] then
    cache[path] = vim.json.decode(table.concat(vim.fn.readfile(path), '\n'))
  end
  return cache[path]
end

local function save_json(data, filename)
  local path = vim.fn.stdpath('config') .. '/' .. filename .. '.json'
  vim.fn.writefile({ vim.json.encode(data) }, path)
  cache[path] = nil
end

return {
  load_json = load_json,
  save_json = save_json,
}
