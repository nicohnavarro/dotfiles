return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "j-hui/fidget.nvim", opts = {} },
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    -- Set up LspAttach autocmd
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(event)
        local opts = { buffer = event.buf, silent = true }

        -- Custom key mappings
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          keymap.set(
            mode,
            keys,
            func,
            { buffer = event.buf, desc = "LSP: " .. desc, silent = true }
          )
        end

        -- Keybindings for various LSP actions
        map(
          "gd",
          require("telescope.builtin").lsp_definitions,
          "[G]oto [D]efinition"
        )
        map(
          "gr",
          require("telescope.builtin").lsp_references,
          "[G]oto [R]eferences"
        )
        map(
          "gI",
          require("telescope.builtin").lsp_implementations,
          "[G]oto [I]mplementation"
        )
        map(
          "<leader>D",
          require("telescope.builtin").lsp_type_definitions,
          "Type [D]efinition"
        )
        map(
          "<leader>ds",
          require("telescope.builtin").lsp_document_symbols,
          "[D]ocument [S]ymbols"
        )
        map(
          "<leader>ws",
          require("telescope.builtin").lsp_dynamic_workspace_symbols,
          "[W]orkspace [S]ymbols"
        )
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map(
          "<leader>ca",
          vim.lsp.buf.code_action,
          "[C]ode [A]ction",
          { "n", "v" }
        )
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map(
          "<leader>d",
          vim.diagnostic.open_float,
          "Show [D]iagnostics for Line"
        )
        map("[d", vim.diagnostic.goto_prev, "Go to Previous Diagnostic")
        map("]d", vim.diagnostic.goto_next, "Go to Next Diagnostic")
        map("K", vim.lsp.buf.hover, "Show Documentation")
        map("<leader>rs", ":LspRestart<CR>", "Restart LSP")

        -- Auto commands for document highlights
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
          client
          and client.supports_method(
            vim.lsp.protocol.Methods.textDocument_documentHighlight
          )
        then
          local highlight_augroup = vim.api.nvim_create_augroup(
            "LspDocumentHighlight",
            { clear = false }
          )
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
        end

        -- Toggle inlay hints if supported
        if
          client
          and client.supports_method(
            vim.lsp.protocol.Methods.textDocument_inlayHint
          )
        then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
            )
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    -- Set up capabilities with nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change diagnostic symbols
    local signs =
      { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Define LSP servers with custom configurations
    local servers = {
      ts_ls = {},
      ruff = {},
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              mccabe = { enabled = false },
              pylsp_mypy = { enabled = false },
              pylsp_black = { enabled = false },
              pylsp_isort = { enabled = false },
            },
          },
        },
      },
      html = { filetypes = { "html", "twig", "hbs" } },
      cssls = {},
      tailwindcss = {},
      dockerls = {},
      sqlls = {},
      terraformls = {},
      jsonls = {},
      yamlls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            diagnostics = { disable = { "missing-fields" } },
            format = {
              enable = false,
            },
          },
        },
      },
      svelte = {
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
          })
        end,
      },
      graphql = {
        filetypes = {
          "graphql",
          "gql",
          "svelte",
          "typescriptreact",
          "javascriptreact",
        },
      },
      emmet_ls = {
        filetypes = {
          "html",
          "typescriptreact",
          "javascriptreact",
          "css",
          "sass",
          "scss",
          "less",
          "svelte",
        },
      },
    }

    -- Install Mason and LSP servers
    require("mason").setup()
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { "stylua" })
    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
    })

    mason_lspconfig.setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend(
            "force",
            {},
            capabilities,
            server.capabilities or {}
          )
          lspconfig[server_name].setup(server)
        end,
      },
    })
  end,
}
