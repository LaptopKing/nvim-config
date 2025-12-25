return {
  'catgoose/nvim-colorizer.lua',
  cmd = "ColorizerToggle",
  opts = {
    user_default_options = {
      RGB = true, -- #RRGGBB
      RRGGBBAA = true, -- #RRGGBBAA
      names = true, -- "Name"
      rgb_fn = true, -- rgb(r,g,b)
      hsl_fn = true, -- hsl(h,s,l)
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBBAA
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    }
  },
  keys = {
    { "<leader>c#", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" }
  }
}