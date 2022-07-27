local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  -- checking if width is < 80 
  return vim.fn.winwidth(0)>80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = true,
  always_visible = true,
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns
  then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local diff = {
  -- git status
  "diff",
  source= diff_source,
  color="false",
  symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
}

local filetype = {
  "filetype",
  icons_enabled=false,
}

local location = {
  "location",
  padding = 0,
}

local spaces = function()
  -- num of spaces for tab (?)
  return "spaces: " .. vim.api.nvim_buf_get_option(0,"shiftwidth")
end

 local scrollbar = {
    function()
      local current_line = vim.fn.line "."
      local total_lines = vim.fn.line "$"
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 0, right = 0 },
    -- color = { fg = colors.yellow, bg = colors.bg },
    cond = nil,
  }


local lsp = {
    function(msg)
      msg = msg or "LS Inactive"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        -- TODO: clean up this if statement
        if type(msg) == "boolean" or #msg == 0 then
          return "LS Inactive"
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      -- add formatter
      local formatters = require "lvim.lsp.null-ls.formatters"
      local supported_formatters = formatters.list_registered(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local linters = require "lvim.lsp.null-ls.linters"
      local supported_linters = linters.list_registered(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      local unique_client_names = vim.fn.uniq(buf_client_names)
      return "[" .. table.concat(unique_client_names, ", ") .. "]"
    end,
    color = { gui = "bold" },
    -- cond = hide_in_width,
  }

-- would normally be require("lualine").setup, but already called it above
lualine.setup {
 options={
  globalstatus=true,
  icons_enabled=true,
  theme='auto',
  component_separators = '',
  section_separators = '',
    -- always_divide_middle=true
  },
   sections = {
    lualine_a = { "mode" },
    lualine_b = {diagnostics},
    lualine_c = { "%=", "branch",  "filename" },
    lualine_x = { diff, filetype },
    lualine_y = { lsp },
    lualine_z = { scrollbar },
  },
}
