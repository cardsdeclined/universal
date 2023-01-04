shared.BeachwaveVersion = "7/6/2022"

local MoveMouse = mousemoverel
local ReadFile = readfile
local WriteFile = writefile
local IsFile = isfile
local IsFolder = isfolder
local MakeFolder = makefolder
local ListFiles = listfiles
local GlobalEnvironment = getgenv

if GlobalEnvironment().beachwave then
    GlobalEnvironment().beachwave.Unload()
end

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Teams = game:GetService("Teams")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Repository = "https://raw.githubusercontent.com/coastss/universal/main/"
local BaseTweenInfo = TweenInfo.new(0.75, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

--// Loader
local function CreateObject(Object, Properties)
    local NewObject = Instance.new(Object)

    for Property, Value in pairs(Properties) do
        NewObject[Property] = Value
    end

    return NewObject
end

local function WaitForTweenToEnd(Tween)
    Tween:Play()
    Tween.Completed:Wait()
end

local UI = CreateObject("ScreenGui", {
	Name = "Loader",
	DisplayOrder = 1,
	ZIndexBehavior = Enum.ZIndexBehavior.Global,
})

if syn.protect_gui then
	syn.protect_gui(UI)
elseif get_hidden_gui then
	get_hidden_gui(UI)
end

if gethui then
	UI.Parent = gethui()
else
	UI.Parent = CoreGui
end

local Holder = CreateObject("Frame", {
	Name = "Holder",
	Parent = UI,
	BackgroundColor3 = Color3.fromRGB(33, 33, 33),
	BorderSizePixel = 0,
	Position = UDim2.new(0.5, 0, 0.5, 0),
	Size = UDim2.new(0, 0, 0, 0)
})

local UICorner = CreateObject("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Holder
})

local Dots = CreateObject("Folder", {
	Name = "Dots",
	Parent = Holder
})

local Dot1 = CreateObject("ImageLabel", {
	Name = "Dot1",
	Parent = Dots,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.5, -29, 0.5, -50),
	Size = UDim2.new(0, 18, 0, 100),
	ZIndex = 2,
	Image = "rbxassetid://10139590085",
	ScaleType = Enum.ScaleType.Crop,
	ImageTransparency = 1
})

local Dot2 = CreateObject("ImageLabel", {
	Name = "Dot2",
	Parent = Dots,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.5, -9, 0.5, -50),
	Size = UDim2.new(0, 18, 0, 100),
	ZIndex = 2,
	Image = "rbxassetid://10139590085",
	ScaleType = Enum.ScaleType.Crop,
	ImageTransparency = 1
})

local Dot3 = CreateObject("ImageLabel", {
	Name = "Dot3",
	Parent = Dots,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.5, 11, 0.5, -50),
	Size = UDim2.new(0, 18, 0, 100),
	ZIndex = 2,
	Image = "rbxassetid://10139590085",
	ScaleType = Enum.ScaleType.Crop,
	ImageTransparency = 1
})

local Status = CreateObject("TextLabel", {
	Name = "Status",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.5, -100, 0.5, -14),
	Size = UDim2.new(0, 200, 0, 28),
	Font = Enum.Font.Oswald,
	Text = "beachwave | by: coasts",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 28,
	TextStrokeTransparency = 0.8999999761581421,
	TextTransparency = 1
})

local Border = CreateObject("Frame", {
	Name = "Border",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Position = UDim2.new(0, -1, 0, -1),
	Size = UDim2.new(1, 2, 1, 2),
	ZIndex = 0
})

local BorderUICorner = CreateObject("UICorner", {
	CornerRadius = UDim.new(0, 6),
	Parent = Border
})

local BorderUIGradient = CreateObject("UIGradient", {
	Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 75, 75)), ColorSequenceKeypoint.new(0.25, Color3.fromRGB(238, 92, 192)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(171, 105, 202)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(120, 118, 252)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(116, 168, 246))},
	Parent = Border
})

TweenService:Create(Holder, BaseTweenInfo, {Position = UDim2.new(0.5, -112, 0.5, -50), Size = UDim2.new(0, 225, 0, 100)}):Play()
WaitForTweenToEnd(TweenService:Create(UICorner, BaseTweenInfo, {CornerRadius = UDim.new(0, 6)}))

