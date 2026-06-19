local _EWIN = nil

local function get_files(path, depth)
  local files = {}
  local target = vim.fn.getcwd()
  if path then
    target = path
  end

  local handle = vim.uv.fs_scandir(target)
  if not handle then
    return files
  end

  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end

    local _depth = 1
    if depth then
      _depth = depth
    end
    table.insert(files, { name = name, type = type, depth = _depth, open = false })
  end

  return files
end

local function get_filename(path)
  local regex = vim.regex("[^/]*$")
  local abspath = path
  local begin_idx, end_idx = regex:match_str(abspath)
  return string.sub(abspath, begin_idx + 1)
end

local function get_dir_by_file(relpath)
  local regex = vim.regex("[^/]*$")
  local begin_idx, end_idx = regex:match_str(relpath)
  if (end_idx - begin_idx) == #relpath then
    return "."
  end
  return string.sub(relpath, 1, begin_idx - 1)
end

local function create_explorer_format(files, cwd)
  local lines = {}
  if cwd then
    table.insert(lines, cwd)
  end

  for _, file in ipairs(files) do
    local name = get_filename(file.name)
    if file.type == "directory" then
      name = name .. "/"
    end

    local prefix = ""
    for _ = 1, file.depth, 1 do
      prefix = prefix .. "    "
    end
    table.insert(lines, prefix .. name)
  end

  return lines
end

local function get_cursor_file(files, ewin)
  local pos = vim.api.nvim_win_get_cursor(ewin)
  if not pos then
    return nil
  end
  local idx = pos[1] - 1

  return files[idx], idx
end

local function expand_directory(files, idx)
  local this = files[idx]
  this.open = true
  local up = vim.list_slice(files, 0, idx)
  local this_files = vim.tbl_map(
    function (f)
      return { name = this.name .. "/" .. f.name, type = f.type, depth = f.depth, open = f.open }
    end, get_files(this.name, this.depth + 1))
  local down = vim.list_slice(files, idx + 1)

  return vim.list_extend(vim.list_extend(up, this_files), down)
end

local function contract_directory(files, idx)
  local this = files[idx]
  local count = 0;
  this.open = false
  for i = idx + 1, #files, 1 do
    if files[i].depth <= this.depth then
      break
    end
    count = count + 1
  end

  local up = vim.list_slice(files, 0, idx)
  local down = vim.list_slice(files, idx + count + 1)
  return vim.list_extend(up, down)
end

local function insert_file(files, this)
  local thisname = get_filename(this.name)
  local thisdir  = get_dir_by_file(this.name)

  local idx = 0

  local indir = nil;
  for i, f in ipairs(files) do
    local fdir = get_dir_by_file(f.name)
    if f.type == "directory" then
      fdir = f.name
    end
    idx = i
    if not indir then
      if fdir == thisdir then
        indir = true
      end
    else
      if f.depth > this.depth then
        goto continue
      elseif f.depth < this.depth then
        idx = i - 1
        break
      elseif get_filename(f.name) > thisname then
        idx = i - 1
        break
      end
    end
    ::continue::
  end

  local up = vim.list_slice(files, 0, idx)
  local down = vim.list_slice(files, idx + 1)
  return vim.list_extend(vim.list_extend(up, { this }), down)
end

local function close_filer()
  if _EWIN then
    if vim.api.nvim_win_is_valid(_EWIN) then
      vim.api.nvim_win_close(_EWIN, true)
    end
    _EWIN = nil
  end
end

