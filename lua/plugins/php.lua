return {
  {
    -- Use the project's phpcs + ruleset when present (e.g. WordPress/WPCS repos),
    -- fall back to Mason's global phpcs otherwise.
    "mfussenegger/nvim-lint",
    opts = function()
      local phpcs = require("lint").linters.phpcs
      phpcs.cmd = function()
        local local_bin = vim.fs.find("vendor/bin/phpcs", { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]
        return local_bin or "phpcs"
      end
      phpcs.args = {
        "-q",
        "--report=json",
        function()
          local ruleset =
            vim.fs.find({ ".phpcs.xml", "phpcs.xml", ".phpcs.xml.dist", "phpcs.xml.dist" }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]
          return ruleset and ("--standard=" .. ruleset) or "--standard=PSR12"
        end,
        "-",
      }
    end,
  },
  {
    -- Only format with php-cs-fixer in projects that actually have its config
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        php_cs_fixer = { require_cwd = true },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              -- Setting stubs replaces the defaults, so list them all + wordpress
              stubs = {
                "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype",
                "curl", "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo",
                "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv",
                "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta",
                "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO",
                "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar",
                "posix", "pspell", "random", "readline", "Reflection", "session",
                "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL",
                "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem",
                "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc",
                "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
                "wordpress", "wp-cli",
              },
            },
          },
        },
      },
    },
  },
}
