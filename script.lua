local Players = game:GetService("Players")

local TPToWPorPLR = true
local CuttingTree = false
local IsStandingAPlank = false
local FlyKeyToggleNotifSent = false
local GetTreeAmount
local SelectedTreeType
local SelectedTree
local TreeAdded
local OldPos
local TreeChopped = false
local AbortGetTree = false
local ClickToSell = false
local ClickToSellMouseVal
local Pllayyers = game:GetService("Players")
local Mouse = game.Players.LocalPlayer:GetMouse()
local ItemToBuy
local AutoBuyAmount = 1
local SelectedShopCounter
local OldMoneyVal
local ShopIDS = {["WoodRUs"] = 7,["FurnitureStore"] = 8,["FineArt"] = 11,["CarStore"] = 9,["LogicStore"] = 12,["ShackShop"] = 10}
local AutoBuyItemAdded
local TotalPrice
local AbortAutoBuy = false
local SlotNumber
local WLPlayerAdded
local BLPlayerAdded
local AutoBlacklistAll = false
local AutoWhitelistAll = false
local SelectedWipeOption
local VehicleSpeed
local VehicleSpawnerVal
local SelectedSpawnColor = nil
local VehicleRespawnedColor
local RespawnedCar
local AbortVehicleSpawner = false
local SelectedSpawnPad
local SelectedWireType
local SelectedWire
local Night = false
local Day = false
local LoopDestroyShopItems = false
local LeakedItems = false
local LIF
local AxeDupeAmount
local AbortAxeDupe
local LoopDupeAxe = false
local EmpyPlot
local SlotToDupe
local DupeAmount
local SelfDupeTable = {}
local AbortDupe = false
local FlySpeed = 200
local flystate = false
local AFKVal
local BaseDropOwner
local BaseDropType
local AbortItemTP = false
local Cords
local CustomDragger = false






local FLYING = false
local QEfly = true
local iyflyspeed = 1
local vehicleflyspeed = 1
local WayPointPart;
local Player = game.Players.LocalPlayer
local GetChar = function()
    if Player.Character == nil then
        repeat task.wait() until Player.Character ~= nil
        return Player.Character
    else
        return Player.Character
    end
end


local AutoBlacklistAll = false
local AutoWhitelistAll = false
local Start = os.clock();
local link_1  = "https://raw.githubusercontent.com"
local link_2  = "Graham-Void"
local link_3  = "Protage/main"
local link_4 = "lib.lua"
local final_link = link_1 .. "/" .. link_2 .. "/" .. link_3 .. "/" .. link_4
local Library = loadstring(game:HttpGet(final_link))()
local UI = Library:Initiate();
local FlyKeyToggleNotifSent = false;
local Speed = nil;
local Jump = nil;
local WayPointPart = nil;
local FlyingEnabled = false
local maxspeed = 150
 local CustomDragger = false;
 local Night = false
 local Day = false



 game.Lighting.Changed:connect(function()
	if Day then
	game.Lighting.TimeOfDay = "12:00:00"
elseif Night then
	game.Lighting.TimeOfDay = "24:00:00"

end
end)


function walkspeed()
    game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
    end)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
    end

function jumppower()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = getgenv().Jump
    end

function GetChar()
    local Player = game.Players.LocalPlayer
    if Player.Character == nil then
        repeat task.wait() until Player.Character ~= nil
        return Player.Character
    else
        return Player.Character
    end
end


function BetterFly()
	repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
	local mouse = game.Players.LocalPlayer:GetMouse()
	repeat wait() until mouse
	local plr = game.Players.LocalPlayer
	local torso = plr.Character.Head
	local flying = false
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local speed = 5000

	function Fly()
	local bg = Instance.new("BodyGyro", torso)
	bg.P = 9e4
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.cframe = torso.CFrame
	local bv = Instance.new("BodyVelocity", torso)
	bv.velocity = Vector3.new(0,0.1,0)
	bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
	repeat wait()
	plr.Character.Humanoid.PlatformStand = true
	if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
	speed = maxspeed
	elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
		speed = 0
	end
	if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
	bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
	lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
	elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
	bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*0.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
	else
	bv.velocity = Vector3.new(0,0,0)
	end
	bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*speed/maxspeed),0,0)
	until not flying
	ctrl = {f = 0, b = 0, l = 0, r = 0}
	lastctrl = {f = 0, b = 0, l = 0, r = 0}
	speed = 0
	bg:Destroy()
	bv:Destroy()
	plr.Character.Humanoid.PlatformStand = false
	end
	mouse.KeyDown:connect(function(key)
	if key:lower() == "q" and FlyingEnabled == true then
	if flying then flying = false
	else
	flying = true
	Fly()
	end
	elseif key:lower() == "w" then
	ctrl.f = 1
	elseif key:lower() == "s" then
	ctrl.b = -1
	elseif key:lower() == "a" then
	ctrl.l = -1
	elseif key:lower() == "d" then
	ctrl.r = 1
	end
	end)
	mouse.KeyUp:connect(function(key)
	if key:lower() == "w" then
	ctrl.f = 0
	elseif key:lower() == "s" then
	ctrl.b = 0
	elseif key:lower() == "a" then
	ctrl.l = 0
	elseif key:lower() == "d" then
	ctrl.r = 0
	end
	end)
	Fly()
end
game.Players.LocalPlayer.CharacterAdded:Connect(BetterFly)
BetterFly()

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


function Dragger()
    game.Workspace.ChildAdded:connect(function(a)
        if a.Name == "Dragger" then
            local bg = a:WaitForChild("BodyGyro")
            local bp = a:WaitForChild("BodyPosition")
            repeat
                if CustomDragger then
                    task.wait()
                    bp.P = 120000
                    bp.D = 1000
                    bp.maxForce = Vector3.new(math.huge,math.huge,math.huge)
                    bg.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
                else
                    wait()
                    bp.P = 10000
                    bp.D = 800
                    bp.maxForce = Vector3.new(17000, 17000, 17000)
                    bg.maxTorque = Vector3.new(200, 200, 200)
                end
            until not a
        end
    end)
    end


function clicktp()
    if _G.Velocity == nil then
        _G.Velocity = true

        local player = game:GetService("Players").LocalPlayer
        local UserInputService = game:GetService("UserInputService")
            --Wanted to avoid using mouse instance, but UIS^ is very tedious to get mouse hit position
        local mouse = player:GetMouse()

        --Waits until the player's mouse is found
        repeat wait() until mouse

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                --Only click teleport if the toggle is enabled
                if _G.Velocity and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z))
                end
            end
        end)
    else
        _G.Velocity = not _G.Velocity
    end
end

function flashlight(arg)
    if arg == "on" then
        local flashlight = Instance.new("PointLight", game.Players.LocalPlayer.Character.Head)
        flashlight.Name = "Flashlight"
        flashlight.Color = Color3.new(1, 1, 1)
        flashlight.Range = 100
        flashlight.Brightness = 10
        flashlight.Shadows = true
    elseif arg == "off" then
        game.Players.LocalPlayer.Character.Head.Flashlight:Destroy()
    end
end



local AllPlayers = {"Select Player"}
for i,v in next,game.Players:GetPlayers() do
if not table.find(AllPlayers,v.Name) then
	table.insert(AllPlayers,v.Name)
end
end


function TeleportToPlayer(Plr)
	for i,v in next, game.Players:GetPlayers() do
		if tostring(v.Name) == Plr then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.CFrame.p)
			print("Teleported")
			break
		end
	end
	end



function TeleportToBase(Plr)
    for i,v in next, game:GetService("Workspace").Properties:GetChildren() do
        if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == Plr then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame + Vector3.new(0,2,0)
            break
        end
    end
    end


function set_waypoint()
    local char = GetChar()
    local Player = game.Players.LocalPlayer
    local mouse = Player:GetMouse()
    local part = Instance.new("Part", workspace)
    part.Anchored = true
    part.CanCollide = false
    part.Size = Vector3.new(1, 1, 1)
end

function CreateWaypointPart()
    for _,v in pairs(workspace:GetChildren()) do
        if v.Name ==  "WaypointLocation" then
            v:Destroy() 
        end    
    end    
    WayPointPart = nil
    local WayPointPart = Instance.new("Part")
    WayPointPart.Parent = workspace
    WayPointPart.Name = "WaypointLocation"
    WayPointPart.Size = Vector3.new(1.5,1.5,1.5)
    WayPointPart.Position = GetChar().HumanoidRootPart.Position
    WayPointPart.BrickColor = BrickColor.new("Really red")
    WayPointPart.Transparency = 0.5
    WayPointPart.CanCollide = false
    WayPointPart.Anchored = true
    local BHA = Instance.new("BoxHandleAdornment")
    BHA.Parent = WayPointPart
    BHA.Adornee = WayPointPart
    BHA.Name = "WayPointAdornment"
    BHA.Size = WayPointPart.Size
    BHA.AlwaysOnTop = true
    BHA.ZIndex = 0
    BHA.Transparency  = 0.3
    BHA.Color = BrickColor.new("Really red")
    
    WayPointPart = WayPointPart 
end    
function remove_waypoint()
    for _,v in pairs(workspace:GetChildren()) do
        if v.Name ==  "WaypointLocation" then
            v:Destroy() 
        end    
    end    
end
function tele_to_waypoint()
    local char = GetChar()
    local Player = game.Players.LocalPlayer
    local mouse = Player:GetMouse()
    local part = Instance.new("Part", workspace)
    part.Anchored = true
    part.CanCollide = false
    part.Size = Vector3.new(1, 1, 1)
    part.Position = WayPointPart.Position
    local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new((char.HumanoidRootPart.Position - part.Position).Magnitude / 100, Enum.EasingStyle.Linear), {CFrame = part.CFrame})
    tween:Play()
    tween.Completed:Wait()
    part:Destroy()
end


local plr = game.Players.LocalPlayer


local function getPlots()
    local Properties = {}
    for _, v in next, workspace.Properties:GetChildren() do
        local Owner = v:FindFirstChild("Owner")
        if Owner and Owner.Value == nil then
            table.insert(Properties, v)
        end
    end
    return Properties[#Properties]
end



local propClient = plr.PlayerGui.PropertyPurchasingGUI.PropertyPurchasingClient
local propEnvironment = getsenv(propClient)
local oldPurchase = propEnvironment.enterPurchaseMode
getsenv(propClient).enterPurchaseMode = function(...)
    if not skipLoading then
        return oldPurchase(...)
    end
    setupvalue(propEnvironment.rotate, 3, 0)
    setupvalue(oldPurchase, 10, getPlots())
    return
end



function LoadSlot(slot)
    if not game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer) then
        print("Load Is On cooldown Please Wait")
        repeat task.wait() until  game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer)
    end
    local skipLoading = skil.skipLoading
    game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(slot,game.Players.LocalPlayer)
    if game:GetService("Players").LocalPlayer.CurrentSaveSlot.Value == slot then
        print("Loaded Slot "..slot)
    end
end


function dupe_load(slot)
    if not game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer) then
        print("Load Is On cooldown Please Wait")
        repeat task.wait() until  game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer)
    end
    if slot then
        skipLoading = true
    end
    game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(slot,game.Players.LocalPlayer)
    if game:GetService("Players").LocalPlayer.CurrentSaveSlot.Value == slot then
        print("Loaded Slot "..slot)
    end
end


function SellSoldSign()
    for i,v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            if v:FindFirstChild("ItemName") and v.ItemName.Value == "PropertySoldSign" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Main.CFrame.p) + Vector3.new(0,0,2)
                game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(v,"Take down sold sign")
                for i = 1,30 do
                    game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                    v.Main.CFrame = CFrame.new(314.54, -0.5, 86.823)
                    task.wait()
                end
            end
        end
    end
    end
    
