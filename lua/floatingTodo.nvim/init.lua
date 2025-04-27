local buf -- Variable to hold the buffer ID

local function winopts()
  return {
    relative = 'editor',
    width = 80,
    height = 30,
    row = 10,
    col = 10,
    border = "rounded",
  }
end

local function expandPathHome(path)
  return os.getenv("HOME") .. "/" .. path
end

local function createBuffer(file_path)
  if buf == nil then
    -- Open the file
    local file = io.open(file_path, "r")
    if not file then
      print("Could not open file: " .. file_path)
      return
    end

    -- Read the entire content of the file
    local content = file:read("*a")
    file:close()

    -- Create a new buffer
    buf = vim.api.nvim_create_buf(false, false) -- false: not listed, true: scratch

    -- Set the buffer content
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))

    -- Set the buffer name to the file path
    vim.api.nvim_buf_set_name(buf, file_path)
  end

  return buf
end

local function OpenFloat()
  local file_path = expandPathHome(".todo.md")

  -- Check if the buffer already exists
  buf = createBuffer(file_path)

  -- Create or open the floating window
  local win = vim.api.nvim_open_win(buf, true, winopts())
end

-- Create a user command to open the floating window
vim.api.nvim_create_user_command('Note', OpenFloat, {})
