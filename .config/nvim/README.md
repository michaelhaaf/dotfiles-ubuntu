<div align="center">
  
# Neovim Config

Simple but featured. Focused on ergonomics, mnemonics and consistency. 
  
Cherry pick the lines you need and totally understand. 
  
Always a WIP 🏗
  
<img width="1728" alt="Screen Shot 2022-03-18 at 22 30 06" src="https://user-images.githubusercontent.com/11582667/159108482-c02407c0-9861-47c1-adf6-08bd8a952c1f.png">

</div>

# Features

* Nvim builtin LSP client ([nvim-lspconfig](https://github.com/neovim/nvim-lspconfig))

  Function signature hint, symbols outline, LSP progress indicator, etc
  
* Powerful completion backed by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* Extended wildmenu with autocomplete ([wilder.nvim](https://github.com/gelguy/wilder.nvim))
* Fuzzy finder for everything via [telescope](https://github.com/nvim-telescope/telescope.nvim)
* Enhanced quickfix ([nvim-bqf](https://github.com/kevinhwang91/nvim-bqf))
* Comprehensive text objects
* Treesitter support

  Modern syntax highlighting, commenting, showing context, elements swap, etc
  
* Smart tag management. 
* Well organized key mappings (see next section below)
* Snippet support powered by [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
* Fully Git integration
* Many essential plugins to boost productivity

# Key mappings

I assign the key mappings rationally aiming to make them efficient and easy to remember. 

* Multiple leader keys

  Other than `<Space>` that is set as the general leader key, `\` and `,` act as the leader keys for toggling and LSP respectively.
  
* Mnemonic

  Key bindings are organized using mnemonic prefixes like `<Leader>b` for buffer, `<Leader>f` for fuzzy finder, `<Leader>w` for window, etc.
  
* Consistent

  Similar functionalities have the same key binding throughout my dotfiles. For example, `,` and `.` for moving tabs in both kitty and Neovim.