local function open_filer()
  local files = get_files()
  local cwd = get_filename(vim.fn.getcwd())
  local lines = create_explorer_format(files, cwd)

  local buf = vim.api.nvim_create_buf(false, true)
  local pwin = vim.api.nvim_get_current_win()

  local width = math.min(40, vim.o.columns - 10)
  local height = vim.o.lines
  _EWIN = vim.api.nvim_open_win(buf, true, {
    split = "left",
    width = width,
    height = height,
    anchor = "NW",
    style = "minimal",
  })

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  vim.api.nvim_set_option_value('modifiable', false, { buf = buf })

  vim.api.nvim_buf_set_keymap(buf, "n", "l", "", {
    callback = function ()
      vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
      local this, idx = get_cursor_file(files, _EWIN)
      if not this then
        return
      end
      print(this.name)
      if this.type == "directory" and not this.open then
        files = expand_directory(files, idx)
        lines = create_explorer_format(files, cwd)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      elseif this.type == "file" then
        local b = vim.fn.bufadd(this.name)
        if vim.api.nvim_win_is_valid(pwin) then
          vim.api.nvim_win_set_buf(pwin, b)
          vim.api.nvim_set_current_win(pwin)
        else
          pwin = vim.api.nvim_open_win(b, true, {
            split = "right",
          })
          vim.api.nvim_win_close(_EWIN, true)
          _EWIN = nil
        end
      end
      vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
    end
  })

  vim.api.nvim_buf_set_keymap(buf, "n", "h", "", {
    callback = function ()
      vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
      local this, idx = get_cursor_file(files, _EWIN)
      if not this then
        return
      end
      if this.type == "directory" and this.open then
        files = contract_directory(files, idx)
        lines = create_explorer_format(files, cwd)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      end
      vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
    end
  })

  vim.api.nvim_buf_set_keymap(buf, "n", "a", "", {
    callback = function ()
      vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
      local this, idx = get_cursor_file(files, _EWIN)
      if not this then
        return
      end

      local dir
      local depth
      if this.type == "file" then
        dir = get_dir_by_file(this.name)
        depth = this.depth
      elseif this.type == "directory" then
        dir = this.name
        depth = this.depth + 1
      else
        return
      end

      vim.ui.input({ prompt = "Create a new file " .. dir .. "/" }, function (input)
        if not input then
          print("abort!")
          return
        end
        local file = {
          name = dir .. "/" .. input,
          type = "file",
          open = false,
          depth = depth,
        }
        if vim.fn.filereadable(file.name) == 1 or vim.fn.isdirectory(file.name) == 1 then
          print("file already exists!")
          return
        end
        vim.fn.writefile({}, file.name)
        print(file.name .. " created.")
        files = insert_file(files, file)
        lines = create_explorer_format(files, cwd)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      end)
      vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
    end
  })

  vim.api.nvim_buf_set_keymap(buf, "n", "<S-a>", "", {
    callback = function ()
      vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
      local this, idx = get_cursor_file(files, _EWIN)
      if not this then
        return
      end

      local dir
      local depth
      if this.type == "file" then
        dir = get_dir_by_file(this.name)
        depth = this.depth
      elseif this.type == "directory" then
        dir = this.name
        depth = this.depth + 1
      else
        return
      end

      vim.ui.input({ prompt = "Create a new directory " .. dir .. "/" }, function (input)
        if not input then
          print("abort!")
          return
        end
        local file = {
          name = dir .. "/" .. input,
          type = "directory",
          open = false,
          depth = depth,
        }
        if vim.fn.filereadable(file.name) == 1 or vim.fn.isdirectory(file.name) == 1 then
          print("file already exists!")
          return
        end
        vim.fn.mkdir(file.name)
        print(file.name .. " was created.")
        files = insert_file(files, file)
        lines = create_explorer_format(files, cwd)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      end)
      vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
    end
  })

  vim.api.nvim_buf_set_keymap(buf, "n", "d", "", {
    callback = function ()
      vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
      local this, idx = get_cursor_file(files, _EWIN)
      if not this or not idx then
        return
      end

      vim.ui.input({ prompt = "Remove " .. this.name .. " (Y/n):" }, function (input)
        if not input then
          print("abort")
          return
        end
        if input == "n" then
          print("abort")
          return
        end

        local success
        if this.type == "directory" then
          files = contract_directory(files, idx)
          table.remove(files, idx)
          success = vim.fn.delete(this.name, "rf")
        else
          table.remove(files, idx)
          success = vim.fn.delete(this.name)
        end
        if success then
          print(this.name .. " was deleted.")
        else
          print("error!")
          return
        end
        lines = create_explorer_format(files, cwd)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      end)
      vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
    end
  })

  vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
    callback = function ()
        close_filer()
    end
  })
end

vim.api.nvim_create_user_command("PureExOpen", function ()
  if not _EWIN or not vim.api.nvim_win_is_valid(_EWIN) then
    open_filer()
  end
end, {})

vim.api.nvim_create_user_command("PureExClose", function ()
  if _EWIN then
    close_filer()
  end
end, {})

return {
  open_filer,
  get_files
}

