# MacDotFiles
Mac OS dot files for the terminal, nvim, vim, VSCode, and more
## NeoVim Configuration
This is a reminder on how to setup my current configuration for other machines, since I just switched from vim to neovim. I also made this as a walkthrough for
one of my friends who was curious about neovim.
You are free to use this configuration, but cannot guarantee that it will work straight of the box.
### Screenshots
![Neovim Configuration](https://github.com/AmielCyber/MacDotFiles/blob/main/screenShots/neovimConfigScreen.png)
### Dot Files Directory
#### Github File Directory
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
#### Actual Directory in Your Unix Home Directory
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
### Neovim Setup
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
        * First **install [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)'s** language parser for correct 
        color highlighting using this vim command `:TSInstall <language_to_install>` 
        * Then **install the Language Server Protocol** using the [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
        plugin with the following vim command `:LSPInstall <language>` then choosing the luanguage server for that language 
            * **Additional configuration may be required** for LSP configuration.
            * See [nvim-lspconfig/doc/server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#remark_ls)
            for dependencies and additional configuration for that particular server.
7. Setup the cababilities for the LSP to run with the cmp plugin in the lua `cmp.setup({` funciton in the init.vim file 
    * Should be a simple line with LSP's defaults like this: 
        * `require['lspconfig']['YOUR_LANGUAGE_SERVER'].setup{ cababilities = capabilites}`
            * You may need to add more to the body for more options to your liking or required configurations for that server
            * Refer to the [nvim-lspconfig doc](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#remark_ls) for those configurations
#### Note:
Some plugins may have language package manager dependencies or other dependencies
* Be sure to read the readme file for any plugin
    * You can do so, by addding the github address to the short hand notation in the plugin section in init.vim
        * For example: `Plug 'neovim/nvim-lspconfig'` => https://github.com/neovim/nvim-lspconfig

My neovim configuration is inspired by the following members of the neovim community
* [ThePrimeagen](https://github.com/ThePrimeagen)
* [TJ DeVries](https://github.com/tjdevries)
* And many more!
## iTerm2 Configuration
### Screenshots
![iTerm Configuration](https://github.com/AmielCyber/MacDotFiles/blob/main/screenShots/iTerm2ConfigScreen.png)
Desktop Wallpaper by [Alena Aenami](https://www.artstation.com/aenamiart)
Following plugins for the zsh shell:
* [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
* [powerlevel10k](https://github.com/romkatv/powerlevel10k)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

iTerm color
* [iter2-monokai-pro](https://github.com/ayatmaulana/iterm2-monokai-pro)

### TO DO
I may add a vim configuration slightly adjusted from my linux terminal in the future.
Seperate neovim settings, plugins, mappings, and lua code in different files instead of having everythin in a single init.vim file.
