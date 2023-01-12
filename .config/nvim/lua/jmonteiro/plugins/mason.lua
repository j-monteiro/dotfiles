require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { 
    "sumneko_lua", 
    "solargraph",
    "gopls"
  } 
})
require("lspconfig").sumneko_lua.setup {}
require("lspconfig").solargraph.setup {}
require("lspconfig").gopls.setup {}
