# DiscordMessageBuilder

A Lua library for creating and configuring Discord webhook messages, with support for customizable embeds similar to [discord.js](https://discord.js.org/).

## Features

- **Message Content**: Easily set message content with `setContent`.
- **Embeds**: Add and customize embeds with title, description, color, author, fields, timestamp, and more.
- **JSON Encoding**: Converts messages to JSON format, ready for webhook posting.

## Installation

**Wally Installation**
```
discordmessagebuilder = "dayflareroblox/discordmessagebuilder@0.1.2"
```

## Usage

```lua
local DiscordMessageBuilder = require(path_to_DiscordMessageBuilder)

-- Create a message builder
local message = DiscordMessageBuilder.new()
message:setContent("Hello, World!")

-- Add an embed
local embed = message:addEmbed()
embed:setTitle("Sample Embed")
      :setDescription("This is an example.")
      :setColor("FF0000")

-- Build the message to JSON
local jsonData = message:build()