spawn(function()
	while task.wait(0.5) do
		if Dot1.ImageColor3 == Color3.fromRGB(255, 255, 255) then
			WaitForTweenToEnd(TweenService:Create(Dot1, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -29, 0.5, -60), ImageTransparency = 0}))
			WaitForTweenToEnd(TweenService:Create(Dot1, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -29, 0.5, -50)}))
		end

		if Dot2.ImageColor3 == Color3.fromRGB(255, 255, 255) then
			WaitForTweenToEnd(TweenService:Create(Dot2, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -9, 0.5, -60), ImageTransparency = 0}))
			WaitForTweenToEnd(TweenService:Create(Dot2, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -9, 0.5, -50)}))
		end

		if Dot3.ImageColor3 == Color3.fromRGB(255, 255, 255) then
			WaitForTweenToEnd(TweenService:Create(Dot3, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 11, 0.5, -60), ImageTransparency = 0}))
			WaitForTweenToEnd(TweenService:Create(Dot3, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 11, 0.5, -50)}))
		else
			break
		end
	end
end)

spawn(function()
	while task.wait() do
        if not UI then break end
		BorderUIGradient.Rotation += (1 % 360)
	end
end)

WaitForTweenToEnd(TweenService:Create(Border, BaseTweenInfo, {BackgroundTransparency = 0}))
task.wait(2)

function shared:Kick(String)
    LocalPlayer:Kick("[beachwave]: " .. String)
    return
end

function shared:SetStatus()
end

local function LoadFile(File)
    shared:SetStatus("Loading " .. File .. "...")

    local Source
    local Success, Error = pcall(function() Source = game:HttpGet(Repository .. File) end)
    
    if Source and Success then
        return loadstring(Source)()
    end
    
    return Source, true
end

local function WaitForTweenToEnd(Tween)
	Tween:Play()
	Tween.Completed:Wait()
end

local function CreateObject(Type, Properties)
	local Object = Instance.new(Type)

	for Name, Value in pairs(Properties) do
		Object[Name] = Value
	end

	return Object
end

local Games = {
    [1954906532] = "games/riotfall.lua", --// RIOTFALL
    [111958650] = "games/arsenal.lua", --// Arsenal
    [113491250] = "games/phantom_forces.lua", --// Phantom Forces
}

if not getgenv().Library then
    getgenv().Library = LoadFile("utilities/ui_library.lua")
end

Library.flags["Settings Config File"] = ""
Library.flags["Aimbot Active"] = false
 
local CIELUVInterpolator = LoadFile("utilities/cieluv_interpolator.lua")

local HealthbarLerp = CIELUVInterpolator:Lerp(Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0))
Library.flags["Aimbot Active"] = false

local DrawingProperties = {
    Line = {
        Thickness = 1.5,
        Color = Color3.fromRGB(255, 255, 255),
        Visible = false
    },
    Text = {
        Size = 16,
        Center = true,
        Outline = true,
        Color = Color3.fromRGB(255, 255, 255),
        Visible = false
    },
    Circle = {
        Thickness = 1.5,
        NumSides = 100,
        Radius = 0,
        Filled = false,
        Color = Color3.fromRGB(255, 255, 255),
        Visible = false
    },
    Square = {
        Thickness = 1.5,
        Filled = false,
        Color = Color3.fromRGB(255, 255, 255),
        Visible = false
    },
    Image = {
        Rounding = 0,
        Visible = false
    }
}

