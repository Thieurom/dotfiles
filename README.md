<h1 align="center">~/.dotfiles</h1>

This branch uses [chezmoi](https://www.chezmoi.io/) as the dotfile manager.

## Usage

Preview changes:

```sh
chezmoi --source "$PWD" diff
```

Apply changes:

```sh
chezmoi --source "$PWD" apply
```

## Layout

- `dot_gitconfig` -> `~/.gitconfig`
- `private_dot_config/` -> `~/.config/`
- `stow-legacy/` keeps the previous GNU Stow package layout for review.

Generated and local-only files are intentionally not managed, including Neovim
compiled packer output, `.DS_Store`, Kitty backups, and Karabiner automatic
backups.
