local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/VL"))()
local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
local Toggle_var = {}
function Toggle_var:new(n, t)
    local ojb = {
        class = "Toggle_var",
        name = n,
        type = t
    }
    Toggle_var.__index = Toggle_var
    setmetatable(ojb, Toggle_var)
    if type(n) == "string" and type(t) == "boolean" then
        return ojb
    end
end

local games = {
    [5201039691] = {
        Title = "Tatakai Reborn",
        Icons = "C",
        Welcome = function()
            return tostring("<Color=Blue>Welcome ".. "<Color=Orange>"..game:GetService("Players").LocalPlayer.Name .."!".. " \n<Color=Red>To TESTHUB")
        end
    }
}

autochoco{
    while wait() do
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Chocolate Shake" then
                if not game.Players.LocalPlayer:FindFirstChild("XPBoost") and not game.Players.LocalPlayer.Character:FindFirstChild("Chocolate Shake") then
                    v.Parent = game.Players.LocalPlayer.Character
                    game.Players.LocalPlayer.Character:FindFirstChild("Chocolate Shake"):Activate()
                end
            end
        end
     end
}




 if games[game.PlaceId] then
    if games[game.PlaceId].Title == "Blox Fruits" then
        local function notify(types, ...)
            if types == "Notify" then
                require(game.ReplicatedStorage.Notification).new(...):Display();
            end
        end
        notify("Notify", games[game.PlaceId].Welcome())
        local autofarm = Toggle_var:new("auto-farm", false)
        local autodig = Toggle_var:new("Auto-dig",false)

        local Main = VLib:Window("TESTHUB", games[game.PlaceId].Title, games[game.PlaceId].Icons)
        local Page1 = Main:Tab("Main Tab")

        local label = Page1:Label("Label")

        Page1:Toggle(autofarm.name, function(value)
            autofarm.type = value
        end)

        Page1:Toggle(autodig.name, function(value)
            autodig.type = value
        end)

        spawn(function()
            while true do
                wait()
                if autofarm.type then
                    print(autofarm.type)
                end
                if autodig.type then
                    print(autodig.name)
                end
            end
        end)

    end
end