local Visuals = {Players = {}} do
    function Visuals:Round(Number, Bracket)
        Bracket = (Bracket or 1)

        if typeof(Number) == "Vector2" then
            return Vector2.new(Visuals:Round(Number.X), Visuals:Round(Number.Y))
        else
            return (Number - Number % (Bracket or 1))
        end
    end

    function Visuals:GetScreenPosition(Position)
        local Position, Visible = Workspace.CurrentCamera:WorldToViewportPoint(Position)
        local FullPosition = Position
        Position = Vector2.new(Position.X, Position.Y)

        return Position, Visible, FullPosition
    end

    function Visuals:CreateDrawing(Type, Custom)
        local Drawing = Drawing.new(Type)

        for Property, Value in pairs(DrawingProperties[Type]) do
            Drawing[Property] = Value
        end

        if Custom then
            for Property, Value in pairs(Custom) do
                Drawing[Property] = Value
            end
        end

        return Drawing
    end

    function Visuals.AddPlayer(Player)
        if not Visuals.Players[Player] then
            Visuals.Players[Player] = {
                Box = {
                    Outline = Visuals:CreateDrawing("Square", {Color = Color3.fromRGB(0, 0, 0)}),
                    Main = Visuals:CreateDrawing("Square")
                    --// Main = Visuals:CreateDrawing("Image", {Data = game:HttpGet("https://coasts.cool/uploads/48ny7FCjZ9iCmbAwirI.png")})

                },
                Healthbar = {
                    Outline = Visuals:CreateDrawing("Square", {Filled = true, Color = Color3.fromRGB(0, 0, 0)}),
                    Main = Visuals:CreateDrawing("Square", {Filled = true, Color = Color3.fromRGB(0, 255, 0)})
                },
                Info = {
                    Main = Visuals:CreateDrawing("Text"),
                    Extra = Visuals:CreateDrawing("Text")
                }
            }
        end
    end

    function Visuals.RemovePlayer(Player)
        if Visuals.Players[Player] then
            for Index, Table in pairs(Visuals.Players[Player]) do
                for Index2, Drawing in pairs(Table) do
                    if Drawing.Remove then
                        Drawing:Remove()
                    end
                end
            end

            Visuals.Players[Player] = nil
        end
    end
end

local PlayerUtilities = {} do
    function PlayerUtilities:IsPlayerAlive(Player)
        local Character = Player.Character
        local Humanoid = (Character and Character:FindFirstChildWhichIsA("Humanoid"))

        if Character and Humanoid then
            if Humanoid.Health > 0 then
                return true
            end
        end

        return false
    end

    function PlayerUtilities:GetHealth(Player)
        local Character = Player.Character
        local Humanoid = (Character and Character:FindFirstChildWhichIsA("Humanoid"))

        if Character and Humanoid then
            return {
                CurrentHealth = Humanoid.Health,
                MaxHealth = Humanoid.MaxHealth
            }
        end
    end

    function PlayerUtilities:GetBodyParts(Player)
        local Character = Player.Character
        local Head = (Character and Character:FindFirstChild("Head"))
        local Root = (Character and Character:FindFirstChild("HumanoidRootPart"))
        local Torso = Character and (Character:FindFirstChild("LowerTorso") or Character:FindFirstChild("Torso"))
        local LeftArm = Character and (Character:FindFirstChild("LeftLowerArm") or Character:FindFirstChild("Left Arm"))
        local RightArm = Character and (Character:FindFirstChild("RightLowerArm") or Character:FindFirstChild("Right Arm"))
        local LeftLeg = Character and (Character:FindFirstChild("LeftLowerLeg") or Character:FindFirstChild("Left Leg"))
        local RightLeg = Character and (Character:FindFirstChild("RightLowerLeg") or Character:FindFirstChild("Right Leg"))

        if Character and (Head and Root and Torso and LeftArm and RightArm and LeftLeg and RightLeg) then
            return {
                Character = Character,
                Head = Head,
                Root = Root,
                Torso = Torso,
                LeftArm = LeftArm,
                RightArm = RightArm,
                LeftLeg = LeftLeg,
                RightLeg = RightLeg
            }
        end
    end

    function PlayerUtilities:GetTeamColor(Player)
        return Player.TeamColor.Color
    end

    function PlayerUtilities:IsOnClientTeam(Player)
        if LocalPlayer.Team == Player.Team then
            return true
        end

        return false
    end

    function PlayerUtilities:GetDistanceFromClient(Position)
        return LocalPlayer:DistanceFromCharacter(Position)
    end

    function PlayerUtilities:GetClosestPlayer()
        local ClosestPlayer = nil
        local FarthestDistance = math.huge

        for Index, Player in pairs(Players:GetPlayers()) do
            if Player == LocalPlayer then continue end
        
            local PassedTeamCheck = true
            local IsPlayerAlive = PlayerUtilities:IsPlayerAlive(Player)
            local Health = PlayerUtilities:GetHealth(Player)
            local BodyParts = PlayerUtilities:GetBodyParts(Player)
            local IsOnClientTeam = PlayerUtilities:IsOnClientTeam(Player)
        
            if Library.flags["Aimbot Team Check"] and IsOnClientTeam then
                PassedTeamCheck = false
            end
        
            if IsPlayerAlive and Health and BodyParts and PassedTeamCheck then
                local ScreenPosition, OnScreen = Visuals:GetScreenPosition(BodyParts.Root.Position)

                if ScreenPosition and OnScreen then
                    local MouseDistance = (ScreenPosition - UserInputService:GetMouseLocation()).Magnitude

                    if MouseDistance < FarthestDistance then
                        if Library.flags["Aimbot Use FOV"] then
                            if MouseDistance <= Library.flags["Aimbot FOV Radius"] then
                                FarthestDistance = MouseDistance
                                ClosestPlayer = {
                                    Player = Player,
                                    BodyParts = BodyParts
                                }
                            end
                        else
                            FarthestDistance = MouseDistance
                            ClosestPlayer = {
                                Player = Player,
                                BodyParts = BodyParts
                            }
                        end
                    end
                end
            end
        end

        return ClosestPlayer
    end

    function PlayerUtilities:AimAt(Position, Smoothing)
        local MouseLocation = UserInputService:GetMouseLocation()
        MoveMouse(((Position.X - MouseLocation.X) / Smoothing), ((Position.Y - MouseLocation.Y) / Smoothing))
    end
