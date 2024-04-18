-- Server host and port where ollama is running
local ollama_server_details = {
  host = "localhost",
  port = 11434,
}

-- Method to call ollama api to get local models
local list_models = function(opts)
  local response = vim.fn.systemlist(
    "curl --silent --no-buffer http://" .. opts.host ..
    ":" .. opts.port .. "/api/tags")
  local list = vim.fn.json_decode(response)
  local models = {}
  for key, _ in pairs(list.models) do
    table.insert(models, list.models[key].name)
  end
  table.sort(models)
  return models
end

local coding_model = "deepseek-coder:6.7b-instruct-q5_K_M"  -- for ollama
local general_model = "gemma:latest"

require('gen').setup({
  model = "codegemma:7b-instruct-q5_K_M",
  display_mode = "float", -- The display mode. Can be "float" or "split".
  show_prompt = false, -- Shows the Prompt submitted to Ollama.
  show_model = false, -- Displays which model you are using at the beginning of your chat session.
  no_auto_close = false, -- Never closes the window automatically.
  -- Function to initialize Ollama
  init = function(options)
    pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
  end,
  command = "curl --silent --no-buffer -X POST http://localhost:11434/api/chat -d $body", -- ollama
  model_options = {
    penalize_newline = false,
    repeat_penalty = 1,
    stop = {
      "<start_of_turn>",
      "<end_of_turn>"
    }
  },
  -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
  -- This can also be a lua function returning a command string, with options as the input parameter.
  -- The executed command must return a JSON object with { response, context }
  -- (context property is optional).
  list_models = list_models(ollama_server_details), -- Retrieves a list of model names
  debug = false -- Prints errors and the command which is run.
})
local deepseek_wrap = function(input)  -- for deepseek-coder
  local codex_prefix = "### Instruction:\n"
  local codex_suffix = "\n### Response:"
  return codex_prefix .. input .. codex_suffix
end
local codegemma_wrap = function(input)  -- for codegemma
  local codex_prefix = "<start_of_turn>user "
  local codex_suffix = " <end_of_turn> <start_of_turn>model"
  return codex_prefix .. input .. codex_suffix
end

local prompts = require("gen").prompts
-- prompts["Make_Table"] = nil
-- prompts["Make_List"] = nil
-- prompts["Generate"] = nil
-- prompts["Enhance_Code"] = nil
-- prompts["Change_Code"] = nil
-- prompts["Code_Annotation"] = nil
-- prompts["Review_Code"] = nil

prompts["Ask"] = {
  prompt = codegemma_wrap("$input"),
  model_options = {
    stop = {"<end_of_turn>"},
    min_p = 0.05
  },
}
prompts["Change"] = {
  prompt = codegemma_wrap("$input:\n$text"),
  replace = false,
  model_options = {
    stop = {"<end_of_turn>"},
    min_p = 0.05
  },
}
prompts["Enhance_Wording"] = {
  prompt = codegemma_wrap("Improve the following text by better wording. Use casual style and avoid technical jargon. Do not change the meaning of the text:```\n$text\n```"),
  replace = false,
  model = general_model,
  model_options = {
    stop = {"<end_of_turn>"},
    temperature = 0.5,
    min_p = 0.05
  },
}

prompts["Code_Modify"] = {
  -- prompt = "Regarding the following code, $input1, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  prompt = deepseek_wrap("Below is an instruction that describes a task. Write a response that appropriately completes the request.\n$input\n[CODE]\n$text\n[/CODE]\n"),
  replace = false,
  -- extract = "[CODE](.-)[/CODE]"
  extract = "```$filetype\n(.-)```",
  model = coding_model, -- 34b
}
prompts["Code_Enhance"] = {
  prompt =
  deepseek_wrap("Enhance the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```"),
  replace = false,
  extract = "```$filetype\n(.-)```",
  model_options = { min_p = 0.2, },
  model = coding_model,
}
prompts["Code_Review"] = {
  prompt = deepseek_wrap("Review the following code and make concise suggestions:\n```$filetype\n$text\n```"),
  model = coding_model,
}
prompts["Code_Explain"] = {
  prompt = deepseek_wrap("Explain the following code, and make suggestions, if required:\n```$filetype\n$text\n```"),
  model = coding_model,
}
prompts["Code_Generate"] = {
  prompt = deepseek_wrap("$input"),
  replace = false,
  model = coding_model,
  model_options = {
    min_p = 0.4,
  },
}
prompts["Code_Docstring"] = {
  prompt = deepseek_wrap("Explain in one sentence what function below is it doing, and describe function arguments and return value. Output response in '''$filetype''' docstring format:\n```$filetype\n$text\n```"),
  replace = false,
  model = coding_model,
}

prompts["Code_Filld"] = {
  prompt = deepseek_wrap("Below is unfinished code. Judging from the file and code around the unfinished code write a response that appropriately completes the unfinished code.\n$input\n[CODE]\n$text\n[/CODE]\n"),
  replace = false,
  model = coding_model,
}

prompts["Code_Fillg"] = {
  prompt = codegemma_wrap("Below is unfinished code. Judging from the file and code around the unfinished code write a response that appropriately completes the unfinished code.\n$input\n[CODE]\n$text\n[/CODE]\n"),
  replace = false,
}
