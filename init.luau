local HttpService = game:GetService("HttpService")
local DiscordEmbed = require(script:WaitForChild("DiscordEmbed"))

--[=[
    @class DiscordMessageBuilder

    The DiscordMessageBuilder class is the main class for creating and configuring Discord webhook messages.
    It provides methods for setting message content and adding embeds.
]=]
local DiscordMessageBuilder = {}
DiscordMessageBuilder.__index = DiscordMessageBuilder

--- @prop data {content: string, embeds: {DiscordEmbed}}
--- @within DiscordMessageBuilder

--[=[
    Creates a new DiscordMessageBuilder instance.
    @return DiscordMessageBuilder -- Returns the DiscordMessageBuilder instance.
]=]
function DiscordMessageBuilder.new()
    local self = setmetatable({}, DiscordMessageBuilder)
    self.data = {
        content = "",
        embeds = {}
    }

    return self
end

--[=[
    Sets the content for the Discord message.

    @param Content string -- The message content to set.
    @return DiscordMessageBuilder -- Returns the instance for method chaining.
]=]
function DiscordMessageBuilder:setContent(Content)
    assert(typeof(Content) == "string", "Content must be a string.")
    self.data.content = Content
    return self
end

--[=[
    Adds an embed to the Discord message.

    @return DiscordEmbed -- Returns a new DiscordEmbed instance to configure the embed.
]=]
function DiscordMessageBuilder:addEmbed()
    local embed = DiscordEmbed.new()
    table.insert(self.data.embeds, embed)
    return embed
end

--[=[
    Builds the Discord message and converts it to a JSON string for sending.

    @return string -- The JSON-encoded string of the message.
]=]
function DiscordMessageBuilder:build()
    local message = {
        content = self.data.content,
        embeds = {}
    }

    for _, embed in pairs(self.data.embeds) do
        table.insert(message.embeds, embed:build())
    end

    return HttpService:JSONEncode(message)
end

return DiscordMessageBuilder
