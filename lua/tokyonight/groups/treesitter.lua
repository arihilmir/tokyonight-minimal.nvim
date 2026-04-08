local Util = require("tokyonight.util")

local M = {}

---@type tokyonight.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    ["@annotation"]                 = { fg = c.fg },
    ["@attribute"]                  = { fg = c.fg },
    ["@boolean"]                    = "Boolean",
    ["@character"]                  = "Character",
    ["@character.printf"]           = "SpecialChar",
    ["@character.special"]          = "SpecialChar",
    ["@comment"]                    = "Comment",
    ["@comment.error"]              = { fg = c.error },
    ["@comment.hint"]               = { fg = c.hint },
    ["@comment.info"]               = { fg = c.info },
    ["@comment.note"]               = { fg = c.hint },
    ["@comment.todo"]               = { fg = c.todo },
    ["@comment.warning"]            = { fg = c.warning },
    ["@constant"]                   = "Constant",
    ["@constant.builtin"]           = "Constant",
    ["@constant.macro"]             = "Define",
    ["@constructor"]                = { fg = c.teal }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@constructor.tsx"]            = { fg = c.blue1 },
    ["@diff.delta"]                 = "DiffChange",
    ["@diff.minus"]                 = "DiffDelete",
    ["@diff.plus"]                  = "DiffAdd",
    ["@function"]                   = { fg = c.teal },
    ["@function.builtin"]           = { fg = c.teal },
    ["@function.call"]              = "@function",
    ["@function.macro"]             = "Macro",
    ["@function.method"]            = { fg = c.teal },
    ["@function.method.call"]       = { fg = c.teal },
    ["@keyword"]                    = { fg = c.fg, style = opts.styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword.conditional"]        = { fg = c.teal },
    ["@keyword.coroutine"]          = "@keyword",
    ["@keyword.debug"]              = { fg = c.fg },
    ["@keyword.directive"]          = "PreProc",
    ["@keyword.directive.define"]   = "Define",
    ["@keyword.exception"]          = "Exception",
    ["@keyword.function"]           = { fg = c.teal, style = opts.styles.functions }, -- For keywords used to define a function.
    ["@keyword.import"]             = { fg = c.fg },
    ["@keyword.operator"]           = "@keyword",
    ["@keyword.repeat"]             = { fg = c.teal },
    ["@keyword.return"]             = { fg = c.teal },
    ["@keyword.storage"]            = { fg = c.fg },
    ["@label"]                      = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
    ["@markup"]                     = "@none",
    ["@markup.emphasis"]            = { italic = true },
    ["@markup.environment"]         = "Macro",
    ["@markup.environment.name"]    = "Type",
    ["@markup.heading"]             = "Title",
    ["@markup.italic"]              = { italic = true },
    ["@markup.link"]                = { fg = c.teal },
    ["@markup.link.label"]          = "SpecialChar",
    ["@markup.link.label.symbol"]   = "Identifier",
    ["@markup.link.url"]            = "Underlined",
    ["@markup.list"]                = { fg = c.blue5 }, -- For special punctutation that does not fall in the categories before.
    ["@markup.list.checked"]        = { fg = c.green1 }, -- For brackets and parens.
    ["@markup.list.markdown"]       = { fg = c.orange, bold = true },
    ["@markup.list.unchecked"]      = { fg = c.blue }, -- For brackets and parens.
    ["@markup.math"]                = "Special",
    ["@markup.raw"]                 = "String",
    ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.blue },
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.strong"]              = { bold = true },
    ["@markup.underline"]           = { underline = true },
    ["@module"]                     = "Include",
    ["@module.builtin"]             = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@namespace.builtin"]          = "@variable.builtin",
    ["@none"]                       = {},
    ["@number"]                     = "Number",
    ["@number.float"]               = "Float",
    ["@operator"]                   = { fg = c.teal }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@property"]                   = { fg = c.fg },
    ["@punctuation.bracket"]        = { fg = c.fg_dark }, -- For brackets and parens.
    ["@punctuation.delimiter"]      = { fg = c.blue5 }, -- For delimiters ie: `.`
    ["@punctuation.special"]        = { fg = c.blue5 }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special.markdown"] = { fg = c.orange }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@string"]                     = "String",
    ["@string.documentation"]       = { fg = c.yellow },
    ["@string.escape"]              = { fg = c.teal }, -- For escape characters within a string.
    ["@string.regexp"]              = { fg = c.blue6 }, -- For regexes.
    ["@tag"]                        = "Label",
    ["@tag.attribute"]              = "@property",
    ["@tag.delimiter"]              = "Delimiter",
    ["@tag.delimiter.tsx"]          = { fg = Util.blend_bg(c.blue, 0.7) },
    ["@tag.tsx"]                    = { fg = c.red },
    ["@tag.javascript"]             = { fg = c.red },
    ["@type"]                       = { fg = c.fg},
    ["@type.builtin"]               = { fg = c.fg },
    ["@type.definition"]            = { fg = c.fg},
    ["@type.qualifier"]             = { fg = c.fg },
    ["@variable"]                   = { fg = c.fg, style = opts.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"]           = { fg = c.fg }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.member"]            = { fg = c.fg }, -- For fields.
    ["@variable.parameter"]         = { fg = c.fg }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = c.fg }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    ["@lsp.typemod.class.declaration"] = { fg = c.yellow },
    ["@lsp.typemod.function.declaration"] = { fg = c.yellow },
    ["@lsp.typemod.type.defaultLibrary.cpp"] = { fg = c.fg },
  }

  for i, color in ipairs(c.rainbow) do
    ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true, bg = Util.blend_bg(color, 0.1) }
  end
  return ret
end

return M
