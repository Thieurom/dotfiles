#!/bin/sh
# Assign keyboard shortcuts to macOS's native window-tiling quarter menu items
# (Window > Move & Resize > Top/Bottom Left/Right) so Karabiner's hyper keys can
# trigger them. The hyper corner keys send ^~1..4 (see private_karabiner.json).
# Halves and Fill use the built-in ⌃🌐 arrow / ⌃🌐F shortcuts, so they need no
# entry here. Takes effect for apps launched after a logout/login.
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add \
  "Top Left" '^~1' \
  "Top Right" '^~2' \
  "Bottom Left" '^~3' \
  "Bottom Right" '^~4'
