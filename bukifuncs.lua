---@diagnostic disable: undefined-global, deprecated, unused-local

local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
local request = request or http_request or syn.request or fluxus.request
local BukiFuncs = {}


function BukiFuncs:sendWebhook(Context, URL)
    local Information = {["content"] = Context}
    local HeadersWebhook = {["content-type"] =  "application/json"}
    local DecodedWebhook = game:GetService("HttpService"):JSONEncode(Information)
    
    local InfoToSend = {
        Url = URL,
        Body = DecodedWebhook,
        Method = "POST",
        Headers = HeadersWebhook,
    }
    request(InfoToSend)
end

function BukiFuncs:Notify(message, length)
    Notification.Notify("BukiUtils", message, "rbxassetid://7291244104", {
        Duration = length,
        
        TitleSettings = {
            TextXAlignment = Enum.TextXAlignment.Center,
            Font = Enum.Font.SourceSansSemibold,
        },
    
        GradientSettings = {
            GradientEnabled = false,
            SolidColorEnabled = true,
            SolidColor = Color3.fromRGB(255, 21, 21),
            Retract = true
        }
    })
end

return BukiFuncs
