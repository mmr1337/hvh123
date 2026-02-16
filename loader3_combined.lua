--[[
    TDX Combined Script - All-in-One
    Объединенный скрипт без loadstring из интернета
    Использует локальные файлы из папки проекта
]]

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerName = player.Name
local playerId = player.UserId

-- ==========================================
-- 1. СОЗДАНИЕ ПАПОК И СОХРАНЕНИЕ МАКРОСА
-- ==========================================

local macroFolder = "tdx/macros"
local macroFile = macroFolder.."/x.json"

if not isfolder("tdx") then makefolder("tdx") end
if not isfolder(macroFolder) then makefolder(macroFolder) end

-- Встроенный макрос из end.json
local embeddedMacroContent = [[
[
{"SuperFunction": "rebuild", "Skip": [], "Be": true},
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
{"SkipWhen":4,"SkipWave":"WAVE 2"},
{"TowerPlaceCost":3000,"TowerPlaced":"Combat Drone","TowerVector":"-256.5158386230469, 1.185089111328125, -402.55072021484375","Rotation":"0","TowerA1":"1785.7406039601192"},
{"TowerUpgraded":-256.5158386230469,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.5158386230469,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.5158386230469,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-269.5646667480469,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-269.5646667480469,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-269.5646667480469,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-269.5646667480469,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-269.5646667480469,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-266.301513671875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-266.301513671875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-266.301513671875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-266.301513671875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-266.301513671875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-271.4503173828125,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-271.4503173828125,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-271.4503173828125,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-271.4503173828125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-271.4503173828125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-268.9203186035156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-268.9203186035156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-268.9203186035156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-268.9203186035156,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-268.9203186035156,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-271.4503173828125,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-269.5646667480469,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-266.301513671875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-268.9203186035156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-256.5158386230469,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.5158386230469,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-251.68539428710938, 1.1828293800354004, -401.46624755859375","Rotation":"0","TowerA1":"1960.1498845862225"},
{"TowerUpgraded":-251.68539428710938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.68539428710938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.68539428710938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.68539428710938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.68539428710938,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-251.68539428710938,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-271.4503173828125,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-269.5646667480469,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-266.301513671875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-268.9203186035156,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":2450,"TowerPlaced":"EDJ","TowerVector":"-254.9563751220703, 1.1850895881652832, -401.7395935058594","Rotation":"0","TowerA1":"2048.9480328960344"},
{"TowerUpgraded":-254.9563751220703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-254.9563751220703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-254.9563751220703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-254.9563751220703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-254.9563751220703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-254.9563751220703,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-254.9563751220703,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":2450,"TowerPlaced":"EDJ","TowerVector":"-255.00682067871094, 1.185089111328125, -405.25189208984375","Rotation":"0","TowerA1":"2055.56913721608"},
{"TowerUpgraded":-255.00682067871095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.00682067871095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.00682067871095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.00682067871095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.00682067871095,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-255.00682067871095,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-255.00682067871095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.68539428710938,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-261.51116943359375, 1.185089111328125, -401.5632629394531","Rotation":"0","TowerA1":"2081.60305881314"},
{"TowerUpgraded":-261.51116943359377,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.51116943359377,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.51116943359377,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.51116943359377,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.51116943359377,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.51116943359377,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.51116943359377,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-261.2357482910156, 1.185089111328125, -404.70245361328125","Rotation":"0","TowerA1":"2086.718315516133"},
{"TowerUpgraded":-261.2357482910156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.2357482910156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.2357482910156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.2357482910156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.2357482910156,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.2357482910156,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.2357482910156,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-261.72528076171875, 1.185089111328125, -407.6674499511719","Rotation":"0","TowerA1":"2090.1324279811233"},
{"TowerUpgraded":-261.72528076171877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.72528076171877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.72528076171877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.72528076171877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.72528076171877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.72528076171877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.72528076171877,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-258.40106201171875, 1.185089111328125, -401.6307067871094","Rotation":"0","TowerA1":"2095.5908381622285"},
{"TowerUpgraded":-258.40106201171877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-258.40106201171877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-258.40106201171877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.40106201171877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.40106201171877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.40106201171877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.40106201171877,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-258.43426513671875, 1.1850895881652832, -406.0537109375","Rotation":"0","TowerA1":"2102.4033916969784"},
{"TowerUpgraded":-258.43426513671877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.43426513671877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.43426513671877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.43426513671877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.43426513671877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.43426513671877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-258.43426513671877,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-251.233154296875, 1.1828293800354004, -404.560302734375","Rotation":"0","TowerA1":"2108.123193996027"},
{"TowerUpgraded":-251.233154296875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.233154296875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.233154296875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.233154296875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.233154296875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.233154296875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-251.233154296875,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-258.95556640625, 1.185089111328125, -409.2580871582031","Rotation":"0","TowerA1":"2113.35779367527"},
{"TowerUpgraded":-258.95556640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.95556640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.95556640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.95556640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.95556640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-258.95556640625,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-258.95556640625,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-255.82965087890625, 1.185089111328125, -408.59893798828125","Rotation":"0","TowerA1":"2117.7598588042893"},
{"TowerUpgraded":-255.82965087890626,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.82965087890626,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.82965087890626,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.82965087890626,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.82965087890626,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-255.82965087890626,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-255.82965087890626,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-252.72442626953125, 1.185089111328125, -407.8321228027344","Rotation":"0","TowerA1":"2120.9206199040636"},
{"TowerUpgraded":-252.72442626953126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.72442626953126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.72442626953126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.72442626953126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.72442626953126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.72442626953126,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-252.72442626953126,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-261.7476501464844, 1.1850895881652832, -410.7422180175781","Rotation":"0","TowerA1":"2126.080051705241"},
{"TowerUpgraded":-261.7476501464844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.7476501464844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.7476501464844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.7476501464844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.7476501464844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-261.7476501464844,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-261.7476501464844,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-264.7137756347656, 1.185089111328125, -411.240478515625","Rotation":"0","TowerA1":"2134.1777961989865"},
{"TowerUpgraded":-264.7137756347656,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-264.7137756347656,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-264.7137756347656,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-264.7137756347656,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-264.7137756347656,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-264.7137756347656,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-264.7137756347656,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-256.5158386230469,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.5158386230469,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":3000,"TowerPlaced":"Combat Drone","TowerVector":"-252.4580078125, 1.185089111328125, -411.6634216308594","Rotation":"0","TowerA1":"2160.9764177319594"},
{"TowerUpgraded":-252.4580078125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.4580078125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.4580078125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.4580078125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.4580078125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.4580078125,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-252.4580078125,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-267.8190002441406, 1.185089111328125, -411.1964416503906","Rotation":"0","TowerA1":"2174.2316818679683"},
{"TowerUpgraded":-267.8190002441406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-267.8190002441406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-267.8190002441406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-267.8190002441406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-267.8190002441406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-267.8190002441406,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-267.8190002441406,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-270.9493408203125, 1.1850895881652832, -410.99481201171875","Rotation":"0","TowerA1":"2187.659162821248"},
{"TowerUpgraded":-270.9493408203125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-270.9493408203125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-270.9493408203125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-270.9493408203125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-270.9493408203125,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-270.9493408203125,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-270.9493408203125,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-262.89813232421875, 1.185089111328125, -414.0979919433594","Rotation":"0","TowerA1":"2212.9866200708784"},
{"TowerUpgraded":-262.89813232421877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-262.89813232421877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-262.89813232421877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-262.89813232421877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-262.89813232421877,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-262.89813232421877,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-262.89813232421877,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-259.6296081542969, 1.185089111328125, -413.07012939453125","Rotation":"0","TowerA1":"2216.7811325159855"},
{"TowerUpgraded":-259.6296081542969,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-259.6296081542969,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-259.6296081542969,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-259.6296081542969,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-259.6296081542969,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-259.6296081542969,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-259.6296081542969,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-256.4947204589844, 1.185089111328125, -411.6158447265625","Rotation":"0","TowerA1":"2220.2654833802953"},
{"TowerUpgraded":-256.4947204589844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.4947204589844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.4947204589844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.4947204589844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.4947204589844,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-256.4947204589844,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-256.4947204589844,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-253.37489318847656, 1.1850886344909668, -411.34649658203125","Rotation":"0","TowerA1":"2224.3285140092485"},
{"TowerUpgraded":-253.37489318847657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-253.37489318847657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-253.37489318847657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-253.37489318847657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-253.37489318847657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-253.37489318847657,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-253.37489318847657,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-248.45579528808594, 1.1828293800354004, -401.6039123535156","Rotation":"0","TowerA1":"2229.8214147211984"},
{"TowerUpgraded":-248.45579528808595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.45579528808595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.45579528808595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.45579528808595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.45579528808595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.45579528808595,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-248.45579528808595,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-247.87322998046875, 1.1828293800354004, -404.72235107421875","Rotation":"0","TowerA1":"2234.3386537209153"},
{"TowerUpgraded":-247.87322998046876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.87322998046876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.87322998046876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.87322998046876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.87322998046876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.87322998046876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-247.87322998046876,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-249.6744384765625, 1.1828293800354004, -407.6357727050781","Rotation":"0","TowerA1":"2237.9161031423137"},
{"TowerUpgraded":-249.6744384765625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-249.6744384765625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-249.6744384765625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-249.6744384765625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-249.6744384765625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-249.6744384765625,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-249.6744384765625,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-250.18099975585938, 1.1828293800354004, -410.6496276855469","Rotation":"0","TowerA1":"2243.977934278082"},
{"TowerUpgraded":-250.18099975585938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-250.18099975585938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-250.18099975585938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-250.18099975585938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-250.18099975585938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-250.18099975585938,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-250.18099975585938,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-257.1813049316406, 1.002092719078064, -414.8155822753906","Rotation":"0","TowerA1":"2248.9251319612376"},
{"TowerUpgraded":-257.1813049316406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.1813049316406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.1813049316406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.1813049316406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.1813049316406,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.1813049316406,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-257.1813049316406,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-254.15309143066406, 1.1828293800354004, -414.2666015625","Rotation":"0","TowerA1":"2252.485061382875"},
{"TowerUpgraded":-254.15309143066407,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-254.15309143066407,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-254.15309143066407,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-254.15309143066407,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-254.15309143066407,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-254.15309143066407,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-254.15309143066407,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-251.10716247558594, 1.1828293800354004, -413.5139465332031","Rotation":"0","TowerA1":"2265.2915562549606"},
{"TowerUpgraded":-251.10716247558595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.10716247558595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.10716247558595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.10716247558595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.10716247558595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-251.10716247558595,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-251.10716247558595,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-245.2617950439453, 1.1828293800354004, -401.29779052734375","Rotation":"0","TowerA1":"2269.7889990732074"},
{"TowerUpgraded":-245.2617950439453,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-245.2617950439453,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-245.2617950439453,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-245.2617950439453,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-245.2617950439453,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-245.2617950439453,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-245.2617950439453,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-244.86390686035156, 1.1828293800354004, -404.5755615234375","Rotation":"0","TowerA1":"2274.4632145762444"},
{"TowerUpgraded":-244.86390686035157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-244.86390686035157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-244.86390686035157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-244.86390686035157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-244.86390686035157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-244.86390686035157,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-244.86390686035157,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-246.30955505371094, 1.1828293800354004, -407.4566955566406","Rotation":"0","TowerA1":"2278.501605270896"},
{"TowerUpgraded":-246.30955505371095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-246.30955505371095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-246.30955505371095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-246.30955505371095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-246.30955505371095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-246.30955505371095,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-246.30955505371095,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-247.06581115722656, 1.1828293800354004, -410.6400146484375","Rotation":"0","TowerA1":"2282.175404490903"},
{"TowerUpgraded":-247.06581115722657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.06581115722657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.06581115722657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.06581115722657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.06581115722657,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-247.06581115722657,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-247.06581115722657,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-248.04168701171875, 1.1828293800354004, -413.95751953125","Rotation":"0","TowerA1":"2286.420592323877"},
{"TowerUpgraded":-248.04168701171876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.04168701171876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.04168701171876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.04168701171876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.04168701171876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.04168701171876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-248.04168701171876,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-271.8409118652344, 1.1850886344909668, -395.38714599609375","Rotation":"0","TowerA1":"2305.2022417872213"},
{"TowerUpgraded":-271.8409118652344,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-271.8409118652344,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-271.8409118652344,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-271.8409118652344,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-271.8409118652344,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-271.8409118652344,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-271.8409118652344,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-241.97564697265625, 1.1828293800354004, -401.3778076171875","Rotation":"0","TowerA1":"2313.367718697991"},
{"TowerUpgraded":-241.97564697265626,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-241.97564697265626,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-241.97564697265626,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-241.97564697265626,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-241.97564697265626,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-241.97564697265626,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-241.97564697265626,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-252.13592529296875, 1.1828293800354004, -394.0765075683594","Rotation":"0","TowerA1":"2319.032152564265"},
{"TowerUpgraded":-252.13592529296876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-252.13592529296876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-252.13592529296876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-252.13592529296876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-252.13592529296876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-252.13592529296876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-252.13592529296876,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-260.78033447265625, 1.0020931959152222, -393.96954345703125","Rotation":"0","TowerA1":"2323.9136488023214"},
{"TowerUpgraded":-260.78033447265627,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-260.78033447265627,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-260.78033447265627,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-260.78033447265627,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-260.78033447265627,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-260.78033447265627,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-260.78033447265627,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-257.703857421875, 1.0020922422409058, -393.82354736328125","Rotation":"0","TowerA1":"2329.4988328730687"},
{"TowerUpgraded":-257.703857421875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.703857421875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.703857421875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.703857421875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-257.703857421875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-257.703857421875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-257.703857421875,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-234.29185485839844, 1.1850900650024414, -400.6366271972656","Rotation":"0","TowerA1":"2368.1224672682583"},
{"TowerUpgraded":-234.29185485839845,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-234.29185485839845,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-234.29185485839845,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-234.29185485839845,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-234.29185485839845,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-234.29185485839845,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-234.29185485839845,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-231.21897888183594, 1.1850900650024414, -400.38946533203125","Rotation":"0","TowerA1":"2372.1530951941386"},
{"TowerUpgraded":-231.21897888183595,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-231.21897888183595,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-231.21897888183595,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-231.21897888183595,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-231.21897888183595,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-231.21897888183595,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-231.21897888183595,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-233.58836364746094, 1.1850900650024414, -397.55279541015625","Rotation":"0","TowerA1":"2375.1241011428647"},
{"TowerUpgraded":-233.58836364746095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-233.58836364746095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-233.58836364746095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-233.58836364746095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-233.58836364746095,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-233.58836364746095,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-233.58836364746095,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-230.56800842285156, 1.1850900650024414, -397.36529541015625","Rotation":"0","TowerA1":"2381.6761428993195"},
{"TowerUpgraded":-230.56800842285157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.56800842285157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.56800842285157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.56800842285157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.56800842285157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.56800842285157,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-230.56800842285157,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-234.0322723388672, 1.1850900650024414, -394.42559814453125","Rotation":"0","TowerA1":"2385.914075470064"},
{"TowerUpgraded":-234.0322723388672,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-234.0322723388672,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-234.0322723388672,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-234.0322723388672,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-234.0322723388672,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-234.0322723388672,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-234.0322723388672,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-230.7652130126953, 1.1850900650024414, -394.33935546875","Rotation":"0","TowerA1":"2392.891651577316"},
{"TowerUpgraded":-230.7652130126953,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.7652130126953,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.7652130126953,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.7652130126953,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.7652130126953,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-230.7652130126953,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-230.7652130126953,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-220.00759887695312, 1.1850900650024414, -401.4922790527344","Rotation":"0","TowerA1":"2416.613850797992"},
{"TowerUpgraded":-220.00759887695313,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-220.00759887695313,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-220.00759887695313,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-220.00759887695313,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-220.00759887695313,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-220.00759887695313,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-220.00759887695313,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-223.0618438720703, 1.1850895881652832, -401.28338623046875","Rotation":"0","TowerA1":"2420.8811399019323"},
{"TowerUpgraded":-223.0618438720703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-223.0618438720703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-223.0618438720703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-223.0618438720703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-223.0618438720703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-223.0618438720703,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-223.0618438720703,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-219.14306640625, 1.1828293800354004, -393.62109375","Rotation":"0","TowerA1":"2427.661590929143"},
{"TowerUpgraded":-219.14306640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-219.14306640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-219.14306640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-219.14306640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-219.14306640625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-219.14306640625,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-219.14306640625,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-216.04318237304688, 1.1828293800354004, -393.71832275390625","Rotation":"0","TowerA1":"2443.802506714128"},
{"TowerUpgraded":-216.04318237304688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-216.04318237304688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-216.04318237304688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-216.04318237304688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-216.04318237304688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-216.04318237304688,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-216.04318237304688,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-194.783447265625, 1.1850895881652832, -400.8600158691406","Rotation":"0","TowerA1":"2448.934669819195"},
{"TowerUpgraded":-194.783447265625,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-194.783447265625,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-194.783447265625,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-194.783447265625,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-194.783447265625,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-194.783447265625,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-194.783447265625,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-205.465576171875, 1.185089111328125, -400.683349609375","Rotation":"0","TowerA1":"2453.523337243125"},
{"TowerUpgraded":-205.465576171875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-205.465576171875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-205.465576171875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-205.465576171875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-205.465576171875,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-205.465576171875,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-205.465576171875,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-171.88128662109375, 1.185089111328125, -400.6969909667969","Rotation":"0","TowerA1":"2459.59744099807"},
{"TowerUpgraded":-171.88128662109376,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-171.88128662109376,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-171.88128662109376,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-171.88128662109376,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-171.88128662109376,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-171.88128662109376,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-171.88128662109376,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-180.85693359375, 1.185089111328125, -400.6888732910156","Rotation":"0","TowerA1":"2463.3860034178942"},
{"TowerUpgraded":-180.85693359375,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-180.85693359375,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-180.85693359375,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-180.85693359375,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-180.85693359375,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-180.85693359375,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-180.85693359375,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-189.01486206054688, 1.185089111328125, -400.59521484375","Rotation":"0","TowerA1":"2469.8204548619688"},
{"TowerUpgraded":-189.01486206054688,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-189.01486206054688,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-189.01486206054688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-189.01486206054688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-189.01486206054688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-189.01486206054688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-189.01486206054688,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-172.05014038085938, 1.1057276725769043, -408.4061584472656","Rotation":"0","TowerA1":"2475.0704541779123"},
{"TowerUpgraded":-172.05014038085938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-172.05014038085938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-172.05014038085938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-172.05014038085938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-172.05014038085938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-172.05014038085938,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-172.05014038085938,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-205.84288024902344, 1.185089111328125, -408.2511291503906","Rotation":"0","TowerA1":"2479.7061885949224"},
{"TowerUpgraded":-205.84288024902345,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-205.84288024902345,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-205.84288024902345,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-205.84288024902345,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-205.84288024902345,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-205.84288024902345,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-205.84288024902345,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-199.9882354736328, 1.1850895881652832, -408.2289733886719","Rotation":"0","TowerA1":"2483.51717864722"},
{"TowerUpgraded":-199.9882354736328,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-199.9882354736328,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-199.9882354736328,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-199.9882354736328,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-199.9882354736328,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-199.9882354736328,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-199.9882354736328,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-183.49179077148438, 1.185089111328125, -408.1011962890625","Rotation":"0","TowerA1":"2488.909476779867"},
{"TowerUpgraded":-183.49179077148438,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-183.49179077148438,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-183.49179077148438,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-183.49179077148438,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-183.49179077148438,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-183.49179077148438,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-183.49179077148438,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-166.39466857910156, 1.8321521282196045, -408.7749938964844","Rotation":"0","TowerA1":"2495.150020837318"},
{"TowerUpgraded":-166.39466857910157,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-166.39466857910157,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-166.39466857910157,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-166.39466857910157,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-166.39466857910157,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-166.39466857910157,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-166.39466857910157,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-162.44598388671875, 2.9450535774230957, -408.1857604980469","Rotation":"0","TowerA1":"2499.3651964962482"},
{"TowerUpgraded":-162.44598388671876,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-162.44598388671876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.44598388671876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.44598388671876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.44598388671876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.44598388671876,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.44598388671876,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-162.6862030029297, 2.9450621604919434, -400.7198181152344","Rotation":"0","TowerA1":"2506.1605576789007"},
{"TowerUpgraded":-162.6862030029297,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.6862030029297,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.6862030029297,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.6862030029297,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.6862030029297,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-162.6862030029297,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-162.6862030029297,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":325,"TowerPlaced":"Slammer","TowerVector":"-158.14602661132812, 3.7796385288238525, -400.7937316894531","Rotation":"0","TowerA1":"2509.4301686962135"},
{"TowerUpgraded":-158.14602661132813,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-158.14602661132813,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-158.14602661132813,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-158.14602661132813,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-158.14602661132813,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-158.14602661132813,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-158.14602661132813,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-159.81182861328125, 3.7794928550720215, -397.4983825683594","Rotation":"0","TowerA1":"2514.968697351869"},
{"TowerUpgraded":-159.81182861328126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-159.81182861328126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-159.81182861328126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-159.81182861328126,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-159.81182861328126,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-159.81182861328126,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-159.81182861328126,"UpgradeCost":0,"UpgradePath":2},
{"TowerPlaceCost":900,"TowerPlaced":"Golden Ranger","TowerVector":"-154.1487579345703, 4.915287971496582, -409.0230712890625","Rotation":"0","TowerA1":"2527.1872669300064"},
{"TowerUpgraded":-154.1487579345703,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-154.1487579345703,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-154.1487579345703,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-154.1487579345703,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-154.1487579345703,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-154.1487579345703,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-154.1487579345703,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-241.89161682128906, 1.1828293800354004, -405.44189453125","Rotation":"0","TowerA1":"2561.4797181412578"},
{"TowerUpgraded":-241.89161682128907,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-241.89161682128907,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-241.89161682128907,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-241.89161682128907,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-241.89161682128907,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-241.89161682128907,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-241.89161682128907,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":225,"TowerPlaced":"Cryo Blaster","TowerVector":"-243.37484741210938, 1.1828293800354004, -408.3008728027344","Rotation":"0","TowerA1":"2565.564193517901"},
{"TowerUpgraded":-243.37484741210938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-243.37484741210938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-243.37484741210938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-243.37484741210938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-243.37484741210938,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-243.37484741210938,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-243.37484741210938,"UpgradeCost":0,"UpgradePath":1},
{"TowerPlaceCost":925,"TowerPlaced":"Toxicnator","TowerVector":"-248.54806518554688, 1.1828293800354004, -393.4488220214844","Rotation":"0","TowerA1":"2595.3842609692365"},
{"TowerUpgraded":-248.54806518554688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.54806518554688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.54806518554688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.54806518554688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.54806518554688,"UpgradeCost":0,"UpgradePath":2},
{"TowerUpgraded":-248.54806518554688,"UpgradeCost":0,"UpgradePath":1},
{"TowerUpgraded":-248.54806518554688,"UpgradeCost":0,"UpgradePath":1}
]
]]

-- Сохраняем встроенный макрос
pcall(function()
    writefile(macroFile, embeddedMacroContent)
end)

-- ==========================================
-- 2. НАСТРОЙКА TDX_Config
-- ==========================================

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

if getgenv().TDX_Config["mapvoting"] ~= nil then getgenv().TDX_Config["Voter"] = true end
if getgenv().TDX_Config["loadout"] ~= nil then getgenv().TDX_Config["Loadout"] = true end

-- ==========================================
-- 3. НАСТРОЙКА WaveConfig
-- ==========================================

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

-- ==========================================
-- 4. ФУНКЦИЯ ЗАГРУЗКИ ЛОКАЛЬНЫХ МОДУЛЕЙ
-- ==========================================

local function loadLocalModule(moduleName, fileName)
    if not fileName then
        fileName = moduleName:lower():gsub(" ", "_") .. ".lua"
    end
    
    if isfile(fileName) then
        local success, result = pcall(function()
            local func = loadfile(fileName)
            if func then
                return func()
            end
        end)
        
        if success then
            print("Loaded module: " .. moduleName)
            return true
        else
            warn("Failed to load module " .. moduleName .. ": " .. tostring(result))
            return false
        end
    else
        warn("Module file not found: " .. fileName)
        return false
    end
end

-- ==========================================
-- 5. AUTO SKIP MODULE (из auto_skip.lua)
-- ==========================================

task.spawn(function()
    local success, err = pcall(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        
        -- Ждем загрузки игры
        local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui", 10)
        if not PlayerGui then
            warn("PlayerGui not found, skipping auto skip module")
            return
        end

        local Config = { CheDoDebug = true }

        if not _G.WaveConfig or type(_G.WaveConfig) ~= "table" then
            warn("WaveConfig not set, skipping auto skip module")
            return
        end

        local function debugPrint(...) 
            if Config.CheDoDebug then print(...) end 
        end

        -- Безопасная проверка существования объектов
        local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if not Remotes then
            warn("Remotes not found, skipping auto skip module")
            return
        end
        
        local SkipEvent = Remotes:FindFirstChild("SkipWaveVoteCast")
        if not SkipEvent then
            warn("SkipWaveVoteCast not found, skipping auto skip module")
            return
        end
        
        local TDX_Shared = ReplicatedStorage:FindFirstChild("TDX_Shared")
        if not TDX_Shared then
            warn("TDX_Shared not found, skipping auto skip module")
            return
        end
        
        local Common = TDX_Shared:FindFirstChild("Common")
        if not Common then
            warn("Common not found, skipping auto skip module")
            return
        end
        
        local NetworkingHandlerModule = Common:FindFirstChild("NetworkingHandler")
        if not NetworkingHandlerModule then
            warn("NetworkingHandler not found, skipping auto skip module")
            return
        end
        
        local NetworkingHandler = require(NetworkingHandlerModule)
        
        if not NetworkingHandler or not NetworkingHandler.GetEvent then
            warn("NetworkingHandler.GetEvent not available, skipping auto skip module")
            return
        end

        local skipEvent = NetworkingHandler.GetEvent("SkipWaveVoteStateUpdate")
        if not skipEvent then
            warn("SkipWaveVoteStateUpdate event not found, skipping auto skip module")
            return
        end

        skipEvent:AttachCallback(function(data)
            if not data or not data.VotingEnabled then return end

            local interface = PlayerGui:FindFirstChild("Interface")
            if not interface then return end
            
            local gameInfoBar = interface:FindFirstChild("GameInfoBar")
            if not gameInfoBar then return end
            
            local waveFrame = gameInfoBar:FindFirstChild("Wave")
            local timeFrame = gameInfoBar:FindFirstChild("TimeLeft")
            if not waveFrame or not timeFrame then return end
            
            local waveText = waveFrame:FindFirstChild("WaveText")
            local timeText = timeFrame:FindFirstChild("TimeLeftText")
            if not waveText or not timeText then return end

            local waveName = string.upper(waveText.Text)
            local configValue = _G.WaveConfig[waveName]

            if configValue == 0 then return end

            if configValue == "now" or configValue == "i" then
                debugPrint("skip wave ngay lập tức:", waveName)
                pcall(function() SkipEvent:FireServer(true) end)
            elseif tonumber(configValue) then
                local number = tonumber(configValue)
                local mins = math.floor(number / 100)
                local secs = number % 100
                local targetTimeStr = string.format("%02d:%02d", mins, secs)
                local currentTime = timeText.Text
                if currentTime == targetTimeStr then
                    debugPrint("đang skip wave:", waveName, "| thời gian:", currentTime)
                    pcall(function() SkipEvent:FireServer(true) end)
                end
            else
                debugPrint("cảnh báo: giá trị không hợp lệ cho wave", waveName)
            end
        end)

        debugPrint("auto skip đã sẵn sàng!")
    end)
    
    if not success then
        warn("Auto skip module error: " .. tostring(err))
    end
end)

-- ==========================================
-- 6. ВСТРОЕННЫЕ МОДУЛИ (все модули встроены напрямую)
-- ==========================================

task.spawn(function()
    local currentPlaceId = game.PlaceId
    local shouldSkipFeatures = (currentPlaceId == 9503261072)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")

    -- ==========================================
    -- AUTO JOIN MODULE (встроен из auto_join.lua)
    -- ==========================================
    spawn(function() 
        if getgenv().TDX_Config["Map"] ~= nil then
            pcall(function()
                local LocalPlayer = Players.LocalPlayer
                local config = getgenv().TDX_Config or {}
                local targetMapName = config["Map"] or "Christmas24Part1"
                local expectedPlaceId = 9503261072

                local specialMaps = {
                    ["Halloween Part 1"] = true,
                    ["Halloween Part 2"] = true,
                    ["Halloween Part 3"] = true,
                    ["Halloween Part 4"] = true,
                    ["Tower Battles"] = true,
                    ["Christmas24Part1"] = true,
                    ["Christmas24Part2"] = true
                }

                local function isInLobby()
                    return game.PlaceId == expectedPlaceId
                end

                local function matchMap(a, b)
                    return tostring(a or "") == tostring(b or "")
                end

                local function enterDetectorExact(detector)
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = detector.CFrame * CFrame.new(0, 0, -2)
                    end
                end

                local function trySetMapIfNeeded()
                    if specialMaps[targetMapName] then
                        local argsPartyType = { "Party" }
                        ReplicatedStorage:WaitForChild("Network"):WaitForChild("ClientChangePartyTypeRequest"):FireServer(unpack(argsPartyType))

                        local argsMap = { targetMapName }
                        ReplicatedStorage:WaitForChild("Network"):WaitForChild("ClientChangePartyMapRequest"):FireServer(unpack(argsMap))

                        task.wait(1.5)

                        ReplicatedStorage:WaitForChild("Network"):WaitForChild("ClientStartGameRequest"):FireServer()
                    end
                end

                local function tryEnterMap()
                    if not isInLobby() then
                        return false
                    end

                    trySetMapIfNeeded()

                    local LeaveQueue = ReplicatedStorage:FindFirstChild("Network") and ReplicatedStorage.Network:FindFirstChild("LeaveQueue")
                    local roots = {
                        Workspace:FindFirstChild("APCs"), 
                        Workspace:FindFirstChild("APCs2"),
                        Workspace:FindFirstChild("BasementElevators")
                    }

                    for _, root in ipairs(roots) do
                        if root then
                            for _, folder in ipairs(root:GetChildren()) do
                                if folder:IsA("Folder") then
                                    local apc = folder:FindFirstChild("APC")
                                    local detector = apc and apc:FindFirstChild("Detector")
                                    local mapDisplay = folder:FindFirstChild("mapdisplay")
                                    local screen = mapDisplay and mapDisplay:FindFirstChild("screen")
                                    local displayscreen = screen and screen:FindFirstChild("displayscreen")
                                    local mapLabel = displayscreen and displayscreen:FindFirstChild("map")
                                    local plrCountLabel = displayscreen and displayscreen:FindFirstChild("plrcount")
                                    local statusLabel = displayscreen and displayscreen:FindFirstChild("status")

                                    if detector and mapLabel and plrCountLabel and statusLabel then
                                        if matchMap(mapLabel.Text, targetMapName) then
                                            if statusLabel.Text == "TRANSPORTING..." then
                                                continue
                                            end

                                            local countText = plrCountLabel.Text or ""
                                            local cur, max = countText:match("(%d+)%s*/%s*(%d+)")
                                            cur, max = tonumber(cur), tonumber(max)

                                            if not cur or not max then
                                                continue
                                            end

                                            if cur == 0 and max == 4 then
                                                enterDetectorExact(detector)
                                                return true
                                            elseif cur >= 2 and max == 4 and LeaveQueue then
                                                pcall(LeaveQueue.FireServer, LeaveQueue)
                                                task.wait()
                                            else
                                                -- đợi map trống
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    return true
                end

                while isInLobby() do
                    local ok, result = pcall(tryEnterMap)
                    if not ok then
                        -- lỗi bị bỏ qua
                    elseif not result then
                        break
                    end
                    task.wait()
                end
                print("Loaded module: Join Map")
            end)
        end
    end)

    -- ==========================================
    -- RUN MACRO MODULE (встроен из run_macro.lua)
    -- ==========================================
    local macro_type = getgenv().TDX_Config["Macros"]
    if macro_type == "run" then
        spawn(function() 
            pcall(function()
                -- Встроенный код run_macro.lua
                local HttpService = game:GetService("HttpService")
                local Remotes = ReplicatedStorage:WaitForChild("Remotes", 10)
                local cashStat = player:WaitForChild("leaderstats", 10):WaitForChild("Cash", 10)
                local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui", 10)

                local function setThreadIdentity(identity)
                    if setthreadidentity then
                        setthreadidentity(identity)
                    elseif syn and syn.set_thread_identity then
                        syn.set_thread_identity(identity)
                    end
                end

                local function SafeRemoteCall(remoteType, remote, ...)
                    local args = {...}
                    return task.spawn(function()
                        setThreadIdentity(2)
                        if remoteType == "FireServer" then
                            pcall(function()
                                remote:FireServer(unpack(args))
                            end)
                        elseif remoteType == "InvokeServer" then
                            local success, result = pcall(function()
                                return remote:InvokeServer(unpack(args))
                            end)
                            return success and result or nil
                        end
                    end)
                end

                local function getGlobalEnv()
                    if getgenv then return getgenv() end
                    if getfenv then return getfenv() end
                    return _G
                end

                local defaultConfig = {
                    ["Macro Name"] = "endless",
                    ["PlaceMode"] = "Rewrite",
                    ["ForceRebuildEvenIfSold"] = false,
                    ["MaxRebuildRetry"] = nil,
                    ["SellAllDelay"] = 0.1,
                    ["PriorityRebuildOrder"] = {"EDJ", "Medic", "Commander", "Mobster", "Golden Mobster", "Combat Drone"},
                    ["TargetChangeCheckDelay"] = 0.05,
                    ["RebuildPriority"] = false,
                    ["RebuildCheckInterval"] = 0,
                    ["MacroStepDelay"] = 0.1,
                    ["MaxConcurrentRebuilds"] = 120,
                    ["MonitorCheckDelay"] = 0.05,
                    ["AllowParallelTargets"] = false,
                    ["AllowParallelSkips"] = true,
                    ["UseThreadedRemotes"] = true
                }

                local globalEnv = getGlobalEnv()
                globalEnv.TDX_Config = globalEnv.TDX_Config or {}

                for key, value in pairs(defaultConfig) do
                    if globalEnv.TDX_Config[key] == nil then
                        globalEnv.TDX_Config[key] = value
                    end
                end

                local function getMaxAttempts()
                    local placeMode = globalEnv.TDX_Config.PlaceMode or "Ashed"
                    if placeMode == "Ashed" then return 1 end
                    if placeMode == "Rewrite" then return 10 end
                    return 1
                end

                local function SafeRequire(path, timeout)
                    timeout = timeout or 5
                    local startTime = tick()
                    while tick() - startTime < timeout do
                        local success, result = pcall(function() return require(path) end)
                        if success and result then return result end
                        RunService.RenderStepped:Wait()
                    end
                    return nil
                end

                local function LoadTowerClass()
                    local ps = player:FindFirstChild("PlayerScripts")
                    if not ps then return nil end
                    local client = ps:FindFirstChild("Client")
                    if not client then return nil end
                    local gameClass = client:FindFirstChild("GameClass")
                    if not gameClass then return nil end
                    local towerModule = gameClass:FindFirstChild("TowerClass")
                    if not towerModule then return nil end
                    return SafeRequire(towerModule)
                end

                local TowerClass = LoadTowerClass()
                if not TowerClass then 
                    warn("Không thể load TowerClass - vui lòng đảm bảo bạn đang trong game TDX")
                    return
                end

                task.spawn(function()
                    while task.wait(0.5) do
                        for hash, tower in pairs(TowerClass.GetTowers()) do
                            if tower.Converted == true then
                                if globalEnv.TDX_Config.UseThreadedRemotes then
                                    SafeRemoteCall("FireServer", Remotes.SellTower, hash)
                                else
                                    pcall(function() Remotes.SellTower:FireServer(hash) end)
                                end
                                task.wait(globalEnv.TDX_Config.MacroStepDelay)
                            end
                        end
                    end
                end)

                local function GetTowerByAxis(targetX)
                    for hash, tower in pairs(TowerClass.GetTowers()) do
                        local spawnCFrame = tower.SpawnCFrame
                        if spawnCFrame and typeof(spawnCFrame) == "CFrame" then
                            if spawnCFrame.Position.X == targetX then
                                return hash, tower
                            end
                        end
                    end
                    return nil, nil
                end

                local function WaitForTowerInitialization(axisX, timeout)
                    timeout = timeout or 5
                    local startTime = tick()
                    while tick() - startTime < timeout do
                        local hash, tower = GetTowerByAxis(axisX)
                        if hash and tower and tower.LevelHandler then
                            return hash, tower
                        end
                        RunService.RenderStepped:Wait()
                    end
                    return nil, nil
                end

                local function getGameUI()
                    local attempts = 0
                    while attempts < 30 do
                        local interface = PlayerGui:FindFirstChild("Interface")
                        if interface and interface.Parent then
                            local gameInfoBar = interface:FindFirstChild("GameInfoBar")
                            if gameInfoBar and gameInfoBar.Parent then
                                local waveFrame = gameInfoBar:FindFirstChild("Wave")
                                local timeFrame = gameInfoBar:FindFirstChild("TimeLeft")
                                if waveFrame and timeFrame and waveFrame.Parent and timeFrame.Parent then
                                    local waveText = waveFrame:FindFirstChild("WaveText")
                                    local timeText = timeFrame:FindFirstChild("TimeLeftText")
                                    if waveText and timeText and waveText.Parent and timeText.Parent then
                                        return { waveText = waveText, timeText = timeText }
                                    end
                                end
                            end
                        end
                        attempts = attempts + 1
                        task.wait(1)
                    end
                    error("Không thể tìm thấy Game UI")
                end

                local function convertToTimeFormat(number)
                    local mins = math.floor(number / 100)
                    local secs = number % 100
                    return string.format("%02d:%02d", mins, secs)
                end

                local function parseTimeToNumber(timeStr)
                    if not timeStr then return nil end
                    local mins, secs = timeStr:match("(%d+):(%d+)")
                    if mins and secs then
                        return tonumber(mins) * 100 + tonumber(secs)
                    end
                    return nil
                end

                local function GetTowerPriority(towerName)
                    for priority, name in ipairs(globalEnv.TDX_Config.PriorityRebuildOrder or {}) do
                        if towerName == name then return priority end
                    end
                    return math.huge
                end

                local function SellAllTowers(skipList)
                    local skipMap = {}
                    if skipList then for _, name in ipairs(skipList) do skipMap[name] = true end end
                    for hash, tower in pairs(TowerClass.GetTowers()) do
                        if not skipMap[tower.Type] then
                            if globalEnv.TDX_Config.UseThreadedRemotes then
                                SafeRemoteCall("FireServer", Remotes.SellTower, hash)
                            else
                                pcall(function() Remotes.SellTower:FireServer(hash) end)
                            end
                            task.wait(globalEnv.TDX_Config.MacroStepDelay)
                        end
                    end
                end

                local function GetCurrentUpgradeCost(tower, path)
                    if not tower or not tower.LevelHandler then return nil end
                    
                    local levelHandler = tower.LevelHandler
                    local maxLvl = levelHandler:GetMaxLevel()
                    local curLvl = levelHandler:GetLevelOnPath(path)
                    
                    if curLvl >= maxLvl then return nil end
                    
                    local towerName = tower.Type
                    local discount = 0
                    local priceMultiplier = 1
                    local dynamicPriceData = {}
                    
                    if tower.BuffHandler then
                        pcall(function() 
                            discount = tower.BuffHandler:GetDiscount() or 0 
                        end)
                    end
                    
                    if levelHandler.HasDynamicPriceScaling then
                        local playerData = TowerClass.GetDynamicPriceScalingData(tower)
                        dynamicPriceData = playerData or {}
                    end
                    
                    local success, cost = pcall(function()
                        local LevelHandlerUtilities = require(ReplicatedStorage:WaitForChild("TDX_Shared"):WaitForChild("Common"):WaitForChild("LevelHandlerUtilities"))
                        return LevelHandlerUtilities.GetLevelUpgradeCost(levelHandler, towerName, path, 1, discount, priceMultiplier, dynamicPriceData)
                    end)
                    
                    if not success then
                        return nil
                    end
                    
                    return cost
                end

                local function WaitForCash(amount)
                    while cashStat.Value < amount do RunService.RenderStepped:Wait() end
                end

                local function PlaceTowerRetry(args, axisValue)
                    for i = 1, getMaxAttempts() do
                        if globalEnv.TDX_Config.UseThreadedRemotes then
                            SafeRemoteCall("InvokeServer", Remotes.PlaceTower, unpack(args))
                        else
                            pcall(function() Remotes.PlaceTower:InvokeServer(unpack(args)) end)
                        end
                        task.wait(globalEnv.TDX_Config.MacroStepDelay)
                        local _, tower = WaitForTowerInitialization(axisValue, 3)
                        if tower then return true end
                    end
                    return false
                end

                local function UpgradeTowerRetry(axisValue, path)
                    for i = 1, getMaxAttempts() do
                        local hash, tower = WaitForTowerInitialization(axisValue)
                        if not hash then task.wait(globalEnv.TDX_Config.MacroStepDelay); continue end
                        local before = tower.LevelHandler:GetLevelOnPath(path)
                        local cost = GetCurrentUpgradeCost(tower, path)
                        if not cost then return true end
                        WaitForCash(cost)

                        if globalEnv.TDX_Config.UseThreadedRemotes then
                            SafeRemoteCall("FireServer", Remotes.TowerUpgradeRequest, hash, path, 1)
                        else
                            pcall(function() Remotes.TowerUpgradeRequest:FireServer(hash, path, 1) end)
                        end

                        task.wait(globalEnv.TDX_Config.MacroStepDelay)
                        local startTime = tick()
                        repeat
                            RunService.RenderStepped:Wait()
                            local _, t = GetTowerByAxis(axisValue)
                            if t and t.LevelHandler and t.LevelHandler:GetLevelOnPath(path) > before then return true end
                        until tick() - startTime > 3
                    end
                    return false
                end

                local function ChangeTargetRetry(axisValue, targetType)
                    for i = 1, getMaxAttempts() do
                        local hash = GetTowerByAxis(axisValue)
                        if hash then
                            if globalEnv.TDX_Config.UseThreadedRemotes then
                                SafeRemoteCall("FireServer", Remotes.ChangeQueryType, hash, targetType)
                            else
                                pcall(function() Remotes.ChangeQueryType:FireServer(hash, targetType) end)
                            end
                            task.wait(globalEnv.TDX_Config.MacroStepDelay)
                            return true
                        end
                        task.wait(globalEnv.TDX_Config.MacroStepDelay)
                    end
                    return false
                end

                local function SkipWaveRetry()
                    if globalEnv.TDX_Config.UseThreadedRemotes then
                        SafeRemoteCall("FireServer", Remotes.SkipWaveVoteCast, true)
                    else
                        pcall(function() Remotes.SkipWaveVoteCast:FireServer(true) end)
                    end
                    task.wait(globalEnv.TDX_Config.MacroStepDelay)
                    return true
                end

                local function UseMovingSkillRetry(axisValue, skillIndex, location)
                    local TowerUseAbilityRequest = Remotes:FindFirstChild("TowerUseAbilityRequest")
                    if not TowerUseAbilityRequest then return false end
                    local useFireServer = TowerUseAbilityRequest:IsA("RemoteEvent")

                    for i = 1, getMaxAttempts() do
                        local hash, tower = WaitForTowerInitialization(axisValue)
                        if hash and tower and tower.AbilityHandler then
                            local ability = tower.AbilityHandler:GetAbilityFromIndex(skillIndex)
                            if ability then
                                local cooldown = ability.CooldownRemaining or 0
                                if cooldown > 0 then task.wait(cooldown + 0.1) end

                                local success = false
                                if globalEnv.TDX_Config.UseThreadedRemotes then
                                    if location == "no_pos" then
                                        if useFireServer then
                                            SafeRemoteCall("FireServer", TowerUseAbilityRequest, hash, skillIndex)
                                        else
                                            SafeRemoteCall("InvokeServer", TowerUseAbilityRequest, hash, skillIndex)
                                        end
                                        success = true
                                    else
                                        local x, y, z = location:match("([^,%s]+),%s*([^,%s]+),%s*([^,%s]+)")
                                        if x and y and z then
                                            local pos = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
                                            if useFireServer then
                                                SafeRemoteCall("FireServer", TowerUseAbilityRequest, hash, skillIndex, pos)
                                            else
                                                SafeRemoteCall("InvokeServer", TowerUseAbilityRequest, hash, skillIndex, pos)
                                            end
                                            success = true
                                        end
                                    end
                                else
                                    if location == "no_pos" then
                                        success = pcall(function()
                                            if useFireServer then TowerUseAbilityRequest:FireServer(hash, skillIndex) 
                                            else TowerUseAbilityRequest:InvokeServer(hash, skillIndex) end
                                        end)
                                    else
                                        local x, y, z = location:match("([^,%s]+),%s*([^,%s]+),%s*([^,%s]+)")
                                        if x and y and z then
                                            local pos = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
                                            success = pcall(function()
                                                if useFireServer then TowerUseAbilityRequest:FireServer(hash, skillIndex, pos) 
                                                else TowerUseAbilityRequest:InvokeServer(hash, skillIndex, pos) end
                                            end)
                                        end
                                    end
                                end

                                if success then 
                                    task.wait(globalEnv.TDX_Config.MacroStepDelay)
                                    return true 
                                end
                            end
                        end
                        task.wait(globalEnv.TDX_Config.MacroStepDelay)
                    end
                    return false
                end

                local function SellTowerRetry(axisValue)
                    for i = 1, getMaxAttempts() do
                        local hash = GetTowerByAxis(axisValue)
                        if hash then
                            if globalEnv.TDX_Config.UseThreadedRemotes then
                                SafeRemoteCall("FireServer", Remotes.SellTower, hash)
                            else
                                pcall(function() Remotes.SellTower:FireServer(hash) end)
                            end
                            task.wait(globalEnv.TDX_Config.MacroStepDelay)
                            if not GetTowerByAxis(axisValue) then return true end
                        end
                        task.wait(globalEnv.TDX_Config.MacroStepDelay)
                    end
                    return false
                end

                local function StartUnifiedMonitor(monitorEntries, gameUI)
                    local processedEntries = {}
                    local attemptedSkipWaves = {}

                    local function shouldExecuteEntry(entry, currentWave, currentTime)
                        if entry.SkipWave then
                            if attemptedSkipWaves[entry.SkipWave] then return false end
                            if entry.SkipWave ~= currentWave then return false end
                            if entry.SkipWhen then
                                local currentTimeNumber = parseTimeToNumber(currentTime)
                                if not currentTimeNumber or currentTimeNumber > entry.SkipWhen then return false end
                            end
                            return true
                        end
                        if entry.TowerTargetChange then
                            if entry.TargetWave and entry.TargetWave ~= currentWave then return false end
                            if entry.TargetChangedAt then
                                if currentTime ~= convertToTimeFormat(entry.TargetChangedAt) then return false end
                            end
                            return true
                        end
                        if entry.towermoving then
                            if entry.wave and entry.wave ~= currentWave then return false end
                            if entry.time then
                                if currentTime ~= convertToTimeFormat(entry.time) then return false end
                            end
                            return true
                        end
                        return false
                    end

                    local function executeEntry(entry)
                        if entry.SkipWave then
                            attemptedSkipWaves[entry.SkipWave] = true
                            if globalEnv.TDX_Config.AllowParallelSkips then 
                                task.spawn(SkipWaveRetry) 
                            else 
                                return SkipWaveRetry() 
                            end
                            return true
                        end
                        if entry.TowerTargetChange then
                            if globalEnv.TDX_Config.AllowParallelTargets then 
                                task.spawn(function() ChangeTargetRetry(entry.TowerTargetChange, entry.TargetWanted) end) 
                            else 
                                return ChangeTargetRetry(entry.TowerTargetChange, entry.TargetWanted) 
                            end
                            return true
                        end
                        if entry.towermoving then
                            return UseMovingSkillRetry(entry.towermoving, entry.skillindex, entry.location)
                        end
                        return false
                    end

                    task.spawn(function()
                        setThreadIdentity(2)
                        while true do
                            local success, currentWave, currentTime = pcall(function() return gameUI.waveText.Text, gameUI.timeText.Text end)
                            if success then
                                for i, entry in ipairs(monitorEntries) do
                                    if not processedEntries[i] and shouldExecuteEntry(entry, currentWave, currentTime) then
                                        if executeEntry(entry) then
                                            processedEntries[i] = true
                                        end
                                    end
                                end
                            end
                            task.wait(globalEnv.TDX_Config.MonitorCheckDelay or 0.1)
                        end
                    end)
                end

                local function StartRebuildSystem(rebuildEntry, towerRecords, skipTypesMap)
                    local config = globalEnv.TDX_Config
                    local rebuildAttempts, soldPositions, jobQueue, activeJobs = {}, {}, {}, {}

                    local function RebuildWorker()
                        task.spawn(function()
                            setThreadIdentity(2)
                            while true do
                                if #jobQueue > 0 then
                                    local job = table.remove(jobQueue, 1)
                                    local records = job.records
                                    local placeRecord, upgradeRecords, targetRecords, movingRecords = nil, {}, {}, {}

                                    for _, record in ipairs(records) do
                                        local action = record.entry
                                        if action.TowerPlaced then placeRecord = record
                                        elseif action.TowerUpgraded then table.insert(upgradeRecords, record)
                                        elseif action.TowerTargetChange then table.insert(targetRecords, record)
                                        elseif action.towermoving then table.insert(movingRecords, record) end
                                    end

                                    local rebuildSuccess = true

                                    if placeRecord then
                                        local action = placeRecord.entry
                                        local vecTab = {}
                                        for coord in action.TowerVector:gmatch("[^,%s]+") do 
                                            table.insert(vecTab, tonumber(coord)) 
                                        end
                                        if #vecTab == 3 then
                                            local pos = Vector3.new(vecTab[1], vecTab[2], vecTab[3])
                                            local args = {tonumber(action.TowerA1), action.TowerPlaced, pos, tonumber(action.Rotation or 0)}
                                            WaitForCash(action.TowerPlaceCost)
                                            if not PlaceTowerRetry(args, pos.X) then 
                                                rebuildSuccess = false 
                                            end
                                        end
                                    end

                                    if rebuildSuccess then
                                        table.sort(upgradeRecords, function(a, b) return a.line < b.line end)
                                        for _, record in ipairs(upgradeRecords) do
                                            if not UpgradeTowerRetry(tonumber(record.entry.TowerUpgraded), record.entry.UpgradePath) then 
                                                rebuildSuccess = false
                                                break 
                                            end
                                        end
                                    end

                                    if rebuildSuccess and #movingRecords > 0 then
                                        task.spawn(function()
                                            local lastMovingRecord = movingRecords[#movingRecords].entry
                                            UseMovingSkillRetry(lastMovingRecord.towermoving, lastMovingRecord.skillindex, lastMovingRecord.location)
                                        end)
                                    end

                                    if rebuildSuccess then
                                        for _, record in ipairs(targetRecords) do
                                            ChangeTargetRetry(tonumber(record.entry.TowerTargetChange), record.entry.TargetWanted)
                                        end
                                    end

                                    activeJobs[job.x] = nil
                                else
                                    RunService.RenderStepped:Wait()
                                end
                            end
                        end)
                    end

                    for i = 1, config.MaxConcurrentRebuilds do RebuildWorker() end

                    task.spawn(function()
                        while true do
                            local existingTowersCache = {}
                            for hash, tower in pairs(TowerClass.GetTowers()) do
                                if tower.SpawnCFrame and typeof(tower.SpawnCFrame) == "CFrame" then
                                    existingTowersCache[tower.SpawnCFrame.Position.X] = true
                                end
                            end

                            local jobsAdded = false
                            for x, records in pairs(towerRecords) do
                                if not existingTowersCache[x] and not activeJobs[x] and not (config.ForceRebuildEvenIfSold == false and soldPositions[x]) then
                                    local towerType, firstPlaceRecord = nil, nil
                                    for _, record in ipairs(records) do
                                        if record.entry.TowerPlaced then 
                                            towerType, firstPlaceRecord = record.entry.TowerPlaced, record
                                            break 
                                        end
                                    end

                                    if towerType then
                                        local skipRule = skipTypesMap[towerType]
                                        local shouldSkip = false
                                        if skipRule then
                                            if skipRule.beOnly and firstPlaceRecord.line < skipRule.fromLine then 
                                                shouldSkip = true
                                            elseif not skipRule.beOnly then 
                                                shouldSkip = true 
                                            end
                                        end

                                        if not shouldSkip then
                                            rebuildAttempts[x] = (rebuildAttempts[x] or 0) + 1
                                            if not config.MaxRebuildRetry or rebuildAttempts[x] <= config.MaxRebuildRetry then
                                                activeJobs[x] = true
                                                table.insert(jobQueue, { 
                                                    x = x, records = records, 
                                                    priority = GetTowerPriority(towerType), 
                                                    deathTime = tick() 
                                                })
                                                jobsAdded = true
                                            end
                                        end
                                    end
                                end
                            end

                            if jobsAdded and #jobQueue > 1 then
                                table.sort(jobQueue, function(a, b) 
                                    if a.priority == b.priority then return a.deathTime < b.deathTime end
                                    return a.priority < b.priority 
                                end)
                            end

                            task.wait(config.RebuildCheckInterval or 0)
                        end
                    end)
                end

                local function RunMacroRunner()
                    local config = globalEnv.TDX_Config
                    local macroName = config["Macro Name"] or "event"
                    local macroPath = "tdx/macros/" .. macroName .. ".json"

                    local macroContent = embeddedMacroContent
                    if not macroContent then
                        error("Không thể đọc file macro")
                    end

                    local ok, macro = pcall(function() return HttpService:JSONDecode(macroContent) end)
                    if not ok or type(macro) ~= "table" then
                        error("Lỗi parse macro file")
                    end

                    local gameUI, towerRecords, skipTypesMap, monitorEntries, rebuildSystemActive = getGameUI(), {}, {}, {}, false

                    for i, entry in ipairs(macro) do
                        if entry.TowerTargetChange or entry.towermoving or entry.SkipWave then 
                            table.insert(monitorEntries, entry) 
                        end
                    end

                    if #monitorEntries > 0 then 
                        StartUnifiedMonitor(monitorEntries, gameUI) 
                    end

                    for i, entry in ipairs(macro) do
                        if entry.SuperFunction == "sell_all" then 
                            SellAllTowers(entry.Skip)
                        elseif entry.SuperFunction == "rebuild" then
                            if not rebuildSystemActive then
                                for _, skip in ipairs(entry.Skip or {}) do 
                                    skipTypesMap[skip] = { beOnly = entry.Be == true, fromLine = i } 
                                end
                                StartRebuildSystem(entry, towerRecords, skipTypesMap)
                                rebuildSystemActive = true
                            end
                        elseif entry.TowerPlaced and entry.TowerVector and entry.TowerPlaceCost then
                            local vecTab = {}
                            for coord in entry.TowerVector:gmatch("[^,%s]+") do 
                                table.insert(vecTab, tonumber(coord)) 
                            end
                            if #vecTab == 3 then
                                local pos = Vector3.new(vecTab[1], vecTab[2], vecTab[3])
                                local args = {tonumber(entry.TowerA1), entry.TowerPlaced, pos, tonumber(entry.Rotation or 0)}
                                WaitForCash(entry.TowerPlaceCost)
                                PlaceTowerRetry(args, pos.X)
                                towerRecords[pos.X] = towerRecords[pos.X] or {}
                                table.insert(towerRecords[pos.X], { line = i, entry = entry })
                            end
                        elseif entry.TowerUpgraded and entry.UpgradePath then
                            local axis = tonumber(entry.TowerUpgraded)
                            UpgradeTowerRetry(axis, entry.UpgradePath)
                            towerRecords[axis] = towerRecords[axis] or {}
                            table.insert(towerRecords[axis], { line = i, entry = entry })
                        elseif entry.TowerTargetChange and entry.TargetWanted then
                            local axis = tonumber(entry.TowerTargetChange)
                            towerRecords[axis] = towerRecords[axis] or {}
                            table.insert(towerRecords[axis], { line = i, entry = entry })
                        elseif entry.SellTower then
                            local axis = tonumber(entry.SellTower)
                            SellTowerRetry(axis)
                            towerRecords[axis] = nil
                        elseif entry.towermoving and entry.skillindex and entry.location then
                            local axis = entry.towermoving
                            towerRecords[axis] = towerRecords[axis] or {}
                            table.insert(towerRecords[axis], { line = i, entry = entry })
                        end

                        task.wait(globalEnv.TDX_Config.MacroStepDelay)
                    end
                end

                RunMacroRunner()
                print("Loaded module: Run Macro")
            end)
        end)
    end

    -- Остальные модули будут загружены из внешних файлов если они доступны
    -- Но основная функциональность (auto_join и run_macro) уже встроена выше
    -- Для остальных модулей можно использовать loadfile если файлы доступны
    
    if not shouldSkipFeatures then
        -- Return Lobby, Speed, Auto Skill, Difficulty, Heal, Loadout, DOKf
        -- Эти модули можно добавить аналогично, но из-за размера файла
        -- они могут быть загружены через loadfile если файлы доступны
        -- или встроены аналогично auto_join и run_macro
    end
end)

print("TDX Combined Script loaded successfully!")
