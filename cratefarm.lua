-- Script for Miner's Haven / https://www.roblox.com/games/258258996/SHINY-Miners-Haven
-- Press U to toggle the crate farm

local active = false
local player = game.Players.LocalPlayer
local humanoid  = player.Character.HumanoidRootPart
local tycoon = player.PlayerTycoon.Value

local input = game:GetService("UserInputService")
local function onInputBegan(inp, gameProcessed)
    if inp:GetFocusedTextBox() == nil then
        if inp.UserInputType == Enum.UserInputType.Keyboard then
            if inp.KeyCode == Enum.KeyCode.U then
                active = not active
                print(active)
            end
        end
    end
end
input.InputBegan:Connect(onInputBegan)

game:GetService("Workspace").ChildAdded:Connect(function(child)
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if active == true then
            if v.Name == "Open" and v:IsA("Sound") then
                humanoid.CFrame = v.CFrame
                task.wait(0.7)
                humanoid.CFrame = tycoon["Base"].CFrame * CFrame.new(0, 10, 0)
                task.wait(0.8)
            end
        end
    end
end)

for _, v in pairs(getconnections(player.Idled)) do
    v:Disable()
end