end

if Games[game.GameId] then
    local CustomGameFunctions = LoadFile(Games[game.GameId])

    if CustomGameFunctions then
        for Index, Value in pairs(CustomGameFunctions) do
            PlayerUtilities[Index] = Value
        end
    else
        shared:Kick("Failed to replace normal functions with custom ones on file: " .. Games[game.GameId])
    end

end

local FOVCircle = Visuals:CreateDrawing("Circle")
for Index, Player in pairs(Players:GetPlayers()) do
    if Player == LocalPlayer then continue end
    Visuals.AddPlayer(Player)
end

local PlayerAddedEvent = Players.PlayerAdded:Connect(Visuals.AddPlayer)
local PlayerRemovingEvent = Players.PlayerRemoving:Connect(Visuals.RemovePlayer)
local LoopId = HttpService:GenerateGUID(false)
RunService:BindToRenderStep(LoopId, 1, function()
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Color = Library.flags["Aimbot FOV Color"]
    FOVCircle.Visible = ((Library.flags["Aimbot Enabled"] and Library.flags["Aimbot Use FOV"]) and true) or false
    
    if Library.flags["Aimbot FOV Type"] == "Static" then
        FOVCircle.Radius = Library.flags["Aimbot FOV Radius"]
    elseif Library.flags["Aimbot FOV Type"] == "Dynamic" then
        FOVCircle.Radius = (Library.flags["Aimbot FOV Radius"] + workspace.CurrentCamera.FieldOfView)
    elseif Library.flags["Aimbot FOV Type"] == "Dynamic Reversed" then
        FOVCircle.Radius = (Library.flags["Aimbot FOV Radius"] - workspace.CurrentCamera.FieldOfView)
    end

    if Library.flags["Aimbot Enabled"] and Library.flags["Aimbot Active"] then
        local ClosestPlayer = PlayerUtilities:GetClosestPlayer()

        if ClosestPlayer and (ClosestPlayer.Player and ClosestPlayer.BodyParts) then
            local ScreenPosition, OnScreen = Visuals:GetScreenPosition(ClosestPlayer.BodyParts.Head.Position)

            if ScreenPosition and OnScreen then
                PlayerUtilities:AimAt(ScreenPosition, Library.flags["Aimbot Smoothing"])
            end
        end
    end

    for Index, Player in pairs(Players:GetPlayers()) do
        if Player == LocalPlayer then continue end

        local Objects = Visuals.Players[Player]
        if not Objects then continue end

        local OnScreen, PassedTeamCheck = false, true
        local IsPlayerAlive = PlayerUtilities:IsPlayerAlive(Player)
        local Health = PlayerUtilities:GetHealth(Player)
        local BodyParts = PlayerUtilities:GetBodyParts(Player)
        local PlayerColor = (PlayerUtilities:IsOnClientTeam(Player) and Library.flags["Visuals Ally Color"]) or Library.flags["Visuals Enemy Color"]
        local IsOnClientTeam = PlayerUtilities:IsOnClientTeam(Player)

        if Library.flags["Visuals Use Team Color"] then
            PlayerColor = PlayerUtilities:GetTeamColor(Player)
        end

        if Library.flags["Visuals Team Check"] and IsOnClientTeam then
            PassedTeamCheck = false
        end

        if IsPlayerAlive and Health and BodyParts and PlayerColor and PassedTeamCheck then
            local HealthPercent = (Health.CurrentHealth / Health.MaxHealth)
            local Distance = PlayerUtilities:GetDistanceFromClient(BodyParts.Root.Position)
            ScreenPosition, OnScreen = Visuals:GetScreenPosition(BodyParts.Root.Position)

            local Orientation, Size = BodyParts.Character:GetBoundingBox()
            local Height = (Workspace.CurrentCamera.CFrame - Workspace.CurrentCamera.CFrame.Position) * Vector3.new(0, (math.clamp(Size.Y, 1, 10) + 0.5) / 2, 0)
            Height = math.abs(Workspace.CurrentCamera:WorldToScreenPoint(Orientation.Position + Height).Y - Workspace.CurrentCamera:WorldToScreenPoint(Orientation.Position - Height).Y)
            Size = Visuals:Round(Vector2.new((Height / 2), Height))

            local NameString = string.format("%s", Player.Name)

            if Player.DisplayName ~= Player.Name then
                NameString = string.format("%s | @%s", Player.Name, Player.DisplayName)
            end

            Objects.Box.Main.Color = PlayerColor
            Objects.Box.Main.Size = Size
            Objects.Box.Main.Position = Visuals:Round(Vector2.new(ScreenPosition.X, ScreenPosition.Y) - (Size / 2))

            Objects.Box.Outline.Thickness = (Objects.Box.Main.Thickness * 2)
            Objects.Box.Outline.Size = Objects.Box.Main.Size
            Objects.Box.Outline.Position = Objects.Box.Main.Position

            Objects.Healthbar.Main.Color = HealthbarLerp(HealthPercent)
            Objects.Healthbar.Main.Size = Vector2.new(2, (-Objects.Box.Main.Size.Y * HealthPercent))
            Objects.Healthbar.Main.Position = Vector2.new((Objects.Box.Main.Position.X - (Objects.Box.Outline.Thickness + 1)), (Objects.Box.Main.Position.Y + Objects.Box.Main.Size.Y))

            Objects.Healthbar.Outline.Size = Vector2.new(4, (Objects.Box.Main.Size.Y + 2))
            Objects.Healthbar.Outline.Position = Vector2.new((Objects.Box.Main.Position.X - (Objects.Box.Outline.Thickness + 2)), (Objects.Box.Main.Position.Y - 1))
            
            Objects.Info.Main.Font = Drawing.Fonts[Library.flags["Visuals Info Font"]]
            Objects.Info.Main.Text = NameString
            Objects.Info.Main.Size = Library.flags["Visuals Info Font Size"]
            Objects.Info.Main.Position = Vector2.new(((Objects.Box.Main.Size.X / 2) + Objects.Box.Main.Position.X), ((ScreenPosition.Y - Objects.Box.Main.Size.Y / 2) - 18))

            Objects.Info.Extra.Font = Drawing.Fonts[Library.flags["Visuals Info Font"]]
            Objects.Info.Extra.Text = string.format("(%dft) (%d/%d)", Distance, Health.CurrentHealth, Health.MaxHealth)
            Objects.Info.Extra.Size = Library.flags["Visuals Info Font Size"]
            Objects.Info.Extra.Position = Vector2.new(((Objects.Box.Main.Size.X / 2) + Objects.Box.Main.Position.X), (Objects.Box.Main.Size.Y + Objects.Box.Main.Position.Y))
        end

        Objects.Box.Main.Visible = (OnScreen and Library.flags["Visuals Show Boxes"]) or false
        Objects.Box.Outline.Visible = Objects.Box.Main.Visible

        Objects.Healthbar.Main.Visible = (OnScreen and Library.flags["Visuals Show Healthbar"]) or false
        Objects.Healthbar.Outline.Visible = Objects.Healthbar.Main.Visible

        Objects.Info.Main.Visible = (OnScreen and Library.flags["Visuals Show Info"]) or false
        Objects.Info.Extra.Visible = (OnScreen and Library.flags["Visuals Show Extra Info"]) or false
    end
end)

