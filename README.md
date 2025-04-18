# rnum.nvim

Smart, right-aligned line numbers for Neovim — relative in normal mode, absolute in insert mode.

`rnum.nvim` enhances your line number column using Neovim's `statuscolumn` feature. It dynamically switches between relative and absolute numbers depending on the current mode, with clean right alignment and consistent visual layout.

Thank you for considering supporting this project! Your generosity helps keep development active and ensures the plugin continues to improve.

[![Buy Me A Coffee](https://img.shields.io/badge/-Buy%20me%20a%20coffee-yellow?style=for-the-badge&logo=buy-me-a-coffee&logoColor=white)](https://www.buymeacoffee.com/walkingshamrock)

---

## Features

- **Dynamic Line Numbers**: Relative numbers in normal mode, absolute numbers in insert mode.
- **Right-Aligned Formatting**: Ensures a clean and consistent visual layout.
- **Fixed-Width Number Column**: Prevents layout shifts when switching modes.
- **Highlight for Current Line**: Improves focus and readability.
- **Customizable Width**: Configure the number column width to suit your preferences.

---

## Why I Built This Plugin

I created `rnum.nvim` because I wanted a better way to align the current line number when `relativenumber` is enabled in Neovim. By default, the current line's number aligns to the left, while the relative numbers for other lines align to the right. This inconsistency bothered me, so I built this plugin to ensure clean, right-aligned formatting for all line numbers, regardless of the current mode.

---

## Installation

### Using lazy.nvim

Add the following to your `lazy.nvim` configuration:

```lua
{
  "walkingshamrock/rnum.nvim",
  config = function()
    require("rnum").setup({
      number_width = 4,  -- optional: set custom column width
    })
  end,
}
```

---

## Configuration

`rnum.nvim` provides a simple setup function to customize its behavior. Below are the available options:

- `number_width` (default: `4`): Sets the width of the number column.

Example configuration:

```lua
require("rnum").setup({
  number_width = 6,  -- Adjust the column width to 6
})
```

---

## Requirements

- Neovim 0.9 or later

---

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

---

## Contributing

Contributions are welcome! If you have ideas, bug reports, or improvements, feel free to open an issue or submit a pull request. Let's make `rnum.nvim` even better together!