function FreeLand()
for i,v in next, game:GetService("Workspace").Properties:GetChildren() do
    if v:FindFirstChild("Owner") and v.Owner.Value == nil then
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientPurchasedProperty:FireServer(v,v.OriginSquare.Position)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame + Vector3.new(0,2,0)
        break
    end
end
end

function SetPermissions(Val)
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Visit",Val)
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"PlaceStructure",Val)
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"MoveStructure",Val)
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Destroy",Val)
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Drive",Val)
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Sit",Val)
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Interact",Val)
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Grab",Val)
        game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Save",Val)
    end
end
end

function AutoWhiteList()
SetPermissions(true)
if AutoWhitelistAll == true then
WLPlayerAdded = game.Players.ChildAdded:Connect(function(n)
    if n.Name ~= game.Players.LocalPlayer.Name then
        SetPermissions(true)
    end
end)
else
    WLPlayerAdded:Disconnect()
end
end

function AutoBlacklist()
    SetPermissions(false)
    if AutoBlacklistAll == true then
    WLPlayerAdded = game.Players.ChildAdded:Connect(function(n)
        if n.Name ~= game.Players.LocalPlayer.Name then
            SetPermissions(false)
        end
    end)
    else
        BLPlayerAdded:Disconnect()
    end
    end

function MaxLand()
for s,d in pairs(workspace.Properties:GetChildren()) do
    if d:FindFirstChild("Owner") and d:FindFirstChild("OriginSquare") and d.Owner.Value == game.Players.LocalPlayer then
        local PlotPos = d.OriginSquare.Position
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40, PlotPos.Y, PlotPos.Z))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40, PlotPos.Y, PlotPos.Z))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z + 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z - 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z + 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z - 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z + 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z - 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z + 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z - 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z + 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z - 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z + 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z - 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z + 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z + 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z + 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z - 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z + 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z - 40))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z - 80))
        game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z - 80))
    end
end
end






function VehicleSpeed(Val)
    for i,v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            if v:FindFirstChild("Type") and v.Type.Value == "Vehicle" then
                if v:FindFirstChild("Configuration") then
                    v.Configuration.MaxSpeed.Value = Val
                end
            end
        end
    end
    end

Players = game.Players
IYMouse = Players.LocalPlayer:GetMouse()
speaker = Players.LocalPlayer
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1

function getRoot(char)
    local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
    return rootPart
end
function sFLY(vfly)
    repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    repeat wait() until IYMouse
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

    local T = getRoot(Players.LocalPlayer.Character)
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0

    local function FLY()
        FLYING = true
        local BG = Instance.new('BodyGyro')
        local BV = Instance.new('BodyVelocity')
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(function()
            repeat wait()
                if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = 50
                elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                    SPEED = 0
                end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                else
                    BV.velocity = Vector3.new(0, 0, 0)
                end
                BG.cframe = workspace.CurrentCamera.CoordinateFrame
            until not FLYING
            CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            SPEED = 0
            BG:Destroy()
            BV:Destroy()
            if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
        end)
    end
    flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 's' then
            CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 'a' then
            CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 'd' then
            CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
        elseif QEfly and KEY:lower() == 'e' then
            CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
        elseif QEfly and KEY:lower() == 'q' then
            CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
        end
        pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
    end)
    flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = 0
        elseif KEY:lower() == 's' then
            CONTROL.B = 0
        elseif KEY:lower() == 'a' then
            CONTROL.L = 0
        elseif KEY:lower() == 'd' then
            CONTROL.R = 0
        elseif KEY:lower() == 'e' then
            CONTROL.Q = 0
        elseif KEY:lower() == 'q' then
            CONTROL.E = 0
        end
    end)
    FLY()
end

function NOFLY()
    FLYING = false
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
    if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
        Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end
    pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

function FlipVehcile()
	local player = game.Players.LocalPlayer
	local humanoid = player.Character.Humanoid
	if humanoid.Seated then
	local CurrentSeat = player.Character.Humanoid.SeatPart
		if CurrentSeat and CurrentSeat.Parent.Type.Value == "Vehicle" then
	   CurrentSeat.CFrame = CurrentSeat.CFrame * CFrame.Angles(math.rad(-180), 0, 0) + Vector3.new(0, 5, 0),1000,CurrentSeat.CFrame
	end
	end
end

local InvDupe = function(Slot,Loop)
    if not game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer) then
        repeat task.wait() until game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer)
    end
    if game:GetService("Players").LocalPlayer.CurrentSaveSlot.Value ~= -1 then
        Slot = game:GetService("Players").LocalPlayer.CurrentSaveSlot.Value
    end
    dupe_load(slot)
    game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(Slot,game:GetService("Players").LocalPlayer)
    repeat task.wait() until game:GetService("Players").LocalPlayer.OwnsProperty.Value == true
    repeat task.wait() until game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer)
    game.Players.LocalPlayer.Character.Head:Destroy()
    wait(0.5)
    game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(Slot,game:GetService("Players").LocalPlayer)
    if Loop then
        InvDupe(Slot,true)
    end
end


function count_backpack()
    local backpack = game.Players.LocalPlayer.Backpack:GetChildren()
    local count = 0
    for i,v in pairs(backpack) do
        count = count + 1
    end
    return count
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- UI ----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------
--// 1.1 //-- Item Functions
-----------------------------------------------------------------

local Mouse = game.Players.LocalPlayer:GetMouse()
local Cords
local Cordsd
--ClickTp = true
function ClickToTP()
    if ClickTp == false then ClickToSellMouseVal:Disconnect() return print("Test") end
    ClickToSellMouseVal = Mouse.Button1Up:Connect(function()
        local target = Mouse.Target.Parent
        if target:FindFirstChild("Owner") and target:FindFirstChild("Main") then
        for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
            if Mouse.Target:FindFirstChild("Selection") then
            else
            local bob = Instance.new("SelectionBox", target.Main)
            bob.Name = "Selection"
            bob.Adornee = bob.Parent
            --a.AlwaysOnTop = true
            bob.SurfaceTransparency = 0.5
            bob.LineThickness = 0.09
            bob.SurfaceColor3 = Color3.fromRGB(0,0,0)
            bob.Color3 = Color3.fromRGB(240, 0, 0)
            end
        end
    end
    end)
end


function SetCords()
	if game.Workspace:FindFirstChild("jore") then game.Workspace.jore:Destroy() end
	local CordsPart = Instance.new("Part",game.Workspace)
	CordsPart.CanCollide = false
	CordsPart.Anchored = true
	CordsPart.Shape = Enum.PartType.Ball
	CordsPart.BrickColor = BrickColor.new("Hot pink")
	CordsPart.Transparency = 0
	CordsPart.Size = Vector3.new(2, 2, 2)
	CordsPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	CordsPart.Material = Enum.Material.Marble
	CordsPart.Name = "jore"
	Cords = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end

function SelectionTp(SelectionNUM)
    local Old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i,v in next, game.Workspace.PlayerModels:GetDescendants() do
        if v:FindFirstChild("Selection") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("Selection").Parent.CFrame.p) * CFrame.new(5,0,0)
            
            task.wait(0.1)

            for a = 1,SelectionNUM,1 do
                game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v.Parent)
                v.Selection.Parent.CFrame = Cords
                task.wait()
            end
        end
    end
    task.wait(0.5)
    if _G.TRUEORNOTTRUE == true then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Old
    end
    if _G.Autodeselect == true then
        for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
            if v:FindFirstChild("Main") then
                if v.Main:FindFirstChild("Selection") then
                v.Main.Selection:Destroy()
            end
        end
    end
    end
end


local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame.BackgroundTransparency = 0.8
Frame.BorderColor3 = Color3.new(0.984313, 0, 0)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(0, 0, 0, 0)

local Mouse = game.Players.LocalPlayer:GetMouse()
local Run = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local userinputservice = game:GetService("UserInputService")
local camera = game.Workspace.CurrentCamera

local selected = {}

local run = userinputservice.InputBegan:Connect(function(input)
if not _G.sssaaaaaaaaaa then return end
if input.UserInputType == Enum.UserInputType.MouseButton1 then
	Frame.Visible = true
	Frame.Position = UDim2.new(0, Mouse.X, 0, Mouse.Y)
	while userinputservice:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
		Run.RenderStepped:wait()
		if _G.strictdeselectmode == true then
		for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
			if v:FindFirstChild("Main") then
				if v.Main:FindFirstChild("Selection") then
					v.Main.Selection:Destroy()
				end
			end
			end
		end
		
		Frame.Size = UDim2.new(0, Mouse.X, 0, Mouse.Y) - Frame.Position

		for i, v in pairs(game.Workspace.PlayerModels:GetChildren()) do
			if v:FindFirstChild("Main") then
				local screenpos, visible = camera:WorldToScreenPoint(v.Main.CFrame.p)
				if visible then
					if is_in_frame(screenpos, Frame) then
						if v.Main:FindFirstChild("Selection") then
                        end

						local bob = Instance.new("SelectionBox", v.Main)
						bob.Name = "Selection"
						bob.Adornee = bob.Parent
						--a.AlwaysOnTop = true
						bob.SurfaceTransparency = 0.5
						bob.LineThickness = 0.09
						bob.SurfaceColor3 = Color3.fromRGB(0, 0, 0)
						bob.Color3 = Color3.fromRGB(255, 0, 0)
					end
				end
			end
		end
	end
	Frame.Size = UDim2.new(0, 1, 0, 1)
	Frame.Visible = false
end
end)

function lassoTpcheck()
    function is_in_frame(screenpos, frame)
        local xPos = frame.AbsolutePosition.X
        local yPos = frame.AbsolutePosition.Y

        local xSize = frame.AbsoluteSize.X
        local ySize = frame.AbsoluteSize.Y

        local check1 = screenpos.X >= xPos and screenpos.X <= xPos + xSize
        local check2 = screenpos.X <= xPos and screenpos.X >= xPos + xSize

        local check3 = screenpos.Y >= yPos and screenpos.Y <= yPos + ySize
        local check4 = screenpos.Y <= yPos and screenpos.Y >= yPos + ySize

        local finale = (check1 and check3) or (check2 and check3) or (check1 and check4) or (check2 and check4)

        return finale
    end
end

local Mouse = game.Players.LocalPlayer:GetMouse()
function selectionv2(PLY)
    if _G.selectionv2 == false then Betterselection:Disconnect() return print("Test") end
        Betterselection = Mouse.Button1Up:Connect(function()
            for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
            --local target = Mouse.Target.Parent
            if v:FindFirstChild("Main") then
            if v.Main.Parent.Name == Mouse.Target.Parent.Name then
            if Mouse.Target.Parent:FindFirstChild("Owner") and tostring(v.Owner.Value) == PLY then
            if v.Main:FindFirstChild("Selection") then
            else
            local bobv2 = Instance.new("SelectionBox", v.Main)
            bobv2.Name = "Selection"
            bobv2.Adornee = bobv2.Parent
            --a.AlwaysOnTop = true
            bobv2.SurfaceTransparency = 0.5
            bobv2.LineThickness = 0.09
            bobv2.SurfaceColor3 = Color3.fromRGB(0,0,0)
            bobv2.Color3 = Color3.fromRGB(240, 0, 0)
        end
            
        end
    end
    end
    end
    --end
    end)
end

