#!/usr/bin/env zsh

# Dotfiles folder
# A dot prefix is added to every file and directory at (folder) depth 1.
# Symlinks are automatically generated for files at depth 1.
readonly DOTFILES="$(dirname "$(dirname "$(realpath "$0")")")/dotfiles"

# At depth >1, symlinks need to be explicitly listed in CUSTOM_ENTRY_POINTS.
readonly CUSTOM_ENTRY_POINTS=(
    "$DOTFILES"/gnupg/*
    "$DOTFILES"/config/Code/User/settings.json
    "$DOTFILES"/config/pypoetry/config.toml
    "$DOTFILES"/config/sublime-text-3/Packages/User
    "$DOTFILES"/git-templates
    "$DOTFILES"/shell.d
    "$DOTFILES"/vim
)

# -f flag: overwrite existing symbolic links
LN_FLAGS='svn'
[[ $1 == '-f' ]] && LN_FLAGS+='f'
readonly LN_FLAGS

# Merge automatically generated depth-1 symlinks with custom depth >1 symlinks.
depth_1_files=("$DOTFILES"/*(.))
files=( "${depth_1_files[@]}" "${CUSTOM_ENTRY_POINTS[@]}" )

for file in $files; do
    dotfiles_repo_path="$(realpath "$file")"
    symlink_path="$HOME/.$(realpath "$file" --relative-to="$DOTFILES")"

    mkdir -p "$(dirname "$symlink_path")" \
        && ln -"$LN_FLAGS" "$dotfiles_repo_path" "$symlink_path"
done
