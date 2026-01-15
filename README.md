# zk-buf-cache.nvim

An extension for [zk-org/zk-nvim](https://github.com/zk-org/zk-nvim) that caches ZK not information in buffer variable.

This bridges tha gap between asynchronous zk-nvim API and other syncronous plugins.

This plugin is currently used by:
- [riodelphino/zk-bufferline.nvim](https://github.com/riodelphino/zk-bufferline.nvim)


## Requirements

- [zk-org/zk](https://github.com/zk-org/zk)
- [zk-org/zk-nvim](https://github.com/zk-org/zk-nvim)


## Installation

Via [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "riodelphino/zk-buf-cache.nvim",
  dependencies = { "zk-org/zk-nvim" },
  opts = {},
}
```

## Config

Defaults:
```lua
require("zk_buf_cache").setup({ 
  select = { "filename", "filenameStem", "title" },
})
```

## Usage

To check the zk info:
```vim
:lua print(vim.inspect(vim.b.zk))
" {
"   filenameStem = "b9iuae",
"   title = "The note title"
" }
```

## License

MIT license. See [LICENSE](LICENSE)


## Related

- [zk-org/zk](https://github.com/zk-org/zk)
- [zk-org/zk-nvim](https://github.com/zk-org/zk-nvim)
- [riodelphino/zk-bufferline.nvim](https://github.com/riodelphino/zk-bufferline.nvim)