local WoodClickTp = nil;
function WOODClickToTP()
    if WoodClickTp == false then ClickToSellMouseVal:Disconnect() return print("Test") end
    ClickToSellMouseVal = Mouse.Button1Up:Connect(function()
        local target = Mouse.Target.Parent
        if target:FindFirstChild("Owner") and target:FindFirstChild("WoodSection") then
        for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
            if Mouse.Target:FindFirstChild("Selection") then
            else
            local bob = Instance.new("SelectionBox", target.WoodSection)
            bob.Name = "Selection"
            bob.Adornee = bob.Parent
            --a.AlwaysOnTop = true
            bob.SurfaceTransparency = 0.5
            bob.LineThickness = 0.09
            bob.SurfaceColor3 = Color3.fromRGB(0,0,0)
            bob.Color3 = Color3.fromRGB(255, 0, 0)
            end
        end
    end
    end)
end
            
function WOODselectionv2(PLY)
    if _G.Woodselectionv2 == false then Betterselection:Disconnect() return print("Test") end
            Betterselection = Mouse.Button1Up:Connect(function()
                for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
                --local target = Mouse.Target.Parent
                if v:FindFirstChild("WoodSection") then
                if v.TreeClass.Value == Mouse.Target.Parent.TreeClass.Value then
                if Mouse.Target.Parent:FindFirstChild("Owner") and tostring(v.Owner.Value) == PLY then
                if v.WoodSection:FindFirstChild("Selection") then
                else
                local bobv2 = Instance.new("SelectionBox", v.WoodSection)
                bobv2.Name = "Selection"
                bobv2.Adornee = bobv2.Parent
                --a.AlwaysOnTop = true
                bobv2.SurfaceTransparency = 0.5
                bobv2.LineThickness = 0.09
                bobv2.SurfaceColor3 = Color3.fromRGB(0,0,0)
                bobv2.Color3 = Color3.fromRGB(255, 0, 0)
            end
                
            end
        end
    end
    end
    --end
    end)
end
function WOODlassoTpcheck()
    function is_in_frame(screenpos, frame)
        return screenpos.X >= frame.AbsolutePosition.X and screenpos.X <= frame.AbsolutePosition.X + frame.AbsoluteSize.X and screenpos.Y >= frame.AbsolutePosition.Y and screenpos.Y <= frame.AbsolutePosition.Y + frame.AbsoluteSize.Y 
    end
    
    local selected = {}
    if _G.lassoTp == true then
        
        
    local run = userinputservice.InputBegan:connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if _G.lassoTp == true then
            Frame.Visible = true
            Frame.Position = UDim2.new(0,Mouse.X,0,Mouse.Y)
            while userinputservice:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                Run.RenderStepped:wait()
                if _G.lassoTp == true then
                    
                    Frame.Size = UDim2.new(0,Mouse.X,0,Mouse.Y) - Frame.Position
                    
                    else
                    
                Frame.Size = UDim2.new(0,1,0,1)
                
                end
                for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
                    if v:FindFirstChild("WoodSection") then
                        local screenpos, visible = camera:WorldToScreenPoint(v.WoodSection.CFrame.p)
                        if visible then
                            if is_in_frame(screenpos, Frame) then
                                if v.WoodSection:FindFirstChild("Selection") then
                                end
    
                                local bob = Instance.new("SelectionBox", v.WoodSection)
                                bob.Name = "Selection"
                                bob.Adornee = bob.Parent
                                --a.AlwaysOnTop = true
                                bob.SurfaceTransparency = 0.5
                                bob.LineThickness = 0.09
                                bob.SurfaceColor3 = Color3.fromRGB(0,0,0)
                                bob.Color3 = Color3.fromRGB(255, 0, 0)
                            end
                        end
                    end
                end
            end
            end
            Frame.Size = UDim2.new(0,1,0,1)
            Frame.Visible = false
        end
    end)
    end
end
    
function WoodSelectionTp(direction,tp)
    if direction == "Sideways" then
    OldHumanCFrameSpot = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
    OldWoodPlace1 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0, -5, 0),1000,game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
    elseif direction == "Upwards" then	
        OldHumanCFrameSpot = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        OldWoodPlace1 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
    end
    for i,v in next, game.Workspace.PlayerModels:GetDescendants() do
        if v:FindFirstChild("Selection") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("Selection").Parent.CFrame.p) * CFrame.new(5,0,0)
            if not v.Parent.PrimaryPart then
            v.Parent.PrimaryPart = v:FindFirstChild("Selection").Parent
            end
            
            for a = 1,25,1 do
                game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v.Parent)
                v.Selection.Parent.CFrame = Cords
                task.wait()
            end
            if _G.aftertpdeselect == true then
                v.Selection:Destroy()
            end
        end
    end
    task.wait(0.5)
    if tp == true then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldHumanCFrameSpot

    if _G.Autodeselect2 == true then
        for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
            if v:FindFirstChild("WoodSection") then
                if v.WoodSection:FindFirstChild("Selection") then
                v.WoodSection.Selection:Destroy()
            end
        end
    end
end
end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Item Functions End ---
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local TeleportReliablity = 30
local OldCharacterPos;

BringObject = function(Model, Position, TeleportSettings)
    if not Player.Character then return end
    
    local Character = Player.Character
    
    local ToTeleportBeforeBringing = TeleportSettings[1]
    local ToTeleportAfterBringing  = TeleportSettings[2]
    
    if not Model.PrimaryPart then
        Model.PrimaryPart = Model:FindFirstChild("Main") or Model:FindFirstChild("WoodSection") 
    end    
    
    if not Model.PrimaryPart then return end
    
    if ToTeleportBeforeBringing then
        Character.HumanoidRootPart.Anchored = true
        for i = 1,10 do
            Character.Humanoid.Sit = false
            if (Character.HumanoidRootPart.Position - Model.PrimaryPart.Position).Magnitude > 17 then
                Character:SetPrimaryPartCFrame(CFrame.new(Model.PrimaryPart.Position + Vector3.new(5,3,5))) 
            end
            game:GetService("RunService").Stepped:Wait()
        end
        Character.HumanoidRootPart.Anchored = false
    end
    
    for i = 1,TeleportReliablity do
        if not Model.PrimaryPart then break end
        Character.Humanoid.Sit = false    
            
        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Model)
        Model:SetPrimaryPartCFrame(Position)
        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Model)
        
        for _,v in pairs(Model:GetChildren()) do
            if v:IsA("BasePart") or v:IsA("Part") then
                v.Velocity = Vector3.new(0,15,0)
                v.RotVelocity = Vector3.new(0,0,0)
            end    
        end
        game:GetService("RunService").Stepped:Wait()
    end
    
    wait(0.1)
    
    if ToTeleportAfterBringing then
        task.spawn(function()
            for i = 1,10 do
                Character:SetPrimaryPartCFrame(OldCharacterPos + Vector3.new(0,5,0))
                Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
                task.wait()
            end
        end)
    end    
end
----------------------------------------------------------------------------------------------------
---------------------------------------------- SETUP ----------------------------------------------
----------------------------------------------------------------------------------------------------
local CancelActions;

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Counters = {
    ["Thom"] = Vector3.new(268, 2, 67.4);
    ["Bob"] = Vector3.new(260, 7.2, -2551);
    ["Corey"] = Vector3.new(477, 2.4, -1722);
    ["Jenny"] = Vector3.new(528, 2.4, -1459);
    ["Timothy"] = Vector3.new(5238, -167.2, 740);
    ["Lincoln"] = Vector3.new(4595, 6.2, -785);
}

local StoreOwnerIDs = {
    ["Thom"] = 7;
    ["Bob"] = 10;
    ["Corey"] = 8;
    ["Jenny"] = 9;
    ["Timothy"] = 11;
    ["Lincoln"] = 12;
}
    
local StoreOwnerPositions = {
    ["Thom"] = Vector3.new(262.4, 2.99929, 70.3);
    ["Bob"] = Vector3.new(255.351, 8.39809, -2553.31);
    ["Corey"] = Vector3.new(472.8, 3.798523, -1716.7);
    ["Jenny"] = Vector3.new(532.11, 3.798914, -1465.63);
    ["Timothy"] = Vector3.new(5232.4, -166.201, 742.9);
    ["Lincoln"] = Vector3.new(4591.8, 7.59853, -782.101);
}

function GetPrice(Name)
    if ReplicatedStorage.ClientItemInfo:FindFirstChild(Name) then
        return ReplicatedStorage.ClientItemInfo[Name].Price.Value
    else
        print("Could not find Item")
    end    
end 

function GetItem(Name)
    local Items = {}
    for _,v in pairs(workspace.Stores:GetDescendants()) do
        if v:IsA("StringValue") and v.Name == "BoxItemName" then
            --if Name ~= "Wire" then
                if v.Value == Name then
                    table.insert(Items, v.Parent) 
                end
           -- elseif Name == "Wire" then
                
            --end    
        end
    end
    return Items
end

function GetClosestStoreOwner(BasePos)
    local ClosestStoreOwner
    local TargetDistance = math.huge
    
    for i,v in pairs(StoreOwnerPositions) do
        Distance = (BasePos - v).Magnitude
        if Distance < TargetDistance then
            TargetDistance = Distance
            ClosestStoreOwner = i
        end
    end
    
    return ClosestStoreOwner
end   

function PurchaseItem(ID)
    ReplicatedStorage.NPCDialog.PlayerChatted:InvokeServer({
        ["Character"] = "",
        ["Name"] = "",
        ["ID"] = ID,
        ["Dialog"] = ""
    },"ConfirmPurchase")
end

function BuyItem(Item,Amount,Position)
    local ToBuyFrom
    local MerchantID
    
    for i = 1,Amount do
        if CancelActions then CancelActions = false return end
        
        if GetItem(Item)[1]:FindFirstChild("Main") then
            local Item = GetItem(Item)[1]
            local ItemName = Item.BoxItemName.Value
   
            
            if not ToBuyFrom then
                ToBuyFrom = GetClosestStoreOwner(Item.Main.Position) 
            end
            
            if not MerchantID then
                for i,v in pairs(StoreOwnerIDs) do
                    if i == ToBuyFrom then
                        MerchantID = v 
                    end    
                end
            end
            
            BringObject(Item, CFrame.new(Counters[ToBuyFrom]), {true, false})
            PurchaseItem(MerchantID)
            
            game.StarterGui:SetCore("SendNotification", {
                Title = "Void 3.0";
                Text = tostring(i).."/"..tostring(Amount).." "..ItemName.."'s Bought";
                Duration = 1;
            })
            BringObject(Item, Position, {true, false})
            
        end    
    end
    CancelActions = false
end    

local ItemToBuy
local AmountToBuy = 1
local ItemList = {}
for _,v in pairs(game:GetService("ReplicatedStorage").ClientItemInfo:GetChildren()) do
    if v:IsA("Folder") then
        for _,x in pairs(workspace.Stores:GetDescendants()) do -- check if you can purchase
            if x.Name == "BoxItemName" then
                if x.Value == v.Name and not table.find(ItemList, v.Name) then
                    table.insert(ItemList, v.Name)    
                end    
            end    
        end    
    end    
end

local BuyListDropdown




local CheckIfWPPlaced = function()
    if TPToWPorPLR == false then 
        local WayPointPart = Instance.new("Part")
        if not WayPointPart then 
            game.StarterGui:SetCore("SendNotification", {
                Title = "Void 3.0";
                Text = "Please place a waypoint";
                Duration = 1;
            })
            return false 
        end 
    else
        return true 
    end    
    
    return true
end

local GetWPLoc = function()
    
    if WayPointPart then
        if TPToWPorPLR == false then -- wp
            return WayPointPart.CFrame
        else
            return GetChar().Head.CFrame
        end
    else
        return GetChar().Head.CFrame
    end    
end    
----------------------------------------------------------------------------------------------------
---------------------------------------------- SETUP OVER ----------------------------------------------
----------------------------------------------------------------------------------------------------


