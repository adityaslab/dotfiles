--require('lsp.java-lsp')
--require('lsp.python-lsp')
--require('lsp.lua-lsp')


local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end


vim.cmd[[
    nnoremap <A-CR> <Cmd>lua require('jdtls').code_action(require('telescope.themes').get_dropdown({winblend = 10}))<CR>
    vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
    nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>
    nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
    nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
    vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
    nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
    vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
    vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

    command! -buffer JdtCompile lua require('jdtls').compile()
    command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
    command! -buffer JdtJol lua require('jdtls').jol()
    command! -buffer JdtBytecode lua require('jdtls').javap()
    command! -buffer JdtJshell lua require('jdtls').jshell()
]]

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

--JDTLS
-- find_root looks for parent directories relative to the current buffer containing one of the given arguments.
--require('jdtls').start_or_attach({cmd = {'launch_jdtls.sh'}, root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})})

local util = require "lspconfig/util"
require'lspconfig'.jdtls.setup {
    on_attach = on_attach,
    cmd = {"launch_jdtls.sh"},
    filetypes = { "java" },
    root_dir = util.root_pattern { ".git", "build.gradle", "pom.xml" },
    --root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})
    -- init_options = {bundles = bundles}
    -- on_attach = require'lsp'.common_on_attach
}


--Lua LSP
local sumneko_root_path = vim.fn.stdpath('cache')..'/nvim_lsp/sumneko_lua/lua'
local sumneko_binary = sumneko_root_path.. "/sumneko-lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  on_attach =on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
          },
  },
}


--clangd
local clangd_path = vim.fn.stdpath('data')..'/lspinstall/cpp/clangd/bin/clangd'


require'lspconfig'.clangd.setup{
    cmd = {clangd_path, "--background-index"},
    filetypes ={ "c", "cpp", "objc", "objcpp"},
    on_attach =on_attach,
}


