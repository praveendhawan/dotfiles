local M = {}

M.ctree_builder = function (file_name)
  local component_folder = string.gsub(file_name, "frontend/components/", "")
  local ctree_command = "ctree"

  print(component_folder)

  vim.fn.system(string.format("%s %s", ctree_command, component_folder))
end

return M
