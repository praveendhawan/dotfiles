local expand = vim.fn.expand

return {
  custom_projects = {
    { path = expand "~/.config/nvim", name = "nvim" },
    { path = expand "~/.config", name = "config" },
    { path = expand "~/workspace/Office/E2E/ncx-poc", name = "nico" },
    { path = expand "~/workspace/Office/E2E/networksmanagement", name = "networking" },
    { path = expand "~/workspace/Office/E2E/nico-redfish-proxy", name = "nico-proxy" },
    { path = expand "~/workspace/Office/E2E/nico-admin-backend", name = "nico-backend" },
  },
}
