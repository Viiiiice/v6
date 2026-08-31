local Players = game:GetService("Players")

local player = Players.LocalPlayer

local gameId = game.GameId
local httpGet = game.HttpGet

local allowed = false;

if gameId == 10738160168 then
    allowed = true
end

if not allowed then
    if player then
        player:Kick("It's just PR.")
    end

    return
end

pcall(function()
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/Viiiiice/v6/main/Modules/Games/testplace.lua",
        true
    ))()
end)