GlobalEnvironment().beachwave = {
    Unload = function()
        PlayerAddedEvent:Disconnect()
        PlayerRemovingEvent:Disconnect()

        for Flag, Value in pairs(Library.flags) do
            if typeof(Value) == "boolean" then
                Library.flags[Flag] = false
            end
        end

        for Index, Player in pairs(Players:GetPlayers()) do
            if Player == LocalPlayer then continue end
            Visuals.RemovePlayer(Player)
        end

        RunService:UnbindFromRenderStep(LoopId)
        Library.base:Destroy()
        FOVCircle:Remove()

        GlobalEnvironment().beachwave = nil
    end
}

local Fonts = {} do
    for Font, Number in pairs(Drawing.Fonts) do
        table.insert(Fonts, Font)
    end
end

Library.ConfigManager = {} do
    local Directory = "beachwave"
    Library.ConfigManager.Directory = Directory

    local Conversions = {
        toggle = function(Toggle, Value)
            Toggle:SetState(Value)
        end,
        bind = function(Bind, Value)
            Bind:SetKey(Value)
        end,
        slider = function(Slider, Value)
            Slider:SetValue(Value)
        end,
        list = function(List, Value)
            List:SetValue(Value)
        end,
        color = function(ColorPicker, Value)
            ColorPicker:DisableRainbow()
            ColorPicker:SetColor(Value)
        end
    }
    
    function Library.ConfigManager:LoadConfig()
        FileName = ("%s/%s.bw"):format(Directory, Library.flags["Settings Config File"])
        if not IsFolder(Directory) or not IsFile(FileName) then return end
        
        local Config = HttpService:JSONDecode(ReadFile(FileName))
        for Index, Value in pairs(Config) do
            if typeof(Value) == "string" and Value:sub(1, 1) == "#" then --// Assume it's a Color Picker
                Library.flags[Index] = Color3.fromHex(Value)
            else
                Library.flags[Index] = Value
            end
        end
        
        for Index, Tab in pairs(Library.windows) do
            for Index2, Option in pairs(Tab.options) do
                if Conversions[Option.type] and (Option.flag and Library.flags[Option.flag]) then
                    Conversions[Option.type](Option, Library.flags[Option.flag])
                end
            end
        end
    end

    function Library.ConfigManager:SaveConfig()
        FileName = ("%s/%s.bw"):format(Directory, Library.flags["Settings Config File"])
        if not IsFolder(Directory) then MakeFolder(Directory) end
        
        local FlagsClone = {}
        for Index, Value in pairs(Library.flags) do
            if typeof(Value) == "Color3" then
                Value = ("#" .. Value:ToHex())
            end
            
            FlagsClone[Index] = Value
        end

        WriteFile(FileName, HttpService:JSONEncode(FlagsClone))
    end
