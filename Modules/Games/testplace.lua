if not game:IsLoaded() then
    game.Loaded:Wait()
end

local cloneref = cloneref or function(v) return v end
local Services = setmetatable({}, {
    __index = function(self, name)
        local success, result = pcall(game.GetService, game, name)
        if success then
            local service = cloneref(result)
            rawset(self, name, service)
            return service
        end
        warn("Invalid Service: " .. tostring(name))
    end
})

local Players = Services.Players
repeat task.wait() until Players.LocalPlayer

local StarterGui = Services.StarterGui

local Required = {
	"hookfunction",
	"getconnections",
	"hookmetamethod",
	"bit32",
	"getgenv",
	"setmetatable",
    "clonefunction",
    "cloneref",
    "getconnections",
    "fireclickdetector",
    "checkcaller"
}

local Kick = clonefunction and clonefunction(Services.Players.LocalPlayer.Kick) or Services.Players.LocalPlayer.Kick
for i = 1, #Required do
	local v = Required[i]
	if not getgenv()[v] then
        Kick(Services.Players.LocalPlayer, `Your executor does not support [{v}], which is required.`)
	end
end

local success, err = pcall(function()
    if getconnections then
        for _,v in pairs(getconnections(Services.ScriptContext.Error)) do
            v:Disable();
        end
    end
end)

local function ensureFolder(path)
    if not isfolder(path) then
        makefolder(path)
        return true
    end
    return false
end

if ensureFolder("logs") then
    print("Created logs folder")
end

if game.PlaceId == 83538300074367 then
    local startTime = os.clock()

    do
        ensureFolder("v6")

        if game.PlaceId == 83538300074367 then
            ensureFolder("v6/testplace_configs")
        else
            ensureFolder("v6/config")
        end
    end

    local player = Players.LocalPlayer;
    local mouse = player:GetMouse();

    local ui = tostring(identifyexecutor()) == "Volt" and cg or (gethui and gethui() or cg)
    local font = (Drawing.Fonts and Drawing.Fonts.UI) or 2

    local done = false
    local busy = false


    local repo = "https://raw.githubusercontent.com/Viiiiice/v6/main/"
    local success, Library = pcall(function()
        return loadstring(game:HttpGet(repo .. "Modules/UILibrary/Library.lua", true))()
    end)

    if Library then
        warn(Library)
    end
end