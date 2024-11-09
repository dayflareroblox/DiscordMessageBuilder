local DiscordEmbed = {}
DiscordEmbed.__index = DiscordEmbed

--[=[
    @class DiscordEmbed

    This is an internal class that is created with :addEmbed()
]=]

--- @prop embed {any}
--- @within DiscordEmbed

--[=[
    Creates a new discord embed class
    @return class
]=]
function DiscordEmbed.new()
    local self = setmetatable({}, DiscordEmbed)
    self.embed = {}
    return self
end

--[=[
    Sets the embed title
    @param title string -- Title of the embed
    @return DiscordEmbed
]=]
function DiscordEmbed:setTitle(title)
    self.embed.title = title
    return self
end

--[=[
    Sets the embed description
    @param description string -- Description text
    @return DiscordEmbed
]=]
function DiscordEmbed:setDescription(description)
    self.embed.description = description
    return self
end

--[=[
    Sets the embed URL
    @param url string -- URL to be attached to the embed title
    @return DiscordEmbed
]=]
function DiscordEmbed:setURL(url)
    self.embed.url = url
    return self
end

--[=[
    Sets the embed color
    @param hexColor string -- Hexadecimal color (as a string)
    @return DiscordEmbed
]=]
function DiscordEmbed:setColor(hexColor)
    self.embed.color = tonumber(hexColor, 16)
    return self
end

--[=[
    Sets the embed author
    @param name string -- Name of the author
    @param icon_url string -- (Optional) URL for the author icon
    @param url string -- (Optional) URL for the author link
    @return DiscordEmbed
]=]
function DiscordEmbed:setAuthor(name, icon_url, url)
    self.embed.author = { name = name, icon_url = icon_url, url = url }
    return self
end

--[=[
    Sets the embed footer
    @param text string -- Footer text
    @param icon_url string -- (Optional) URL for the footer icon
    @return DiscordEmbed
]=]
function DiscordEmbed:setFooter(text, icon_url)
    self.embed.footer = { text = text, icon_url = icon_url }
    return self
end

--[=[
    Sets the embed thumbnail
    @param url string -- URL of the thumbnail image
    @return DiscordEmbed
]=]
function DiscordEmbed:setThumbnail(url)
    self.embed.thumbnail = { url = url }
    return self
end

--[=[
    Sets the embed image
    @param url string -- URL of the image
    @return DiscordEmbed
]=]
function DiscordEmbed:setImage(url)
    self.embed.image = { url = url }
    return self
end

--[=[
    Adds a field to the embed
    @param name string -- Name of the field
    @param value string -- Value of the field
    @param inline boolean -- Whether the field is inline (default is false)
    @return DiscordEmbed
]=]
function DiscordEmbed:addField(name, value, inline)
    self.embed.fields = self.embed.fields or {}
    table.insert(self.embed.fields, { name = name, value = value, inline = inline or false })
    return self
end

--[=[
    Sets the embed timestamp
    @param timestamp string -- ISO 8601 timestamp (optional, defaults to current UTC time)
    @return DiscordEmbed
]=]
function DiscordEmbed:setTimestamp(timestamp)
    self.embed.timestamp = timestamp or os.date("!%Y-%m-%dT%H:%M:%SZ")
    return self
end

--[=[
    Builds the embed data for sending in a Discord message
    @return table -- Returns the embed data as a table
]=]
function DiscordEmbed:build()
    return self.embed
end

return DiscordEmbed