end

local AimbotTab = Library:CreateWindow("Aimbot")
AimbotTab:AddToggle({text = "Enabled", flag = "Aimbot Enabled"})
AimbotTab:AddBind({
    text = "Bind",
    flag = "Aimbot Bind",
    key = Enum.UserInputType.MouseButton2,
    hold = true,
    callback = function(Value)
        Library.flags["Aimbot Active"] = (not Value)
    end
})

AimbotTab:AddToggle({text = "Team Check", flag = "Aimbot Team Check"})
AimbotTab:AddToggle({text = "Use Field of View", flag = "Aimbot Use FOV"})
--// AimbotTab:AddToggle({text = "Dynamic FOV", flag = "Aimbot Dynamic FOV"})
AimbotTab:AddList({
    text = "FOV Type",
    flag = "Aimbot FOV Type",
    values = {"Static", "Dynamic", "Dynamic Reversed"}
})

AimbotTab:AddColor({
    text = "FOV Circle Color",
    flag = "Aimbot FOV Color",
    color = Color3.fromRGB(255, 255, 255)
})

AimbotTab:AddSlider({
    text = "FOV Radius",
    flag = "Aimbot FOV Radius",
    min = 0,
    max = 500,
    float = 1
})

AimbotTab:AddSlider({
    text = "Smoothing",
    flag = "Aimbot Smoothing",
    min = 1,
    max = 5,
    float = 0.1
})

