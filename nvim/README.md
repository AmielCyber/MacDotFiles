# NeoVim Configuration
This is a reminder on how to setup my current configuration for other machines. I also made this as a walkthrough for
one of my friends who was curious about neovim.
You are free to use this configuration, but cannot guarantee that it will work straight of the box.
## Screenshots
![Neovim Configuration](https://github.com/AmielCyber/MacDotFiles/blob/main/screenShots/neovimConfigScreen.png)
## Dot Files Directory
### Github File Directory
```bash
├── README.md
├── iterm2
│   └── colorschemes
│       └── monokai_pro.itermcolors
└── nvim
    ├── init.vim
    ├── plugged
    │   └── text.txt
    └── undodir
```
### Actual Directory in Your Home Folder
```bash
~/
└─── .config
     ├── iterm2
     │   └── colorschemes
     │       └── monokai_pro.itermcolors
     └── nvim
         ├── init.vim
         ├── plugged
         └── undodir 
```
## Neovim Setup
1. Make sure you have the following directories in your .config home directory
    * If not, then create those directories
```bash 
~/
└─── .config/
     └── nvim/
         ├── plugged/
         └── undodir/ 
```
2. Install Neovim
    * [Installation Instructions](https://github.com/neovim/neovim/wiki/Installing-Neovim)

3. Install Vim-Plug
    * [vim-plug repo](https://github.com/junegunn/vim-plug)
4. Copy the init.vim into the `~/.config/nvim/` directory or copy nvim folder to your `/.config/` directory
5. In neovim run `:PlugInstall`
6. Install Luanguage Server Protocol for your languages 
    * LSP installation goes like this:
        * First install [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)'s language parser for correct 
        color highlighting using this vim command `:TSInstall <language_to_install>` 
        * Then install the Language Server Protocol using the [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
        plugin with the following vim command `:LSPInstall <language>` then choosing the luanguage server for that language 
            * Note, that you may have to install some dependencies for that server if it fails to attach ([LSP plugins](https://github.com/neovim/nvim-lspconfig/wiki/Language-specific-plugins))
7. Setup the cababilities for the LSP to run with the cmp plugin in the lua `cmp.setup({` funciton in the init.vim file 
    * Should be a simple line with LSP's defaults like this: 
        * `require['lspconfig']['YOUR_LANGUAGE_SERVER'].setup{ cababilities = capabilites}`
        * You may need to add more to the body for more configurations to your liking
#### Note:
* Some plugins may have npm dependencies or other dependencies