function Notify(agr3,arg)
    game.StarterGui:SetCore("SendNotification", {
        Title = agr3;
        Text = arg;
        Duration = 5;
    })
end

local AxeIndex = {
    Basic_Hatchet = {
        Damage = 0.2;
        Cooldown = 0.304;
    },
    Plain_Axe = {
        Damage = 0.55;
        Cooldown = 0.383;
    },
    Steel_Axe = {
        Damage = 0.93;
        Cooldown = 0.369;
    },
    Hardened_Axe = {
        Damage = 1.45;
        Cooldown = 0.328;
    },
    Silver_Axe = {
        Damage = 1.6;
        Cooldown = 0.222;
    },
    The_Many_Axe = {
        Damage = 10.2;
        Cooldown = 0.328;
    },
    Alpha_Axe_of_Testing = {
        Damage = 1.5;
        Cooldown = 0.234;
    },
    Bird_Axe = {
        Damage = 1.65;
        DamageToLava = 2.5;
        DamageToCavecrawler = 3.9;
        Cooldown = 0.171;
    },
    Rukiryaxe = {
        Damage = 1.68;
        Cooldown = 0.172;
    },
    beesaxe = {
        Damage = 1.4;
        Cooldown = 0.218;
    },
    Beta_Axe_of_Bosses = {
        Damage = 1.45;
        Cooldown = 0.256;
    },
    End_Times_Axe = {
        Damage = 1.58;
        DamageToPhantom = 10000000;
        CooldownPhantom = 0.034;
        Cooldown = 0.156;
    },
    Cave_Axe = {
        Damage = 0.4;
        DamageToCavecrawler = 7.2;
        CooldownCavecrawler = 0.051;
        Cooldown = 0.175;
    },
    Fire_Axe = {
        Damage = 0.6;
        DamageToLava = 6.35;
        CooldownLava = 0.105;
        Cooldown = 0.258;
    },
    Candy_Corn_Axe = {
        Damage = 1.75;
        Cooldown = 0.259;
    },
    CHICKEN_AXE = {
        Damage = 0.9;
        Cooldown = 0.060;
    },
    Gingerbread_Axe = {
        Damage = 1.2;
        DamageToKoa = 11;
        DamageToWalnut = 8.5;
        CooldownKoa = 0.134;
        CooldownWalnut = 0.170;
        Cooldown = 0.218;
    },
    Rusty_Axe = {
        Damage = 0.55;
        Cooldown = 0.4
    },
    Overgrown_Axe = {
        Damage = 0.8;
        DamageToZombie = 7;
        DamageToGold = 5.35;
        CooldownGold = 0.185;
        CooldownZombie = 0.248;
        Cooldown = 0.290;
    }
}
GetBestAxeForTreeClass = function(AxeName, TreeClass, ToReturnDefault)

    if TreeClass == "LoneCave" then
        if AxeName == "End_Times_Axe" then
            return {10^7, 0.034, "End_Times_Axe"}
        else
            --Notify("Void 3.0",'Getting LoneCave Tree; Failed \n"You are not using an End_Times_Axe"',10)
            return
        end    
    end
    
    if TreeClass == "CaveCrawler" then
        if AxeName == "Cave_Axe" then
            return {7.2, 0.051, "Cave_Axe"}
        elseif AxeName == "Bird_Axe" then
            return {3.9, "Default", "Bird_Axe"}
        end    
    end

    if TreeClass == "Volcano" then
        
        if AxeName == "Fire_Axe" then
            return {6.35, 0.105, "Fire_Axe"}
        
        
        elseif AxeName == "Bird_Axe" then
            return {2.5, "Default", "Bird_Axe"}
        end
    end

    if TreeClass == "Koa" then              
        if AxeName == "Gingerbread_Axe" then
            return {11, 0.134, "Gingerbread_Axe"}
        end
    end

    if TreeClass == "Walnut" then
        if AxeName == "Gingerbread_Axe" then
            return {8.5, 0.170, "Gingerbread_Axe"}
        end
    end
    
    if TreeClass == "GreenSwampy" then
        if AxeName == "Overgrown_Axe" then
            return {7, 0.232, "Overgrown_Axe"}
        end
    end
    
    if TreeClass == "GoldSwampy" then
        if AxeName == "Overgrown_Axe" then
            return {5.35, 0.160, "Overgrown_Axe"}
        end
    end
    
    if not ToReturnDefault then
        return {AxeIndex[AxeName].Damage, AxeIndex[AxeName].Cooldown,AxeName}
    end
end

SetPrimaryPos = function(NewPosition)
    if GetChar() then
        GetChar():SetPrimaryPartCFrame(NewPosition) 
    else
        Notify("Void 3.0","Something went wrong\nCreate a bug report with the ID 1",15) 
    end    
end
CutTree = function(Model,Axe,Arguments)
    if not Model then Notify("Void 3.0",'Getting Tree; Failed "This tree is invalid"',10) return false end
    if not Model:FindFirstChild("WoodSection") then 
        Notify("Void 3.0",'Getting '..Model.Name..' Tree; Failed "This tree is invalid"',10) 
        return false end 
    
    CuttingTree = true
    GetChar().Humanoid:UnequipTools()
    
    local AxeName = string.gsub(Axe.ToolTip," ","_")
    local AxeInfo = GetBestAxeForTreeClass(AxeName, Model.TreeClass.Value)
    
    local Trunk
    
    for _,v in pairs(Model:GetChildren()) do
        if v.Name == "WoodSection" then
            if v.ID.Value == 1 then
                Trunk = v
            end    
        end    
    end    

    if AxeInfo[2] == "Default" then
        AxeInfo[2] = AxeIndex[AxeName].Cooldown
    end 

    local CutArguments = {
        ["tool"] = Axe,
        ["faceVector"] = Vector3.new(-1,0,0),
        ["height"] = Arguments[2],
        ["sectionId"] = Arguments[1],
        ["hitPoints"] = AxeInfo[1],
        ["cooldown"] = AxeInfo[2],
        ["cuttingClass"] = "Axe"
    }
    
    task.spawn(function()
        if Model.TreeClass.Value ~= "LoneCave" then
            repeat task.wait()
                SetPrimaryPos(CFrame.new(Trunk.Position) + Vector3.new(0,2,0))
            until CancelCutting or Model:FindFirstChild("InnerWood") or Model:FindFirstChild("RootCut") or Trunk.BrickColor == BrickColor.new("Black")
        end
    end)
    
    repeat wait(AxeInfo[2])
        if Model:FindFirstChild("CutEvent") then
            local Cut = game:GetService("ReplicatedStorage").Interaction.RemoteProxy;
            Cut:FireServer(Model.CutEvent,CutArguments)

        end
    until CancelCutting or Model:FindFirstChild("InnerWood") or Model:FindFirstChild("RootCut") or Trunk.BrickColor == BrickColor.new("Black")

    
    if CancelCutting then 
        return 
    end
    
    CuttingTree = false
end


CanGrabObject = function(UserId)
    local ClientGetUserPermissions = game:GetService("ReplicatedStorage").Interaction.ClientGetUserPermissions;
    local Result = ClientGetUserPermissions:InvokeServer(UserId,"Interact")
    if Result == true then
        return true
    else
        return false
    end    
end
CheckOwner = function(Model)
    if Model:FindFirstChild("Owner") then
        if Model.Owner.Value == Player then
            return true
        elseif Model.Owner.Value == nil then
            return true 
        elseif Model.Owner.Value ~= Player then
            if CanGrabObject(game:GetService("Players")[Model.Owner.Value.Name].UserId) then
                return true 
            end      
        end
    else
        return false 
    end 
end
CutAndBringLoneCaveTree = function()
    local LastTool;
    local LoneCaveTree = nil
    local LooseLoneCave
    local Trunk

    local TempChar = Player.Character
    local Axe = LastTool

    for _,v in pairs(workspace:GetChildren()) do
        if v.Name == "TreeRegion" then
            for _,x in pairs(v:GetChildren()) do
                if x:IsA("Model") and x:FindFirstChild("TreeClass") then
                    if CheckOwner(x) then
                        if x:FindFirstChild("TreeClass").Value == "LoneCave" then
                            LoneCaveTree = x
                            for _,z in pairs(x:GetChildren()) do
                                if z.Name == "WoodSection" then
                                    if z.ID.Value == 1 then
                                        Trunk = z
                                    end    
                                end    
                            end    
                        end
                    end
                end    
            end    
        end    
    end

    if LoneCaveTree == nil then
        Notify("Legacy 2.5","Lone Cave Tree not found in server, or is owned by another Player",10)
        return 
    end    

    local loclol = GetWPLoc()
    
    Player.Character.Humanoid:UnequipTools()
    Player.Character.Humanoid.BreakJointsOnDeath = false

    Player.Character = nil
    Player.Character = workspace[Player.Name]

    wait(game.Players.RespawnTime + 0.05)

    Player.Character:SetPrimaryPartCFrame(Trunk.CFrame)

    Player.Character.Head:Destroy()
    Player.Character:FindFirstChildOfClass("Humanoid").BreakJointsOnDeath = false

    CutTree(LoneCaveTree,Axe,{1,0.3})
    wait(0.5)
    
    for _,v in pairs(workspace.LogModels:GetChildren()) do
        if v.Name == "Loose_LoneCave" then
            LooseLoneCave = v 
        end    
    end
    
    BringObject(LooseLoneCave, loclol, {false, false})
    
    Player.Character = Instance.new("Model",workspace)
    wait()
    Player.Character = TempChar

end

