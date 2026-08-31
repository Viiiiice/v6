local Players = game:GetService("Players")

local player = Players.LocalPlayer

local gameId = game.GameId
local httpGet = game.httpGet

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
        "",
        true
    ))()
end)