local new_bin = function(opts)
  local path = vim.api.nvim_buf_get_name(0)
  local root = string.gsub(path, 'src/.*rs', '')

  local new_bin_name = opts.args
  local file_name = root .. 'src/' .. new_bin_name .. '.rs'

  if vim.uv.fs_stat(file_name) then
    vim.cmd.edit(file_name)
    return
  end

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf) == file_name then
      vim.api.nvim_win_set_buf(0, buf)
      return
    end
  end

  local cargo_toml = io.open(root .. 'Cargo.toml', 'a')
  if cargo_toml == nil then
    vim.notify('Cannot find Cargo.toml, root: ' .. root)
    return
  end

  local formatted_entry = string.format([=[

  [[bin]]
  name = "%s"
  path = "src/%s.rs"
  ]=], new_bin_name, new_bin_name)
  cargo_toml:write(formatted_entry)
  cargo_toml:close()

  vim.cmd.edit(file_name)
  vim.api.nvim_buf_set_lines(0, 0, 0, false, {
    'fn main() {',
    '',
    '}',
  })
end

vim.api.nvim_create_user_command('CargoNewBin', new_bin, {
  nargs = 1,
})
