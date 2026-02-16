local macroFolder = "tdx/macros"
local macroFile = macroFolder.."/x.json"

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

if not isfolder("tdx") then makefolder("tdx") end
if not isfolder(macroFolder) then makefolder(macroFolder) end

-- Встроенный макрос из end.json
local embeddedMacroContent = [[
[
{"SuperFunction": "rebuild",
  "Skip": [],
  "Be": true},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-271.4503173828125, 1.98369562625885, -399.9326477050781","Rotation":"0","TowerA1":"1716.5078358300962"},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-268.9203186035156, 1.1850886344909668, -397.2942810058594","Rotation":"0","TowerA1":"1718.8769412310794"},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-269.5646667480469, 1.185089111328125, -408.3114318847656","Rotation":"0","TowerA1":"1721.1411281791516"},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-266.301513671875, 1.185089111328125, -408.3611755371094","Rotation":"0","TowerA1":"1723.9075999371707"},
{"TargetWanted":4,"TargetWave":"WAVE 0","TowerTargetChange":-269.5646667480469,"TargetChangedAt":7},
{"TargetWanted":3,"TargetWave":"WAVE 0","TowerTargetChange":-269.5646667480469,"TargetChangedAt":7},
{"TargetWanted":2,"TargetWave":"WAVE 0","TowerTargetChange":-269.5646667480469,"TargetChangedAt":7},
{"TargetWanted":4,"TargetWave":"WAVE 0","TowerTargetChange":-266.301513671875,"TargetChangedAt":6},
{"TargetWanted":3,"TargetWave":"WAVE 0","TowerTargetChange":-266.301513671875,"TargetChangedAt":6},
{"TargetWanted":2,"TargetWave":"WAVE 0","TowerTargetChange":-266.301513671875,"TargetChangedAt":6},
{"TargetWanted":4,"TargetWave":"WAVE 0","TowerTargetChange":-271.4503173828125,"TargetChangedAt":5},
{"TargetWanted":3,"TargetWave":"WAVE 0","TowerTargetChange":-271.4503173828125,"TargetChangedAt":5},
{"TargetWanted":2,"TargetWave":"WAVE 0","TowerTargetChange":-271.4503173828125,"TargetChangedAt":5},
{"TargetWanted":4,"TargetWave":"WAVE 0","TowerTargetChange":-268.9203186035156,"TargetChangedAt":4},
{"TargetWanted":3,"TargetWave":"WAVE 0","TowerTargetChange":-268.9203186035156,"TargetChangedAt":4},
{"TargetWanted":2,"TargetWave":"WAVE 0","TowerTargetChange":-268.9203186035156,"TargetChangedAt":4},
{"SkipWhen":4,"SkipWave":"WAVE 1"},
{"SkipWhen":4,"SkipWave":"WAVE 2"}
]
]]

-- Сохраняем встроенный макрос
pcall(function()
    writefile(macroFile, embeddedMacroContent)
end)

getgenv().TDX_Config = {
    ["mapvoting"] = "MILITARY BASE",
    ["Return Lobby"] = true,
    ["x1.5 Speed"] = true,
    ["Auto Skill"] = true,
    ["Map"] = "Tower Battles",
    ["Macros"] = "run",
    ["Macro Name"] = "i",
    ["Auto Difficulty"] = "TowerBattlesNightmare"
}

-- Модули загружаются из loader3_combined.lua
-- loadstring(game:HttpGet(loaderURL))()

_G.WaveConfig = {
    ["WAVE 0"] = 0,
    ["WAVE 1"] = 44,
    ["WAVE 2"] = 44,
    ["WAVE 3"] = 44,
    ["WAVE 4"] = 44,
    ["WAVE 5"] = 44,
    ["WAVE 6"] = 44,
    ["WAVE 7"] = 44,
    ["WAVE 8"] = 44,
    ["WAVE 9"] = 44,
    ["WAVE 10"] = 44,
    ["WAVE 11"] = 44,
    ["WAVE 12"] = 44,
    ["WAVE 13"] = 40,
    ["WAVE 14"] = 40,
    ["WAVE 15"] = 40,
    ["WAVE 16"] = 44,
    ["WAVE 17"] = 44,
    ["WAVE 18"] = 15,
    ["WAVE 19"] = 15,
    ["WAVE 20"] = 44,
    ["WAVE 21"] = 44,
    ["WAVE 22"] = 44,
    ["WAVE 23"] = 44,
    ["WAVE 24"] = 44,
    ["WAVE 25"] = 44,
    ["WAVE 26"] = 44,
    ["WAVE 27"] = 25,
    ["WAVE 28"] = 144,
    ["WAVE 29"] = 20,
    ["WAVE 30"] = 200,
    ["WAVE 31"] = 135,
    ["WAVE 32"] = 44,
    ["WAVE 33"] = 44,
    ["WAVE 34"] = 44,
    ["WAVE 35"] = 44,
    ["WAVE 36"] = 125,
    ["WAVE 37"] = 44,
    ["WAVE 38"] = 44,
    ["WAVE 39"] = 0,
    ["WAVE 40"] = 0
}

-- Auto skip модуль встроен в loader3_combined.lua
-- loadstring(game:HttpGet(skipWaveURL))()

print("Basic TDX configuration loaded. Use loader3_combined.lua for full functionality.")