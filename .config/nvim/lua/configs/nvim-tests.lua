require("nvim-test").setup {
  silent = false,
  term = "terminal",
}

require("nvim-test.runners.rspec"):setup {
  command = "docker compose -f docker-compose.yml -f docker-compose-praveen.yml --env-file .env --env-file .my_env exec spring bundle exec spring rspec",
  file_pattern = "\\v_spec\\.rb$",
  find_files = "{name}_spec.{ext}",
}
