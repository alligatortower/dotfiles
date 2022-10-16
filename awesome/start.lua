local awful = require("awful")
local tags = require("tags")

awful.spawn.raise_or_spawn("discord")
awful.spawn.raise_or_spawn("nm-applet")
awful.spawn.raise_or_spawn("kitty zsh -is eval 'neofetch'", { tag = tags.tag_names[1] })
awful.spawn.raise_or_spawn("kitty bashtop", { tag = tags.tag_names[4] })
awful.spawn.raise_or_spawn("nautilus --no-desktop", { tag = tags.tag_names[4] })
awful.spawn.with_shell("bash /home/cweed/.config/awesome/scripts/background.sh")