local VisualsTab = Library:CreateWindow("Visuals")
VisualsTab:AddToggle({text = "Boxes", flag = "Visuals Show Boxes"})
VisualsTab:AddToggle({text = "Healthbar", flag = "Visuals Show Healthbar"})
VisualsTab:AddToggle({text = "Info", flag = "Visuals Show Info"})
VisualsTab:AddToggle({text = "Extra Info", flag = "Visuals Show Extra Info"})
VisualsTab:AddToggle({text = "Use Team Color", flag = "Visuals Use Team Color"})
VisualsTab:AddToggle({text = "Team Check", flag = "Visuals Team Check"})
VisualsTab:AddColor({
    text = "Ally Color",
    flag = "Visuals Ally Color",
    color = Color3.fromRGB(0, 255, 0)
})

VisualsTab:AddColor({
    text = "Enemy Color",
    flag = "Visuals Enemy Color",
    color = Color3.fromRGB(255, 0, 0)
})

VisualsTab:AddSlider({
    text = "Font Size",
    flag = "Visuals Info Font Size",
    min = 12,
    max = 42,
    float = 1,
    value = DrawingProperties.Text.Size
})

VisualsTab:AddList({
    text = "Info Font",
    flag = "Visuals Info Font",
    values = Fonts
})

local SettingsTab = Library:CreateWindow("Settings")
SettingsTab:AddLabel({text = ("Build: " .. shared.BeachwaveVersion)})
SettingsTab:AddBox({text = "Config File Name", flag = "Settings Config File"})
SettingsTab:AddButton({text = "Save Config", callback = function()
    Library.ConfigManager:SaveConfig()
end})

SettingsTab:AddButton({text = "Load Config", callback = function()
    Library.ConfigManager:LoadConfig()
end})

SettingsTab:AddButton({text = "Unload", callback = function()
    GlobalEnvironment().beachwave.Unload()
end})

TweenService:Create(Dot1, BaseTweenInfo, {ImageColor3 = Color3.fromRGB(116, 255, 132)}):Play()
TweenService:Create(Dot2, BaseTweenInfo, {ImageColor3 = Color3.fromRGB(116, 255, 132)}):Play()
WaitForTweenToEnd(TweenService:Create(Dot3, BaseTweenInfo, {ImageColor3 = Color3.fromRGB(116, 255, 132)}))

TweenService:Create(Dot1, BaseTweenInfo, {ImageTransparency = 1}):Play()
TweenService:Create(Dot2, BaseTweenInfo, {ImageTransparency = 1}):Play()
WaitForTweenToEnd(TweenService:Create(Dot3, BaseTweenInfo, {ImageTransparency = 1}))
WaitForTweenToEnd(TweenService:Create(Status, BaseTweenInfo, {TextTransparency = 0}))

task.wait(2)
TweenService:Create(Status, BaseTweenInfo, {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
WaitForTweenToEnd(TweenService:Create(Border, BaseTweenInfo, {BackgroundTransparency = 1}))
TweenService:Create(Holder, TweenInfo.new(0.75, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 0, 0, 0)}):Play()
WaitForTweenToEnd(TweenService:Create(UICorner, TweenInfo.new(0.75, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {CornerRadius = UDim.new(1, 0)}))
UI:Destroy()


Library:Init()
UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent)
    if GameProcessedEvent then return end
    if Input.KeyCode == Enum.KeyCode.RightControl then
        Library:Close()
    end
end)