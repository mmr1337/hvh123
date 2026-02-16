local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local targetPlaceId = 9503261072
local localPlayer = Players.LocalPlayer

if placeId == targetPlaceId then
    local Network = ReplicatedStorage:WaitForChild("Network")
    local ClientChangePartyTypeRequest = Network:WaitForChild("ClientChangePartyTypeRequest")
    local ClientChangePartyMapRequest = Network:WaitForChild("ClientChangePartyMapRequest")
    local ClientStartGameRequest = Network:WaitForChild("ClientStartGameRequest")
    
    local args1 = {"Party"}
    ClientChangePartyTypeRequest:FireServer(unpack(args1))
    
    task.wait(0.5)
    
    local args2 = {"Tower Battles"}
    ClientChangePartyMapRequest:FireServer(unpack(args2))
    
    task.wait(0.5)
    
    ClientStartGameRequest:FireServer()
else
    local Remotes = ReplicatedStorage:WaitForChild("Remotes")
    local MapVoteCast = Remotes:WaitForChild("MapVoteCast")
    local MapVoteReady = Remotes:WaitForChild("MapVoteReady")
    
    local args = {"Military Base"}
    MapVoteCast:FireServer(unpack(args))
    MapVoteReady:FireServer()
    
    task.wait(1)
    
    local foundMilitaryBase = false
    local votingScreens = workspace:WaitForChild("Game", 10)
    if votingScreens then
        votingScreens = votingScreens:WaitForChild("MapVoting", 10)
        if votingScreens then
            votingScreens = votingScreens:WaitForChild("VotingScreens", 10)
            if votingScreens then
                for i = 1, 4 do
                    local votingScreen = votingScreens:FindFirstChild("VotingScreen" .. i)
                    if votingScreen then
                        local screenPart = votingScreen:FindFirstChild("ScreenPart")
                        if screenPart then
                            local surfaceGui = screenPart:FindFirstChild("SurfaceGui")
                            if surfaceGui then
                                local mapName = surfaceGui:FindFirstChild("MapName")
                                if mapName and mapName:IsA("TextLabel") then
                                    local text = string.upper(mapName.Text)
                                    if text == "MILITARY BASE" then
                                        foundMilitaryBase = true
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    if not foundMilitaryBase then
        task.wait(1)
        TeleportService:Teleport(targetPlaceId, localPlayer)
    end
end

