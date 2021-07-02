require'lspconfig'.jdtls.setup {
    on_attach = require'completion'.on_attach,
    cmd = {"launch_jdtls.sh"},
    filetypes = { "java" },
    -- root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})
    -- init_options = {bundles = bundles}
    -- on_attach = require'lsp'.common_on_attach
}