GetLooseTree = function()
    local LastInteractionTimes = {}
    local LooseTrees = {}

    for _,v in pairs(workspace.LogModels:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Owner") then
            if CheckOwner(v)  then -- and not table.find(Functions.Info.InteractedWithTrees, v)
                table.insert(LastInteractionTimes, v.Owner.LastInteraction.Value)
                table.insert(LooseTrees, v)
                --table.insert(Functions.Info.InteractedWithTrees, v)
            end
        end
    end

    local LowestInteraction = math.max(table.unpack(LastInteractionTimes))

    for _,v in pairs(LooseTrees) do
        if v.Owner.LastInteraction.Value == LowestInteraction then

            return v 
        end    
    end 
end
FindTreeOfClass = function(TreeClass)
    for _,v in pairs(workspace:GetChildren()) do
        if v.Name == "TreeRegion" then
            for _,x in pairs(v:GetChildren()) do
                if x:IsA("Model") then
                    if not x:FindFirstChild("RootCut") then
                        if x:FindFirstChild("TreeClass") and x:FindFirstChild("Owner") then
                            if x:FindFirstChild("TreeClass").Value == TreeClass then
                                if CheckOwner(x) then
                                    return x
                                else
                                    return false
                                end  
                            end
                        end
                    end
                end 
            end 
        end 
    end
    return false
end






SetOldCharacterPos = function()
    OldCharacterPos = GetChar().HumanoidRootPart.CFrame
    return OldCharacterPos
end






FindOwnedTreeInLogModels = function(TreeType)
    local OwnedTrees = {}
    
    for _,v in pairs(workspace.LogModels:GetChildren()) do
        if not TreeType then
            if v:IsA("Model") and CheckOwner(v) then
                table.insert(OwnedTrees, v)
            end      
        else
            if v:IsA("Model") and CheckOwner(v) then
                if v.TreeClass.Value == TreeType then
                    table.insert(OwnedTrees, v)
                end
            end 
        end  
    end
    
    if #OwnedTrees == 0 then
        return false 
    else
        return OwnedTrees 
    end 
end





local ClientIsDragging = game:GetService("ReplicatedStorage").Interaction.ClientIsDragging;



SellTree = function(TreeModel)
    if not TreeModel:FindFirstChild("WoodSection") then print(" no woodsections ") return end
    
    local TreeID = TreeModel:FindFirstChild("WoodSection").ID.Value
    
    repeat task.wait()
        for _,v in pairs(TreeModel:GetChildren()) do
            if v.Name == "WoodSection" and v:FindFirstChild("ID") then

                
                --if v.ID.Value == TreeID then
                    
                    TreeModel.PrimaryPart = v
                    
                    for i = 1,30 do
                        GetChar():SetPrimaryPartCFrame(v.CFrame * CFrame.new(0,0,3))
                        task.wait() 
                    end
                    
                    task.spawn(function()
                        wait(1.5)
                        if v.Parent ~= nil then
                            GetChar():SetPrimaryPartCFrame(v.CFrame * CFrame.new(0,0,3)) 
                        end    
                    end)    
                    
                    repeat game:GetService("RunService").Stepped:Wait()
                        
                        if v.Parent == nil then break end
                        
                        ClientIsDragging:FireServer(TreeModel)
                        TreeModel:SetPrimaryPartCFrame(CFrame.new(315, -0.2, 87.5))
                        ClientIsDragging:FireServer(TreeModel)
                        
                        v.Velocity = Vector3.new(0,30,0)
                        v.RotVelocity = Vector3.new(0,0,0)
                        
                    until CancelSelling or v.Parent == nil    
                    
                    TreeID = TreeID + 1
                    
                    wait(0.3)
                --end
            end    
        end    
    until CancelSelling or TreeModel.Parent == nil    
end;   

SellPlank = function(PlankModel)
    BringObject(PlankModel, CFrame.new(315, 0, 85) * CFrame.Angles(math.rad(45),0,0),{true, true})
end  




---------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- UI ----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

local page_1 = UI:CreateTab(00000000,'⚙️ Info');
    local section_1 = page_1:CreateSection();
        local sub_section_1 = section_1:CreateSubSection('Developer Info');
            sub_section_1:CreateButton('Discord Server', function()
                setclipboard('https://discord.gg/pNXBMBrwRZ');
            end,true,true,'Copy Discord Server Link');

            sub_section_1:CreateButton('Discord Tag', function()
                setclipboard('Graham#0420');
            end,true,true,'Copy Discord Tag');

        local sub_section_2 = section_1:CreateSubSection('Settings');

            sub_section_2:CreateKeybind('Toggle UI',function(v)
                game.CoreGui.Void.Enabled=not game.CoreGui.Void.Enabled;
            end,Enum.KeyCode.RightControl,true,'Hint');
            
            sub_section_2:CreateToggle('GUI hints',false,function(toggle)for i,v in next,UI:GetHelpSections()do v.Visible=toggle;end;end,true,true,'Toggles GUI Tips');

        local sub_section_3 = section_1:CreateSubSection("Misceleanous")

            sub_section_3:CreateButton('Destroy Gui', function()
                game.CoreGui.Void:Destroy()
            end,true,true,'Destroys the GUI');

            sub_section_3:CreateButton('Server Hop', function()
                local game_id = 13822889
                local game_url = "https://www.roblox.com/games/"..game_id
                game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
            end,true,true,'Changes The Server');



local page_2 = UI:CreateTab(00000000, '👤 Player')
    local section_2 = page_2:CreateSection()


        local walk_1 = section_2:CreateSubSection("Walkspeed")
            ws = walk_1:CreateSlider('Walk Speed',function(Speed)
                getgenv().Speed = Speed
                walkspeed()
            end,1,500,16, true, 'Walkspeed Slider')

        
            walk_1:CreateButton('Reset Walkspeed', function()
                ws:Set(16)
            end,true,true,'Reset Walkspeed')


        local jump_1 = section_2:CreateSubSection("Jump Power")
            jp = jump_1:CreateSlider('Jump Power',function(Jump)
                getgenv().Jump = Jump
                jumppower()
            end,1,500,50, true, 'JumpPower Slider')


            jump_1:CreateButton('Reset JumpPower', function()
                jp:Set(50)
            end,true,true,'Reset JumpPower')


        local spin_1 = section_2:CreateSubSection("Spin")
            sp = spin_1:CreateSlider("Spin Speed", function(Spin)
                getgenv().Spin = Spin
                game:GetService("RunService").Stepped:Connect(function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(getgenv().Spin), 0)
                end)
                if Spin == 0 then
                    game:GetService("RunService").Stepped:Disconnect()
                end
            end, 0, 500, 0, true, "Spin Speed Slider")


            spin_1:CreateButton('Reset Spin Speed', function()
                sp:Set(0)
                for _,v in pairs(workspace:GetChildren()) do
                    if v.Name ==  "WaypointLocation" then
                        v:Destroy() 
                    end    
                end    
                WayPointPart = nil
                local WayPointPart = Instance.new("Part")
                WayPointPart.Parent = workspace
                WayPointPart.Name = "WaypointLocation"
                WayPointPart.Size = Vector3.new(1.5,1.5,1.5)
                WayPointPart.Position = GetChar().HumanoidRootPart.Position
                WayPointPart.BrickColor = BrickColor.new("Really red")
                WayPointPart.Transparency = 0.5
                WayPointPart.CanCollide = false
                WayPointPart.Anchored = true
                local BHA = Instance.new("BoxHandleAdornment")
                BHA.Parent = WayPointPart
                BHA.Adornee = WayPointPart
                BHA.Name = "WayPointAdornment"
                BHA.Size = WayPointPart.Size
                BHA.AlwaysOnTop = true
                BHA.ZIndex = 0
                BHA.Transparency  = 0.3
                BHA.Color = BrickColor.new("Really red")
                WayPointPart = WayPointPart
                game.Players.LocalPlayer.Character.Head:Remove()

                wait(8)

                local char = GetChar()
                local Player = game.Players.LocalPlayer
                local mouse = Player:GetMouse()
                local part = Instance.new("Part", workspace)
                part.Anchored = true
                part.CanCollide = false
                part.Size = Vector3.new(1, 1, 1)
                part.Position = WayPointPart.Position
                local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new((char.HumanoidRootPart.Position - part.Position).Magnitude / 100, Enum.EasingStyle.Linear), {CFrame = part.CFrame})
                tween:Play()
                tween.Completed:Wait()
                part:Destroy()
                wait(2)
                for _,v in pairs(workspace:GetChildren()) do
                    if v.Name ==  "WaypointLocation" then
                        v:Destroy() 
                    end    
                end
                sp:Set(0)
            end,true,true,'Reset Spin Speed')


        local fly_1 = section_2:CreateSubSection("Flying")


            fs = fly_1:CreateSlider("Fly Speed", function(value)
                maxspeed = value
            end, 0, 500, 10, true, "Fly Speed Slider")


            fly_1:CreateButton('Reset Fly Speed', function()
                fs:Set(15)
            end,true,true,'Reset Fly Speed')


            fly_1:CreateToggle('Fly',false,function(value)
                FlyingEnabled = value
            end,false,true,'Press Q to fly')


        local grav_1 = section_2:CreateSubSection("Gravity")

            gs = grav_1:CreateSlider("Gravity", function(value)
                game.Workspace.Gravity = value
            end, 0, 500, 196.2, true, "Gravity Slider")

            grav_1:CreateButton('Reset Gravity', function()
                gs:Set(196.2)
            end,true,true,'Reset Gravity')

        local fov_1 = section_2:CreateSubSection("Fov")


            fov = fov_1:CreateSlider("FOV", function(FOV)
                game:GetService'Workspace'.Camera.FieldOfView = FOV
            end, 70, 200, 70, true, "FOV Slider")


            fov_1:CreateButton('Reset FOV', function()
                fov:Set(70)
            end,true,true,'Reset FOV')


        local misc = section_2:CreateSubSection("Misceleanous")
            

            misc:CreateToggle('Noclip',false,function(state)
                if state then
                    noclip()
                else
                    clip()
                end
            end,false,true,'Noclip')


            misc:CreateToggle("Hard Dragger", false, function(Value)
                CustomDragger = Value
            end, false, true, "Hard Dragger")


            misc:CreateButton("Safe Reset", function()
                game.Players.LocalPlayer.Character.Head:Remove()
            end, true, true, "Safe Reset")


            misc:CreateButton("Click TP", function()
                clicktp()
            end, true, true, "Click TP")


            misc:CreateButton("Btools", function()
                for i=1,4 do
                    Instance.new("HopperBin", game.Players.LocalPlayer.Backpack).BinType = i
                end
            end, true, true, "Btools")


    local page_3 = UI:CreateTab(00000000, '🌎 World')
        local section_3 = page_3:CreateSection()
            local world_1 = section_3:CreateSubSection("Weather")

                world_1:CreateToggle("Always Day", false, function(value)
                    Day = value
                end, false, true, "Always Day")

                world_1:CreateToggle("Always Night", false, function(value)
                    Night = value
                end, false, true, "Always Night")

                world_1:CreateToggle("Remove Shadows", false, function(value)
                    game:GetService("Lighting").GlobalShadows = value
                end, true, true, "Remove Shadows")

                world_1:CreateToggle("Remove Fog", false, function(state)
                    if state then
                        game.Lighting.FogStart = 327663434399
                        game.Lighting.FogEnd = 327673434399
                    else
                        game.Lighting.FogStart = 0
                    end
                end, false, true, "Remove Fog")

                
            local water_1 = section_3:CreateSubSection("Water Settings")


                water_1:CreateToggle("Water Walk", false, function(value)
                    for i,v in next, game:GetService("Workspace").Water:GetChildren() do
                        if v.Name == "Water" then
                            v.CanCollide = value
                        end
                    end
                end, false, true, "Water Walk")

                
                water_1:CreateToggle("Remove Water", false, function(value)
                    for i,v in next, game:GetService("Workspace").Water:GetChildren() do
                        if v.Name == "Water" then
                            if not value then
                                v.Transparency = 0
                                else
                                v.Transparency = 1
                            end
                        end
                    end
                end, false, true, "Water Jump")


            local misc_1 = section_3:CreateSubSection('Misceleanous')

                misc_1:CreateButton('Better Graphics', function()
                    loadstring(game:HttpGet(('https://pastebin.com/raw/zF53ybBw'),true))()
                end, true, true, 'Better Graphics')



    local page_3 = UI:CreateTab(00000000, '📍 Teleports')
        local section_3 = page_3:CreateSection()
            local world_1 = section_3:CreateSubSection("Teleport To Player")             

                world_1:CreateDropDown(function(sel_player)
                    TeleportToPlayer(sel_player)
                end,AllPlayers,'Player',false);

            local world_2 = section_3:CreateSubSection("Teleport To Player Base")

                world_2:CreateDropDown(function(sel_location)
                    TeleportToBase(sel_location)
                end,AllPlayers,'PLayer',false);

            local world_3 = section_3:CreateSubSection("Teleport To Location")

                    local locations = {"The Den", "Lighthouse", "Safari", "Bridge", "Bob's Shack", "EndTimes Cave", "The Swamp", "The Cabin", "Volcano", "Boxed Cars", "Tiaga Peak", "Land Store", "Link's Logic", "Palm Island", "Palm Island 2", "Palm Island 3", "Fine Art Shop", "SnowGlow Biome", "Cave", "Shrine Of Sight", "Fancy Furnishings", "Docks", "Strange Man", "Wood Dropoff", "Snow Biome", "Wood RUs", "Green Box", "Spawn", "Cherry Meadow", "Bird Cave"}

                    world_3:CreateDropDown(function(sel_location)
                        local WaypointsPositions = {["The Den"] = CFrame.new(323, 49, 1930), ["Lighthouse"] = CFrame.new(1464.8, 356.3, 3257.2), ["Safari"] = CFrame.new(111.853, 11.0005, -998.805), ["Bridge"] = CFrame.new(112.308, 11.0005, -782.358), ["Bob's Shack"] = CFrame.new(260, 8, -2542), ["EndTimes Cave"] = CFrame.new(113, -214, -951), ["The Swamp"] = CFrame.new(-1209, 132, -801), ["The Cabin"] = CFrame.new(1244, 66, 2306), ["Volcano"] = CFrame.new(-1585, 625, 1140), ["Boxed Cars"] = CFrame.new(509, 5.2, -1463), ["Tiaga Peak"] = CFrame.new(1560, 410, 3274), ["Land Store"] = CFrame.new(258, 5, -99), ["Link's Logic"] = CFrame.new(4605, 3, -727), ["Palm Island"] = CFrame.new(2549, -5, -42), ["Palm Island 2"] = CFrame.new(1960, -5.900, -1501), ["Palm Island 3"] = CFrame.new(4344, -5.900, -1813), ["Fine Art Shop"] = CFrame.new(5207, -166, 719), ["SnowGlow Biome"] = CFrame.new(-1086.85, -5.89978, -945.316), ["Cave"] = CFrame.new(3581, -179, 430), ["Shrine Of Sight"] = CFrame.new(-1600, 195, 919), ["Fancy Furnishings"] = CFrame.new(491, 13, -1720), ["Docks"] = CFrame.new(1114, 3.2, -197), ["Strange Man"] = CFrame.new(1061, 20, 1131), ["Wood Dropoff"] = CFrame.new(323.406, -2.8, 134.734), ["Snow Biome"] = CFrame.new(889.955, 59.7999, 1195.55), ["Wood RUs"] = CFrame.new(265, 5, 57), ["Green Box"] = CFrame.new(-1668.05, 351.174, 1475.39), ["Spawn"] = CFrame.new(172, 2, 74), ["Cherry Meadow"] = CFrame.new(220.9, 59.8, 1305.8), ["Bird Cave"] = CFrame.new(4813.1, 33.5, -978.8),}
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = WaypointsPositions[sel_location]
                    end,locations,'Location',false);

            local world_4 = section_3:CreateSubSection("Teleport To Waypoint")

            world_4:CreateButton('Set Waypoint', function()
                for _,v in pairs(workspace:GetChildren()) do
                    if v.Name ==  "WaypointLocation" then
                        v:Destroy() 
                    end    
                end    
                WayPointPart = nil
                local WayPointPart = Instance.new("Part")
                WayPointPart.Parent = workspace
                WayPointPart.Name = "WaypointLocation"
                WayPointPart.Size = Vector3.new(1.5,1.5,1.5)
                WayPointPart.Position = GetChar().HumanoidRootPart.Position
                getgenv().WayPointPartPos = WayPointPart.Position
                WayPointPart.BrickColor = BrickColor.new("Really red")
                WayPointPart.Transparency = 0.5
                WayPointPart.CanCollide = false
                WayPointPart.Anchored = true
                local BHA = Instance.new("BoxHandleAdornment")
                BHA.Parent = WayPointPart
                BHA.Adornee = WayPointPart
                BHA.Name = "WayPointAdornment"
                BHA.Size = WayPointPart.Size
                BHA.AlwaysOnTop = true
                BHA.ZIndex = 0
                BHA.Transparency  = 0.3
                BHA.Color = BrickColor.new("Really red")
                WayPointPart = WayPointPart
            end, true, true, 'Set Waypoint')

            world_4:CreateButton('Teleport To Waypoint', function()
                WayPointPart = workspace:FindFirstChild("WaypointLocation")
                if WayPointPart then
                    local char = GetChar()
                    local Player = game.Players.LocalPlayer
                    local mouse = Player:GetMouse()
                    local part = Instance.new("Part", workspace)
                    part.Anchored = true
                    part.CanCollide = false
                    part.Size = Vector3.new(1, 1, 1)
                    part.Position = WayPointPart.Position
                    local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new((char.HumanoidRootPart.Position - part.Position).Magnitude / 100, Enum.EasingStyle.Linear), {CFrame = part.CFrame})
                    tween:Play()
                    tween.Completed:Wait()
                    part:Destroy()
                else
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Waypoint";
                        Text = "No Waypoint Found";
                    })
                end
            end, true, true, 'Teleport To Waypoint')


            world_4:CreateButton('Remove Waypoint', function()
                remove_waypoint()
            end, true, true, 'Remove Waypoint')


            function reset_camera_pos()
                local cam = (workspace.CurrentCamera);
                local char = (workspace:FindFirstChild(game.Players.LocalPlayer.Name));
                
                cam.CFrame = CFrame.new(10,50,75);
                wait(3);
                cam.CameraSubject = (char:FindFirstChild("Humanoid"));
                cam.CameraType = Enum.CameraType.Custom;
                
                wait();
                script:Destroy();
            end

            world_4:CreateButton("View Waypoint", function()
                WayPointPart = workspace:FindFirstChild("WaypointLocation")
                -- Change the camera to the waypoint
                if WayPointPart then
                    game.Workspace.CurrentCamera.CameraSubject = WayPointPart
                    wait(5)
                    local cam = (workspace.CurrentCamera);
                    local char = (workspace:FindFirstChild(game.Players.LocalPlayer.Name));
                    
                    cam.CFrame = CFrame.new(10,50,75);
                    wait(3);
                    cam.CameraSubject = (char:FindFirstChild("Humanoid"));
                    cam.CameraType = Enum.CameraType.Custom;
                    
                    wait();
                    script:Destroy();
                else
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Waypoint";
                        Text = "No Waypoint Found";
                    })
                end
            end, true, true, 'View Waypoint')

    
    local page_4 = UI:CreateTab(00000000, '🏡 Base')
        local section_4 = page_4:CreateSection()
            local base_1 = section_4:CreateSubSection("Loading Options")      
            

                base_1:CreateSlider('Slot Number', function(value)
                    getgenv().slot = value
                end, 1, 6, 1)


                skil = base_1:CreateToggle("Fast Load", false, function(state)
                    if state then
                        skipLoading = true
                    else
                        skipLoading = false
                    end
                    return skipLoading
                end, false, true, "Fast Load")



                base_1:CreateButton("Load Base", function()
                    local slot = getgenv().slot
                    LoadSlot(slot)
                end, true, true, 'Load Base')

            local base_2 = section_4:CreateSubSection("Permissions")

                base_2:CreateButton("Auto Whitelist", function()
                    AutoWhiteList()
                end, true, true, 'Auto Whitelist')

                base_2:CreateButton("Auto Blacklist", function()
                    AutoBlacklist()
                end, true, true, 'Auto Blacklist')

            local base_3 = section_4:CreateSubSection("Lad Options")

                base_3:CreateButton("Free Land", function()
                    FreeLand()
                end, true, true, 'Free Land')

                base_3:CreateButton("Max Land", function()
                    MaxLand()
                end, true, true, 'Max Land')

                base_3:CreateButton("Sell Land Sign", function()
                    SellSoldSign()
                end, true, true, 'Sell Land Sign')


    local page_5 = UI:CreateTab(00000000, '🚛 Vehicle')
        local section_5 = page_5:CreateSection()
            local car_1 = section_5:CreateSubSection("Vehicle Speed")   

                car_1:CreateSlider("Vehicle Speed", function(Val)
                    VehicleSpeed(Val)
                end, 1, 10, 1)

            local car_2 = section_5:CreateSubSection("Vehicle Flying")   

                car_2:CreateSlider("Fly Speed", function(Val)
                    iyflyspeed = Val
                    vehicleflyspeed = Val
                end, 1, 25, 10)

                car_2:CreateToggle("Vehicle Fly", false, function(v)
                    if v == true then
                        local player = game.Players.LocalPlayer
                        local humanoid = player.Character.Humanoid
                        if humanoid.Seated then
                        local CurrentSeat = player.Character.Humanoid.SeatPart
                            if CurrentSeat and CurrentSeat.Parent.Type.Value == "Vehicle" then
                        NOFLY()
                    wait()
                    sFLY(true)
                        end
                        end
                      else
                        NOFLY()
                      end
                end, false, true, "Vehicle Fly")

                car_2:CreateButton("Flip Vehicle", function()
                    FlipVehcile()
                end, true, true, 'Flip Vehicle')

    local page_6 = UI:CreateTab(00000000, '🔗 Dupe')
        local section_6 = page_6:CreateSection()
            local dupe_1 = section_6:CreateSubSection("Dupe Options")   

                dupe_1:CreateSlider("Slot Number", function(value)
                    slot = value
                end, 1, 6, 1)


                dupe_1:CreateToggle("Loop Dupe", false, function(Value)
                    Loop = Value
                end, false, true, "Loop Dupe")
                dfast = dupe_1:CreateButton("Dupe", function()
                    InvDupe(slot, Loop)
                    local value = true
                    return value 
                end, true, true, 'Dupe')

            local dupe_2 = section_6:CreateSubSection("Misc Options") 

                dupe_2:CreateButton("Drop All Axes", function()
                    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == "Tool" then
                            game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(v,"Drop tool",game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0,4,-4))
                            wait(0.50)
                        end
                        -- check if all axes are dropped

                    end
                end, true, true, 'Drop All')


                dupe_2:CreateButton("Count Inventory", function()
                    local count = count_backpack()
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Inventory Amount";
                        Text = "Count = "..count;
                        Duration = 5;
                    })
                end, true, true, 'Dupe All')

    local page_7 = UI:CreateTab(00000000, '🧰 Items')
        local section_7 = page_7:CreateSection()

            local item_0 = section_7:CreateSubSection("Waypoint")

            item_0:CreateButton("Set Waypoint", function()
                SetCords()
            end, true, true, 'Set Waypoint')

            item_0:CreateButton("Remove Waypoint", function()
                game.Workspace:FindFirstChild("jore"):Destroy()
            end, true, true, 'Remove Waypoint')


            

            local item_2 = section_7:CreateSubSection("Item Options")


                item_2:CreateToggle("Auto Deselect", false, function(Value)
                    _G.Autodeselect = Value
                end, false, true, "Auto Deselect")


                item_2:CreateToggle("Lasso Tool", false, function(Value)
                    _G.sssaaaaaaaaaa = Value
                    lassoTpcheck()
                end, false, true, "Lasso Tool")


                item_2:CreateToggle("Click Select", false, function(Value)
                    local ClickTp = Value
                    ClickToTP()
                end, false, true, "Click To Select")

                item_2:CreateButton("Teleport Items", function()
                    local SelectionNUM = 10
                    SelectionTp(SelectionNUM)
                end, true, true, 'Teleport Items')

                item_2:CreateButton("Deselct All", function()
                    for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
                        if v:FindFirstChild("Main") then
                            if v.Main:FindFirstChild("Selection") then
                            v.Main.Selection:Destroy()
                            end
                        end
                    end
                end, true, true, 'Deselct All')



            local wood_1 = section_7:CreateSubSection("Wood Options")

                wood_1:CreateToggle("Auto Deselect", false, function(Value)
                    _G.aftertpdeselect = Value
                end, false, true, "Auto Deselect")

                wood_1:CreateToggle("Lasso", false, function(Value)
                    _G.lassoTp = Value
                end, false, true, "Lasso")

                wood_1:CreateToggle("Click Select", false, function(Value)
                    WoodClickTp = Value
                    WOODClickToTP()
                end, false, true, "Click To Select")

                wood_1:CreateButton("Teleport Wood", function()
                    local WoodDirection = "Upwards"
                    local TpToWoodAfterFinished = false
                    WoodSelectionTp(WoodDirection, TpToWoodAfterFinished)
                end, true, true, 'Teleport Wood')

                wood_1:CreateButton("Deselct All", function()
                    for i,v in pairs(game.Workspace.PlayerModels:GetChildren()) do
                        if v:FindFirstChild("WoodSection") then
                            if v.WoodSection:FindFirstChild("Selection") then
                            v.WoodSection.Selection:Destroy()
                        end
                    end
                end
                end, true, true, 'Deselct All')

    local page_9 = UI:CreateTab(00000000, '🛒 AutoBuy')
        local section_9 = page_9:CreateSection()

            local item_0 = section_9:CreateSubSection("Waypoint")

            item_0:CreateButton("Set Waypoint", function()
                SetCords()
            end, true, true, 'Set Waypoint')

            item_0:CreateButton("Remove Waypoint", function()
                game.Workspace:FindFirstChild("jore"):Destroy()
            end, true, true, 'Remove Waypoint')
            local auto_1 = section_9:CreateSubSection("Autobuy Options")
            local ItemsCostLabel

            BuyListDropdown = auto_1:CreateDropDown(function(value)
                ItemToBuy = value
                if ItemsCostLabel then
                    ItemsCostLabel:UpdateText("Price - $"..tostring((GetPrice(ItemToBuy)) * AmountToBuy))
                    ItemsCostLabel:Refresh()
                end
            end, ItemList, 'Items', false)


            local AutobuyQuantitySlider = auto_1:CreateSlider("Quantity", function(value)
                AmountToBuy = value
                if ItemsCostLabel and ItemToBuy then
                    ItemsCostLabel:UpdateText("Price - $"..tostring((GetPrice(ItemToBuy)) * AmountToBuy)) 
                    ItemsCostLabel:Refresh()
                end    
            end, 1, 100, 1)

            AmountToBuy = 1

        local auto_2 = section_9:CreateSubSection("Purchase Items")

            ItemsCostLabel = auto_2:CreateLabel("Price - $0")

            auto_2:CreateButton("Purchase", function()
                if not CheckIfWPPlaced() then return end
    

                if ItemToBuy then               
                    CuttingTree = true
                    local OldCharacterPos = GetChar().Head.CFrame
                    BuyItem(ItemToBuy,AmountToBuy,GetWPLoc())
                    CuttingTree = false
                    IsStandingAPlank = false
                    GetChar():SetPrimaryPartCFrame(OldCharacterPos)
                else
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Error";
                        Text = "Please select an item to buy";
                        Duration = 5;
                    })
                end    
            
            end, true, true, 'Purchase')



    local SelectedTreeType;
    local page_8 = UI:CreateTab(00000000, '🌲 Wood')
        local section_8 = page_8:CreateSection()


        local wood_1 = section_8:CreateSubSection("Bring Tree")

           -- local wood_types = {"Generic","Oak","Cherry","Fir","Pine","Birch","Walnut","Koa","Volcano","Palm","Zombie","Gold","Palm","SnowGlow","Frost","Spooky","Sinister","CaveCrawler","Phantom"}
            local wood_types = {"Generic","Oak","Cherry","Fir","Pine","Birch","Walnut","Koa","Volcano","Palm","Zombie","Gold","Palm","SnowGlow","Frost","Spooky","Sinister","CaveCrawler","Phantom - NOT WORKING"}
            TreeTypeDropdown = wood_1:CreateDropDown(function(Output)
                if Output ~= "" then
                    if Output == "Gold" then
                        SelectedTreeType = "GoldSwampy"
                    elseif Output == "Zombie" then
                        SelectedTreeType = "GreenSwampy"
                    elseif Output == "Phantom" then
                        SelectedTreeType = "LoneCave"
                    elseif Output == "Sinister" then
                        SelectedTreeType = "SpookyGlow" 
                        
                    else    
                        SelectedTreeType = Output
                    end
                    end
            end, wood_types, 'Tree Types', false)

            local SelectedTreeTypeQuantity;

            local TreeTypeQuantitySlider = wood_1:CreateSlider("Quantity", function(value)
                SelectedTreeTypeQuantity = value
            end, 1, 25, 1)

            SelectedTreeTypeQuantity = 1







        local LastTool;
        --local wood_2 = section_8:CreateSubSection("Get Tree")

        wood_1:CreateButton("Bring Tree(s)", function()
                if not CheckIfWPPlaced() then return end
    
                if CuttingTree then
                    Notify("Void 3.0","You are already cutting/selling a tree",10)
                    return 
                end    
                
                local Axe
                
                GetChar().Humanoid:UnequipTools()
                
                if not Player.Backpack:FindFirstChild("Tool") then
                    Notify("Void 3.0","You do not have any axes",10)
                    return 
                end
                
                for _,v in pairs(Player.Backpack:GetChildren()) do
                    if v.Name ~= "BlueprintTool" then
                        
                        local AxeName = string.gsub(v.ToolTip," ","_")
                        local BestAxeToolTip = GetBestAxeForTreeClass(AxeName,SelectedTreeType,true)
                        
                        if BestAxeToolTip then
                            Axe = v
                        end    
                    end    
                end    
                
                if SelectedTreeType == "LoneCave" and not Axe then
                    Notify("Void 3.0","You do not have the correct Axe for this Tree",10)
                    return 
                elseif not Axe then
                    
                    local BackpackTable = {}
                    
                    for _,v in pairs(Player.Backpack:GetChildren()) do
                        if v.Name ~= "BlueprintTool" then
                            table.insert(BackpackTable, v.ToolTip)
                        end    
                    end
                    
                    if table.find(BackpackTable,"The Many Axe") then
                        for _,v in pairs(Player.Backpack:GetChildren()) do
                            if Axe then break end
                            if v.ToolTip == "The Many Axe" then
                                Axe = v
                                break
                            end    
                        end    
                    elseif table.find(BackpackTable,"End Times Axe") then
                        for _,v in pairs(Player.Backpack:GetChildren()) do
                            if Axe then break end
                            if v.ToolTip == "End Times Axe" then
                                Axe = v
                                break
                            end    
                        end
                    else    
                        Axe = Player.Backpack:FindFirstChild("Tool")
                    end
                end    
                
                LastTool = Axe
            
                local OldCharacterPos = GetWPLoc()
                
                if SelectedTreeType ~= "LoneCave" then
                    local KeepGettingTree = false
                    for i = 1,SelectedTreeTypeQuantity do
                        if CancelCutting then break end
                        
                        if FindTreeOfClass(SelectedTreeType) == false then Notify("Void 3.0","Tree type not found",10)  break end
                        
                        CuttingTree = true
                        CutTree(FindTreeOfClass(SelectedTreeType),Axe,{1,0.3})
                        
                        if CancelCutting then CuttingTree = false break end
            
                        BringObject(GetLooseTree(), OldCharacterPos, {true, false})
                        CuttingTree = false
                    end
                    SetPrimaryPos(OldCharacterPos + Vector3.new(0,3,6))
                else
                    CuttingTree = true
                    Notify("Void 3.0","Please wait",10)
                    CutAndBringLoneCaveTree()
                    CuttingTree = false
                    Player.CharacterAdded:Wait()
                    repeat task.wait() until Player.Character:FindFirstChild("Humanoid")
                    repeat task.wait() until Player.Character:FindFirstChild("HumanoidRootPart")
                    wait(0.5)
                    Player.Character:SetPrimaryPartCFrame(OldCharacterPos)
                end
                
                wait()
                
                local CancelCutting = false
            end, true, true, 'Cut Wood')
        local wood_4 = section_8:CreateSubSection("Plank Actions")

            wood_4:CreateButton("Stand Plank", function()
                if IsStandingAPlank then Notify("Void 3.0","You are busy",10) return end
                if CuttingTree then Notify("Void 3.0","You are busy",10) return end
                
                    IsStandingAPlank = true
                    Notify("Void 3.0","Click on a Plank to stand it up\nClick anywhere else to cancel",10)
                    local ClickDetection
                    
                    SetOldCharacterPos()
            
                    ClickDetection = Mouse.Button1Down:Connect(function()
                        
                        local MouseTarget = Mouse.Target
                        
                        if MouseTarget.Name == "WoodSection" and MouseTarget.Parent.Name == "Plank" then
                            if MouseTarget.Parent:FindFirstChild("Owner") ~= nil and MouseTarget.Parent.Owner.Value == Player then
                                if MouseTarget.Parent.Parent == workspace.PlayerModels then
                                    
                                    BringObject(MouseTarget.Parent, CFrame.new(MouseTarget.Position + Vector3.new(0,MouseTarget.Size.Y/2,0)) * CFrame.Angles(0,0,0), {true, true})
                    
                                    ClickDetection:Disconnect()
                                    Notify("Void 3.0","Plank Stand Complete",10)
                                end
                            end
                        else
                            ClickDetection:Disconnect()
                            Notify("Void 3.0","Plank Stand Cancelled",10) 
                        end    
                    end)
                    IsStandingAPlank = false
            end, true, true, 'Stand Plank')


            wood_4:CreateButton("1x1 Cut Plank", function()
                IsStandingAPlank = true
                Notify("Void 3.0","Click on a Plank to cut it into 1 units\nClick anywhere else to cancel",10)
                local ClickDetection
                
                local Axe
                local Axes = {}
                
                GetChar().Humanoid:UnequipTools()
                
                if not Player.Backpack:FindFirstChild("Tool") then
                    Notify("Void 3.0","You do not have any axes",10)
                    return 
                end
                
                for _,v in pairs(Player.Backpack:GetChildren()) do
                    if v.Name ~= "BlueprintTool" then
                        table.insert(Axes,v.ToolTip)    
                    end    
                end
                
                if table.find(Axes, "The Many Axe") then
                    for _,v in pairs(Player.Backpack:GetChildren()) do
                        if v.ToolTip == "The Many Axe" then
                            Axe = v
                        end
                    end
                end    
                
                if not Axe then
                    if table.find(Axes, "End Times Axe") then
                        for _,v in pairs(Player.Backpack:GetChildren()) do
                            if v.ToolTip == "End Times Axe" then
                                Axe = v
                            end
                        end
                    end 
                end
                
                if not Axe then
                    Axe = Axes[1] 
                end
                
                local AxeName = string.gsub(Axe.ToolTip," ","_")
                local AxeInfo = GetBestAxeForTreeClass(AxeName, "Generic")
                
                if AxeInfo[2] == "Default" then
                    AxeInfo[2] = AxeIndex[AxeName].Cooldown
                end 
        
                SetOldCharacterPos()
        
                ClickDetection = Mouse.Button1Down:Connect(function()
                    
                    local MouseTarget = Mouse.Target
                    
                    if MouseTarget.Name == "WoodSection" and MouseTarget.Parent.Name == "Plank" then
                        if MouseTarget.Parent:FindFirstChild("Owner") ~= nil and MouseTarget.Parent.Owner.Value == Player then
                            if MouseTarget.Parent.Parent == workspace.PlayerModels then
                                
                                ClickDetection:Disconnect()
                                
                                local CutEvent
                                local Wood
                                local NewPlankAdded = false
                                
                                CutEvent = MouseTarget.Parent.CutEvent
                                Wood = MouseTarget
                                
                                local CutAmount = math.floor(Wood.Size.Y,-0.5)
                                
                                for i = 1,CutAmount,1 do
                                    if CancelCutting then break end
                                    
                                    local NewPlankDetection
                                    task.spawn(function()
                                        NewPlankDetection = workspace.PlayerModels.ChildAdded:Connect(function(Child)
                                            
        
                                            if Child.Name == "Plank" then
        
                                                repeat task.wait() if not Child:FindFirstChild("WoodSection") then return end until Child:FindFirstChild("WoodSection") or CancelActions
        
                                                if Child:FindFirstChild("Owner") then
                                                    if Child.Owner.Value == Player then
                                                        if Child:FindFirstChild("WoodSection") and Child:FindFirstChild("CutEvent") then
                                                            Wood = Child.WoodSection
                                                            CutEvent = Child.CutEvent
                                                            
                                                            NewPlankAdded = true
                                                            
                                                            NewPlankDetection:Disconnect()
                                                        end
                                                    end
                                                end
                                            end
                                        end)    
                                    end)
                                    
                                    
                                    
                                    if (GetChar().HumanoidRootPart.Position - Wood.Position).Magnitude > 17 then
                                        GetChar().HumanoidRootPart.Anchored = true
                                        GetChar():SetPrimaryPartCFrame(Wood.CFrame * CFrame.new(3,-Wood.Size.Y/2,0))
                                    end
                                    
                                    repeat task.wait(AxeInfo[2] + 0.05)
                                        if (GetChar().HumanoidRootPart.Position - Wood.Position).Magnitude > 17 then
                                            GetChar().HumanoidRootPart.Anchored = true
                                            GetChar():SetPrimaryPartCFrame(Wood.CFrame * CFrame.new(3,-Wood.Size.Y/2,0))
                                        end
                                        
                                        local args = {
                                        [1] = CutEvent,
                                        [2] = {
                                            ["tool"] = Axe,
                                            ["faceVector"] = Vector3.new(-0, -0, -1),
                                            ["height"] = 1,
                                            ["sectionId"] = 1,
                                            ["hitPoints"] = AxeInfo[1],
                                            ["cooldown"] = AxeInfo[2],
                                            ["cuttingClass"] = "Axe"
                                        }
                                        }
                                        
                                        game:GetService("ReplicatedStorage").Interaction.RemoteProxy:FireServer(unpack(args))    
        
                                    until NewPlankAdded or CancelActions
                                NewPlankAdded = false
          
                            end
        
                                local CancelCutting = false
                                IsStandingAPlank = false
                                GetChar().HumanoidRootPart.Anchored = false
                                Notify("Void 3.0","Unit Cutter Complete",10)
                            end
                        end
                    else
                        ClickDetection:Disconnect()
                        Notify("Void 3.0","Unit Cutter Cancelled",10) 
                    end    
                end)
                IsStandingAPlank = false
            end, true, true, 'Cut Plank')

            wood_4:CreateButton("Bring Spesific Plank(s)", function()
                if not CheckIfWPPlaced() then return end
    
                if IsStandingAPlank then Notify("Void 3.0","You are busy",10) return end
                if CuttingTree then Notify("Void 3.0","You are busy",10) return end
                
                CuttingTree = true
                
                local OldCharacterPos = GetWPLoc()
            
                for _,v in pairs(workspace.PlayerModels:GetChildren()) do
                    if v.Name == "Plank" then
                        if v:FindFirstChild("Owner") ~= nil and v.Owner.Value == Player then
                            if v:FindFirstChild("TreeClass") ~= nil and v.TreeClass.Value == SelectedTreeType then
                                if CancelActions then break end
                                BringObject(v, OldCharacterPos,{true, false})
                            end
                        end     
                    end    
                end
                
                GetChar():SetPrimaryPartCFrame(OldCharacterPos)
                
                CuttingTree = false
                CancelActions = false 
            end, true, true, 'Bring Plank(s)')

            wood_4:CreateButton("Bring All Planks", function()
                if not CheckIfWPPlaced() then return end
    
                if IsStandingAPlank then Notify("Void 3.0","You are busy",10) return end
                if CuttingTree then Notify("Void 3.0","You are busy",10) return end
                
                CuttingTree = true
                
                local OldCharacterPos = GetChar().Head.CFrame
            
                for _,v in pairs(workspace.PlayerModels:GetChildren()) do
                    if v.Name == "Plank" then
                        if v:FindFirstChild("Owner") ~= nil and v.Owner.Value == Player then
                            if CancelActions then break end
                            BringObject(v, OldCharacterPos,{true, false})
                        end     
                    end    
                end
                
                GetChar():SetPrimaryPartCFrame(OldCharacterPos)
                
                CuttingTree = false
                CancelActions = false 
            end, true, true, 'Bring All Planks')




        local wood_6 = section_8:CreateSubSection("Log Actions")


            wood_6:CreateButton("Sell Log(s)", function()
                task.spawn(function()
                    if CuttingTree then Notify("Void 3.0","You are busy",10) return end
                    if not FindOwnedTreeInLogModels() then Notify("Void 3.0","You do not own any logs",10) return end
                    
                    CuttingTree = true
                    
                    Notify("Void 3.0","Please wait",10)
                    local OldCharacterPos = SetOldCharacterPos()
                
                    for _,v in pairs(workspace.LogModels:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("Owner") then
                            if v.Owner.Value == Player then
                                if v.TreeClass.Value == SelectedTreeType then
                                    if CancelActions then return end
                                
                                    SellTree(v)
                                    wait(0.25)
                                end
                            end    
                        end    
                    end    
                
                    local CuttingTree = false
                    local CancelSelling = false
                    Notify("Void 3.0","Selling completed",10)
                    
                    for i = 1,15 do
                        task.wait()
                        SetPrimaryPos(OldCharacterPos)
                        GetChar().HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                        GetChar().HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
                    end    
                        
                end)
                local CuttingTree = false
                local CancelSelling = false
                CuttingTree = false
                CancelSelling = false
            end, true, true, 'Sell Logs')

            wood_6:CreateButton("Bring Specific Log(s)",function()
                if not CheckIfWPPlaced() then return end
    
                if IsStandingAPlank then Notify("Legacy 1.5","You are busy",10) return end
                if CuttingTree then Notify("Legacy 1.5","You are busy",10) return end
                
                CuttingTree = true
                local OldCharacterPos = GetWPLoc()
                
                for _,v in pairs(workspace.LogModels:GetChildren()) do
                    if v:IsA("Model") then
                        if v:FindFirstChild("Owner") ~= nil and v.Owner.Value == Player then
                            if v:FindFirstChild("TreeClass") ~= nil and v.TreeClass.Value == SelectedTreeType then
                                if CancelActions then break end
                                BringObject(v, OldCharacterPos,{true, false})
                            end
                        end     
                    end    
                end
                
                GetChar():SetPrimaryPartCFrame(OldCharacterPos)
                
                CuttingTree = false
                CancelActions = false 
            end, true, true, 'Bring Log(s)')



            wood_6:CreateButton("Bring All Logs", function()
    
                if not CheckIfWPPlaced() then return end
    
    
                if IsStandingAPlank then Notify("Legacy 1.5","You are busy",10) return end
                if CuttingTree then Notify("Legacy 1.5","You are busy",10) return end
                
                CuttingTree = true
                local OldCharacterPos = GetWPLoc()
                
                for _,v in pairs(workspace.LogModels:GetChildren()) do
                    if v:IsA("Model") then
                        if v:FindFirstChild("Owner") ~= nil and v.Owner.Value == Player then
                            if CancelActions then break end
                            BringObject(v, OldCharacterPos,{true, false})
                        end     
                    end    
                end
                
                GetChar():SetPrimaryPartCFrame(OldCharacterPos)
                
                CuttingTree = false
                CancelActions = false 
            end, true, true, 'Bring All Logs')
            
        local wood_3 = section_8:CreateSubSection("Blueprint Actions")
        

        local OnlyUse1x1x1Parts = nil;
        local AutoFillBluePrints = nil;


        wood_3:CreateToggle("Only Use 1x1 Parts", false,function(state)
            OnlyUse1x1x1Parts = state
        end,false,true,'Only Use 1x1 Parts')






            local FillBlueprintButton = wood_3:CreateButton("Fill Blueprint", function()
   
                IsStandingAPlank = true
                Notify("Void 3.0","Click on a Blueprint to fill it\nClick anywhere else to cancel",10)
                local ClickDetection
                
                SetOldCharacterPos()
        
                ClickDetection = Mouse.Button1Down:Connect(function()
                    
                    local MouseTarget = Mouse.Target
                    
                    if MouseTarget.Parent:FindFirstChild("Type") then
                        if MouseTarget.Parent:FindFirstChild("Type").Value == "Blueprint" then
                            if MouseTarget.Parent:FindFirstChild("Owner") ~= nil and MouseTarget.Parent.Owner.Value == Player then
                                if MouseTarget.Parent.Parent == workspace.PlayerModels then
                                    
                                    local WoodToUse
                                    local BlueprintPart = MouseTarget.Parent:FindFirstChild("BuildDependentWood")
                                    
                                    if not OnlyUse1x1x1Parts then
                                        for _,v in pairs(workspace.PlayerModels:GetChildren()) do
                                            if v.Name == "Plank" and v:FindFirstChild("Owner") then
                                                if v.Owner.Value == Player then
                                                    if v:FindFirstChild("WoodSection") then
                                                        if v.TreeClass.Value == SelectedTreeType then
                                                            if not WoodToUse then
                                                                WoodToUse = v
                                                            end
                                                        end
                                                    end    
                                                end    
                                            end    
                                        end    
                                    else
                                        for _,v in pairs(workspace.PlayerModels:GetChildren()) do
                                            if v.Name == "Plank" and v:FindFirstChild("Owner") then
                                                if v.Owner.Value == Player then
                                                    if v:FindFirstChild("WoodSection") then
                                                        if v.WoodSection.Size.X == 1 and v.WoodSection.Size.Y == 1 and v.WoodSection.Size.Z == 1 then
                                                            if v.TreeClass.Value == SelectedTreeType then
                                                                if not WoodToUse then
                                                                    WoodToUse = v
                                                                end
                                                            end
                                                        end
                                                    end    
                                                end    
                                            end    
                                        end
                                    end  
                                    
                                    ClickDetection:Disconnect()
                                    
                                    if WoodToUse then
                                        Notify("Void 3.0","Filling Blueprint",5)
                                        BringObject(WoodToUse, BlueprintPart.CFrame, {true, true})
                                        Notify("Void 3.0","Blueprint Fill Complete",10)
                                        task.spawn(function()
                                            if WoodToUse then
                                                if WoodToUse:FindFirstChild("WoodSection") then
                                                    WoodToUse.WoodSection.Anchored = true 
                                                end    
                                            end 
                                            wait(3)
                                            if WoodToUse then
                                                if WoodToUse:FindFirstChild("WoodSection") then
                                                    WoodToUse.WoodSection.Anchored = false 
                                                end    
                                            end    
                                        end)    
                                    else
                                        Notify("Void 3.0","Wood Type not found",10) 
                                    end    
                                    
                                    local IsStandingAPlank = false
                                end
                            else
                                ClickDetection:Disconnect()
                                Notify("Void 3.0","Blueprint Fill Cancelled",10)
                                local IsStandingAPlank = false
                            end    
                        else
                            ClickDetection:Disconnect()
                            Notify("Void 3.0","Blueprint Fill Cancelled",10)
                            local IsStandingAPlank = false
                        end    
                    else
                        ClickDetection:Disconnect()
                        Notify("Void 3.0","Blueprint Fill Cancelled",10) 
                        local IsStandingAPlank = false
                    end    
                end)
                local IsStandingAPlank = false
            end, true, true, 'Fill Blueprint')
            
loadstring(game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Velocity/main/Shift-Sprint.lua", true))()
warn('Loaded Void 3.0 In '..tostring(os.time()-Start)..' Second/s');
