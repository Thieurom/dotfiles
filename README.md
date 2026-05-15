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

Git identity is intentionally kept out of the public repository. Put local
identity in `~/.gitconfig.local`, for example:

```ini
[user]
    name = Your Name
    email = you@example.com
```

Generated and local-only files are intentionally not managed, including Neovim
compiled packer output, `.DS_Store`, Kitty backups, and Karabiner automatic
backups.
