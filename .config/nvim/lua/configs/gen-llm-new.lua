local M = {}

M.prompt_wrapper = function(input, prefix, suffix)
  return prefix .. input .. suffix
end

M.ollama = {
  start_cmd = "ollama serve > /dev/null 2>&1 &",
  base_url = "http://localhost:11434",
  api_endpoints = {
    chat = "/api/chat",
    tags = "/api/tags",
  },
  models = {
    coder = {
      name = "deepseek-coder:6.7b-instruct-q5_K_M",
      template = {
        prefix = "### Instruction:\n",
        suffix = "\n### Response:"
      }
    },
    general = {
      name = "llama3:instruct",
      template = {
        prefix = "<|start_header_id|>user<|end_header_id|>",
        suffix = "<|eot_id|>{{ end }}<|start_header_id|>assistant<|end_header_id|>"
      }
    },
  }
}

-- start ollama server
M.start_ollama = function(_)
  pcall(io.popen, M.ollama.start_cmd)
end

-- list models installed
M.list_models = function()
  local response = vim.fn.systemlist("curl --silent --no-buffer " .. M.ollama.base_url ..  M.ollama.api_endpoints.tags)
  local list = vim.fn.json_decode(response)
  local models = {}
  for key, _ in pairs(list.models) do
    table.insert(models, list.models[key].name)
  end
  table.sort(models)
  return models
end

-- Setup Gen.nvim
require('gen').setup({
  model = M.ollama.models.coder.name,
  display_mode = "float",
  show_prompt = false,
  show_model = false,
  no_auto_close = false,
  init = M.start_ollama,
  command = "curl --silent --no-buffer -X POST " .. M.ollama.base_url .. M.ollama.api_endpoints.chat .. " -d $body",
  list_models = M.list_models(),
  debug = false
})

-- Overwrite default prompts
local prompts = require("gen").prompts

-- Change Model for general tasks default prompts
local general_prompts = {
  "Chat",
  "Summarize",
  "Ask",
  "Change",
  "Enhance_Grammar_Spelling",
  "Enhance_Wording",
  "Make_Concise",
  "Make_List",
  "Make_Table"
}

for _, prompt in ipairs(general_prompts) do
  prompts[prompt] = vim.tbl_deep_extend("force", prompts[prompt], { model = M.ollama.models.general.name })
end

-- How to Add a new prompt
-- Add a new prompt
-- prompts["Custom"] = {
--   model = M.models.coder,
--   prompt = function(input)
--     return M.prompt_wrapper(input, M.models.template.prefix, M.models.template.suffix)
--   end
-- }
--
-- prompts['Another'] = {
--   prompt = "Elaborate the following text:\n$text",
--   replace = true
-- }
--
-- prompts["Another Custom"] = {
--   prompt = M.prompt_wrapper("Below is unfinished code. Judging from the file and code around the unfinished code write a response that appropriately completes the unfinished code.\n$input\n[CODE]\n$text\n[/CODE]\n", M.model.coder.template.prefix, M.model.coder.template.suffix)
-- }
