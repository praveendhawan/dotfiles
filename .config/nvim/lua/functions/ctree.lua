local custom_functions = require 'functions.utils'

function custom_functions.component_tree_builder(file_name)
  local component_folder = string.gsub(file_name, "frontend/components/", "")
  local ctree_command = "ctree"

  --[[
  if not global.open_command then
    if os.getenv("OS") == "Windows_NT" then
      global.open_command = "start"
    else
      global.open_command = "xdg-open"
    end
  end
  ]]

  print(component_folder)

  vim.fn.system(string.format("%s %s", ctree_command, component_folder))
  -- vim.fn.system(string.format("%s %s", global.open_command, "./tmp/result.html"))
end

return custom_functions
