local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Steal a Pet 😹", HidePremium = false, SaveConfig = true, ConfigFolder = "Steal a Pet 😹"})

local Tab = Window:MakeTab({
	Name = "Steal",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Tutorial ✍️",
	Callback = function()
    OrionLib:MakeNotification({
	Name = "Tutorial",
	Content = "1. Remove all other doors, enable noclip and instant prompt. 2. Change max distance steal pet, delete not needed pets. 3. Inject Infinite Yield (for fly).  4. Keep close to the door and start spamming the “E” key just as the door is about to open.  5. Once you’ve stolen the pet, enable fly mode and try to fly under the map (dont look down) — the anti-cheat will automatically teleport you back to your plot. Enjoy! ",
	Image = "rbxassetid://4483345998",
	Time = 30
})
  	end    
})

Tab:AddButton({
	Name = "Remove Doors (Visual) 🔨",
	Callback = function()
    local plotsFolder = workspace.__THINGS.Plots

for i = 1, 1000 do
    local plot = plotsFolder:FindFirstChild(tostring(i))
    if plot then
        local doorFolder = plot:FindFirstChild("Door")
        if doorFolder then
            for _, item in pairs(doorFolder:GetChildren()) do
                item:Destroy()
            end
            print("Очистил Door в plot " .. i)
        else
            print("Папка Door не найдена в plot " .. i)
        end
    else
        print("Plot " .. i .. " не найден")
    end
end

  	end    
})

Tab:AddButton({
	Name = "Noclip 👻",
	Callback = function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end
noclip() -- to toggle noclip() and clip()
  	end    
})

Tab:AddButton({
	Name = "Instant Prompt 👉",
	Callback = function()
    -- Скрипт можно вставить в ServerScriptService

local function setHoldDurationZero(object)
	if object:IsA("ProximityPrompt") then
		object.HoldDuration = 0
	end
end

-- Пройтись по всем существующим объектам
for _, descendant in pairs(game:GetDescendants()) do
	setHoldDurationZero(descendant)
end

-- Следить за новыми объектами
game.DescendantAdded:Connect(function(descendant)
	setHoldDurationZero(descendant)
end)
  	end    
})

Tab:AddButton({
	Name = "Change max distance steal pets😎 (Careful with your pets!)",
	Callback = function()
    local standPetsFolder = workspace.__THINGS.StandPets

for _, petGroup in pairs(standPetsFolder:GetChildren()) do
    local rootPart = petGroup:FindFirstChild("RootPart")
    if rootPart then
        local proximityPrompt = rootPart:FindFirstChildOfClass("ProximityPrompt")
        if proximityPrompt then
            proximityPrompt.MaxActivationDistance = 10000
            print("MaxActivationDistance обновлен для StandPet: ".. petGroup.Name)
        end
    end
end
  	end    
})

Tab:AddButton({
	Name = "Click to delete not needed pets (work for 5 sek)",
	Callback = function()
    local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Флаг, разрешающий удаление
local canDelete = true

-- Через 5 секунд отключаем возможность удаления
task.delay(5, function()
	canDelete = false
end)

mouse.Button1Down:Connect(function()
	if not canDelete then return end

	local target = mouse.Target
	if not target then return end

	-- Ищем родительский Model
	local group = target:FindFirstAncestorOfClass("Model")
	if group and group:IsDescendantOf(workspace) then
		group:Destroy() -- Удаляем всю группу (модель)
	end
end)

  	end    
})

Tab:AddButton({
	Name = "Infinite Yield",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  	end    
})

Tab:AddButton({
	Name = "Speed max ⚡",
	Callback = function()
    local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

RunService.RenderStepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 50
    end
end)
  	end    
})

