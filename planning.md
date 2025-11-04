# Current State

This is an increasingly modified take on the kickstart-modular config.

## REPL

We have a preliminary, functional, install of `iron.nvim`. This keeps everything within NeoVim itself (as compared with something like `vim-slime`, which sends code out to external terminals). 


## LSP

One of the big changes I've made is migrating over to the new (as of Nvim .11) native LSP configuration API, rather than using `mason-lspconfig` and `nvim-lspconfig` to auto-configure. We're still mostly getting the configs from `nvim-lspconfig`, and we're not deleting the plugin (yet, anyways), but we're not directly relying on anything about its installation, I don't think. 

Currently, we're testing out just using the default keybinds etc., which (I believe) obviates the need for an autocmd or anything (as currently in standard in kickstart.nvim).

The only concern presently is that this version may crash/have problems if we try and start it from scratch (e.g., on a new machine) since I'm not sure it currently enforces the correct ordering of mason -> install the ensure installed servers -> attempt to call the installed servers.


# Planning / To-Do's

- Add something to handle references, e.g.:
    - https://github.com/jalvesaq/zotcite
    - https://github.com/jmbuhr/telescope-zotero.nvim
- Get a good markdown/quarto/rmarkdown rendering setup. 
    - https://github.com/jghauser/auto-pandoc.nvim
    - glow?
- Get a setup for LSP and treesitter that I like. In particular, I may want: 
    - More selection groups (i.e., custom queries) for treesitter, allowing me to, e.g., select the full text of an if/then statement so I can easily send it to the REPL. 
    - Maybe add back the in-line LSP corrections/warnings. 
    - Consider alternative and/or additional keymaps for LSP and treesitter stuff (e.g., for the custom queries named above). 
- Additional plugins: 
    - for viewing the current doc as an outline
    - for code/section folding
    - for session management (maybe `neovim-session-manager`)
- `telescope.nvim` currently uses <C-n>/<C-p> for next/previous within its pickers. I may want to change this to match my new <C-j>/<C-k> maps for autocompletion. 
- Add `otter.nvim` and get an integrated writing+coding experience up and running (ideally for both Rmarkdown and quarto). 
- Eventually, I think I want to consolidate and rewrite the config from the ground up, with the goal of removing all of the organization, cruft, and boilerplate that I am no longer using, and turning it into a config that is sensibly organized and built from the start to match where I want it to go. This includes stuff like dropping the division between `custom/` and `kickstart/` and possibly adding a different kind of organization (e.g., `core/`, `utilities/`, etc.). This would also probably involve a full review and accounting of keymaps and other ergonomic decisions. 
- Get `devdocs.nvim` fully set up (i.e., so that it has all of the docs available)


# Resources

[A brief guide to using Neovim as an R (and Quarto) development environment](https://petejon.es/posts/2025-01-29-using-neovim-for-r/)

Example configs:

- https://github.com/jmbuhr/nvim-config/
- https://github.com/hendrikmi/dotfiles/
- https://codeberg.org/pjphd/neovim_config/

# To-Done
- Could setup custom Neotree keymaps and display options; e.g., so it's not a constant sidebar on the left, but rather a floating window we can pull into focus. 
- Easy buffer switching via `buffer-manager.nvim` and some new keymaps. 
- Maybe test out alternate keymaps for autocompletion. Specifically, I've seen at least one person use <C-j>/<C-k> for next/previous and then keeping <TAB> for select. This seems maybe more intuitive, since it further leverages the default vim-motions keymaps. 




