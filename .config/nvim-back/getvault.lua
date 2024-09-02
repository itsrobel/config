function GetWorkspaces()
  local workspaces = {}

  for dir in io.popen([[ls -p $HOME/Documents/vaults ]]):lines() do
    local sdir = dir:sub(1, -2)
    local entry = {}
    entry['name'] = sdir
    entry['path'] = string.format('%s/Documents/vaults/%s', os.getenv 'HOME', sdir)
    table.insert(workspaces, entry)
  end
  return workspaces
end

function GetEvents()
  local workspaces = GetWorkspaces()

  local events = {}
  for key, value in ipairs(workspaces) do
    -- table.insert(events, string.format('BufReadPre %s/*', value['path']))
    -- table.insert(events, string.format('BufNewFile %s/*', value['path']))
    table.insert(events, string.format('BufRead %s*', value['path']))
  end
  return events
end

local events = GetEvents()
for k, v in ipairs(events) do
  print(v)
end