Tab:AddButton({
	Name = "ESP 👀",
	Callback = function()
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
_G.EnemyColor = Color3.fromRGB(255, 0, 0)
_G.UseTeamColor = true

--------------------------------------------------------------------
local Holder = Instance.new("Folder", game.CoreGui)
Holder.Name = "ESP"

local Box = Instance.new("BoxHandleAdornment")
Box.Name = "nilBox"
Box.Size = Vector3.new(1, 2, 1)
Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Box.Transparency = 0.7
Box.ZIndex = 0
Box.AlwaysOnTop = false
Box.Visible = false

local NameTag = Instance.new("BillboardGui")
NameTag.Name = "nilNameTag"
NameTag.Enabled = false
NameTag.Size = UDim2.new(0, 200, 0, 50)
NameTag.AlwaysOnTop = true
NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
local Tag = Instance.new("TextLabel", NameTag)
Tag.Name = "Tag"
Tag.BackgroundTransparency = 1
Tag.Position = UDim2.new(0, -50, 0, 0)
Tag.Size = UDim2.new(0, 300, 0, 20)
Tag.TextSize = 15
Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Tag.TextStrokeTransparency = 0.4
Tag.Text = "nil"
Tag.Font = Enum.Font.SourceSansBold
Tag.TextScaled = false

local LoadCharacter = function(v)
	repeat wait() until v.Character ~= nil
	v.Character:WaitForChild("Humanoid")
	local vHolder = Holder:FindFirstChild(v.Name)
	vHolder:ClearAllChildren()
	local b = Box:Clone()
	b.Name = v.Name .. "Box"
	b.Adornee = v.Character
	b.Parent = vHolder
	local t = NameTag:Clone()
	t.Name = v.Name .. "NameTag"
	t.Enabled = true
	t.Parent = vHolder
	t.Adornee = v.Character:WaitForChild("Head", 5)
	if not t.Adornee then
		return UnloadCharacter(v)
	end
	t.Tag.Text = v.Name
	b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	local Update
	local UpdateNameTag = function()
		if not pcall(function()
			v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			local maxh = math.floor(v.Character.Humanoid.MaxHealth)
			local h = math.floor(v.Character.Humanoid.Health)
		end) then
			Update:Disconnect()
		end
	end
	UpdateNameTag()
	Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
end

local UnloadCharacter = function(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
		vHolder:ClearAllChildren()
	end
end

local LoadPlayer = function(v)
	local vHolder = Instance.new("Folder", Holder)
	vHolder.Name = v.Name
	v.CharacterAdded:Connect(function()
		pcall(LoadCharacter, v)
	end)
	v.CharacterRemoving:Connect(function()
		pcall(UnloadCharacter, v)
	end)
	v.Changed:Connect(function(prop)
		if prop == "TeamColor" then
			UnloadCharacter(v)
			wait()
			LoadCharacter(v)
		end
	end)
	LoadCharacter(v)
end

local UnloadPlayer = function(v)
	UnloadCharacter(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder then
		vHolder:Destroy()
	end
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() pcall(LoadPlayer, v) end)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	pcall(LoadPlayer, v)
end)

game:GetService("Players").PlayerRemoving:Connect(function(v)
	pcall(UnloadPlayer, v)
end)

game:GetService("Players").LocalPlayer.NameDisplayDistance = 0

if _G.Reantheajfdfjdgs then
    return
end

_G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

local players = game:GetService("Players")
local plr = players.LocalPlayer

function esp(target, color)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = color
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = color
        end
    end
end

while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
        end
    end
end
  	end    
})

Tab:AddButton({
	Name = "Serverhop 🌎",
	Callback = function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport()

  	end    
})

local Tab = Window:MakeTab({
	Name = "Plot",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Your Plot"
})

Tab:AddButton({
	Name = "Always Lock Plot 🔒",
    Callback = function()
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local plots = workspace.__THINGS.Plots

local function findLockButtonWithTouch()
	for i = 1, 10000 do
		local group = plots:FindFirstChild(tostring(i))
		if group then
			local lockbutton = group:FindFirstChild("LockButton")
			if lockbutton and lockbutton:FindFirstChildOfClass("TouchTransmitter") then
				return lockbutton
			end
		end
	end
	return nil
end

local lockButton = findLockButtonWithTouch()

if lockButton then
	RunService.RenderStepped:Connect(function()
		firetouchinterest(hrp, lockButton, 0)
		firetouchinterest(hrp, lockButton, 1)
	end)
else
	warn("TouchTransmitter не найден")
end

  	end    
})

Tab:AddButton({
	Name = "Plot timer ⏲️",
	Callback = function()
    local Workspace = game:GetService("Workspace")
local Plots = Workspace.__THINGS.Plots

-- Функция создания или обновления таймера
local function createOrUpdateTimerGui(plot)
    local lockButton = plot:FindFirstChild("LockButton")
    if not lockButton then return end
    
    local billboard = lockButton:FindFirstChild("Billboard")
    if not billboard then return end
    
    local frame = billboard:FindFirstChild("Frame")
    if not frame then return end
    
    local rateLabel = frame:FindFirstChild("Rate")
    if not rateLabel or not rateLabel:IsA("TextLabel") then return end

    -- Проверяем, есть ли уже таймер
    local timerGui = lockButton:FindFirstChild("TimerGui")
    if not timerGui then
        timerGui = Instance.new("BillboardGui")
        timerGui.Name = "TimerGui"
        timerGui.Adornee = lockButton
        timerGui.AlwaysOnTop = true
        timerGui.Size = UDim2.new(0, 300, 0, 100)
        timerGui.StudsOffset = Vector3.new(0, 5, 0)
        timerGui.Parent = lockButton

        local timerLabel = Instance.new("TextLabel")
        timerLabel.Name = "TimerLabel"
        timerLabel.Size = UDim2.new(1, 0, 1, 0)
        timerLabel.BackgroundTransparency = 1
        timerLabel.TextColor3 = Color3.new(1, 0, 0)
        timerLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        timerLabel.TextStrokeTransparency = 0
        timerLabel.Font = Enum.Font.SourceSansBold
        timerLabel.TextScaled = true
        timerLabel.Parent = timerGui
    end

    local timerLabel = timerGui:FindFirstChild("TimerLabel")
    if timerLabel then
        timerLabel.Text = rateLabel.Text
    end
end

-- Функция для обновления всех Plot раз в 0.1 секунды
local function updateAllTimers()
    while true do
        for _, plot in pairs(Plots:GetChildren()) do
            createOrUpdateTimerGui(plot)
        end
        wait(0.1)
    end
end

-- Следим за новыми Plot, создаем таймеры сразу
Plots.ChildAdded:Connect(function(plot)
    if plot:IsA("Model") then
        createOrUpdateTimerGui(plot)
    end
end)

-- Запускаем бесконечное обновление таймеров
spawn(updateAllTimers)
  	end    
})

