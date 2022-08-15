# MacDotFiles

Mac OS dot files for the terminal, nvim, vim, VSCode, and more

## NeoVim Configuration

This is a reminder on how to setup my current configuration for other machines, since I just switched from vim to neovim. I also made this as a walkthrough for
one of my friends who was curious about Neovim.
You are free to use this configuration, but cannot guarantee that it will work straight of the box.

### Screenshots

![Neovim Configuration](/screenShots/neovimConfigScreen.png)

### Dot Files Directory

#### Github File Directory

```bash
├── README.md
├── iterm2
│   └── colorschemes
│       └── monokai_pro.itermcolors
├── nvim
│   ├── README.md
│   ├── after
│   │   └── plugin
│   │       └── pluginconfigs.lua
│   ├── init.lua
│   ├── lua
│   │   ├── keymappings.lua
│   │   ├── lsp.lua
│   │   ├── plugins.lua
│   │   └── vimsettings.lua
```

#### Actual Directory in Your Unix Home Directory After installation

```bash
~/
├── .config
│   ├── iterm2
│   │   └── colorschemes
│   │       └── monokai_pro.itermcolors
│   └── nvim
│       ├── after
│       │   └── plugin
│       │       └── pluginconfigs.lua
│       ├── init.lua
│       ├── lua
│       │   ├── keymappings.lua
│       │   ├── lsp.lua
│       │   ├── plugins.lua
│       │   └── vimsettings.lua
│       └── plugin
│           └── packer_compiled.lua
└── .vim
    └── undodir
```

### Neovim Setup

1. Recommended package installs using your preffered package manager. For example, using brew:
   - `brew install git`
   - `brew install neovim`
     - Or through github [Install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
   - `brew install ripgrep`
   - `brew install cmake`
   - `brew install fd`

2. [Install packer.nvim](https://github.com/wbthomason/packer.nvim)

3. Copy the nvim directory into the `~/.config/` directory

4. In Neovim run the following:
   - `:PackerClean`
   - `:PackerCompile`
   - `:PackerInstall`

5. Install the Luanguage Server Protocol for your languages
   - LSP installation goes like this:
     - First **install [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)'s** language parser for correct
       color highlighting using this vim command `:TSInstall <language_to_install>`
     - Then **install the Language Server Protocol** using the [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
       plugin with the following vim command `:LSPInstall <language>` then choosing the luanguage server for that language
       _ **Additional configuration may be required** for LSP configuration.
       _ See [nvim-lspconfig/doc/server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#remark_ls)
       for dependencies and additional configuration for that particular server.

6. Setup the capabilities for the LSP to run with the cmp plugin in the lua `cmp.setup({` function in the init.vim file
   - Should be a simple line with LSP's defaults like this:
     - `require['lspconfig']['YOUR_LANGUAGE_SERVER'].setup{ capabilities = capabilities}`
       - You may need to add more to the body for more options to your liking or required configurations for that server
       - Refer to the [nvim-lspconfig doc](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#remark_ls) for those configurations
         or [mason.nvim](https://github.com/williamboman/mason.nvim)

#### Note:
##### Undo directory plugin
Neovim settings file in _~/.config/nvim/lua/vimsettings.lua_ will create the folder below

```bash
~/
└─── .vim/
     └── undodir/
```

If you want the undodir to be somewhere else, then change this line
`vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"`
located in the directory _~/.config/nvim/lua/vimsettings.lua_ to your desired directory

##### Plugin Dependencies

Some plugins may have language package manager dependencies or other dependencies

- Be sure to read the readme file for any plugin
  - You can do so, by adding the github address to the short hand notation in the plugin section in ~/.config/nvim/lua/vimplugins.lua
    - For example: `use 'neovim/nvim-lspconfig'` => https://github.com/neovim/nvim-lspconfig

##### Inspired By
My Neovim configuration is inspired by the following members of the neovim community

- [ThePrimeagen](https://github.com/ThePrimeagen)
- [TJ DeVries](https://github.com/tjdevries)
- And many more!

## iTerm2 Configuration

### Screenshots

![iTerm Configuration](/screenShots/iTerm2ConfigScreen.png)
Desktop Wallpaper by [Alena Aenami](https://www.artstation.com/aenamiart)

Following plugins for the zsh shell:

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

iTerm color

- [iter2-monokai-pro](https://github.com/ayatmaulana/iterm2-monokai-pro)

## TO DO

I may add a vim configuration slightly adjusted from my linux terminal in the future.

[x] Separate neovim settings, plugins, mappings, and lua code in different files instead of having everything in a single init.vim file (done).