local Tab = Window:MakeTab({
	Name = "Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Farm"
})

Tab:AddButton({
	Name = "Collect coins 💸",
	Callback = function()
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local plots = workspace.__THINGS.Plots
local activeGroupIndex = nil
local buttonsToTouch = {}

-- Шаг 1-3: Найти группу, в которой у LockButton есть TouchInterest
for i = 1, 10000 do
	local plotGroup = plots:FindFirstChild(tostring(i))
	if plotGroup then
		local lockButton = plotGroup:FindFirstChild("LockButton")
		if lockButton and lockButton:FindFirstChildOfClass("TouchTransmitter") then
			activeGroupIndex = i
			print("Активная группа найдена:", i)
			break
		end
	end
end

-- Шаг 4-5: Собрать все кнопки с TouchTransmitter в этой группе
if activeGroupIndex then
	local standsFolder = plots[tostring(activeGroupIndex)]:FindFirstChild("Stands")
	if standsFolder then
		for j = 1, 20 do
			local stand = standsFolder:FindFirstChild(tostring(j))
			if stand then
				local button = stand:FindFirstChild("Button")
				if button and button:FindFirstChildOfClass("TouchTransmitter") then
					table.insert(buttonsToTouch, button)
				end
			end
		end
	end
end

-- Шаг 6: Бесконечно триггерить touch на все кнопки
if #buttonsToTouch > 0 then
	RunService.RenderStepped:Connect(function()
		for _, button in ipairs(buttonsToTouch) do
			firetouchinterest(hrp, button, 0)
			firetouchinterest(hrp, button, 1)
		end
	end)
else
	warn("Нет ни одной кнопки с TouchTransmitter")
end

  	end    
})

local Tab = Window:MakeTab({
	Name = "Buy",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Buy things"
})

Tab:AddButton({
	Name = "Instant Prompt 👉",
	Callback = function()
    -- Скрипт можно вставить в ServerScriptService

local function setHoldDurationZero(object)
	if object:IsA("ProximityPrompt") then
		object.HoldDuration = 0
	end
end

-- Пройтись по всем существующим объектам
for _, descendant in pairs(game:GetDescendants()) do
	setHoldDurationZero(descendant)
end

-- Следить за новыми объектами
game.DescendantAdded:Connect(function(descendant)
	setHoldDurationZero(descendant)
end)
  	end    
})

Tab:AddButton({
	Name = "Buy pets anywhere🤑",
	Callback = function()
    local petsFolder = workspace.__THINGS.Pets

while true do
    for _, petGroup in pairs(petsFolder:GetChildren()) do
        local mainPart = petGroup:FindFirstChild("Main")
        if mainPart then
            local proximityPrompt = mainPart:FindFirstChildOfClass("ProximityPrompt")
            if proximityPrompt then
                proximityPrompt.MaxActivationDistance = 10000
                print("MaxActivationDistance обновлен для питомца: ".. petGroup.Name)
            end
        end
    end
    wait(1)  -- задержка 5 секунд между проверками, можно изменить под нужды
end

  	end    
})

local Tab = Window:MakeTab({
	Name = "Test",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Test"
})

Tab:AddButton({
	Name = "Steal 🔥 (FIXED)",
	Callback = function()
    local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local plots = workspace:WaitForChild("__THINGS"):WaitForChild("Plots")

for i = 1, 10000 do
    local group = plots:FindFirstChild(tostring(i))
    if group then
        local lockButton = group:FindFirstChild("LockButton")
        if lockButton and lockButton:FindFirstChildOfClass("TouchTransmitter") then
            local collectPart = group:FindFirstChild("CollectPart")
            if collectPart then
                -- Телепортируем к CollectPart (чуть выше, чтобы не провалиться)
                humanoidRootPart.CFrame = collectPart.CFrame + Vector3.new(0, 6, 0)
                break
            end
        end
    end
end

  	end    
})

OrionLib:Init()

