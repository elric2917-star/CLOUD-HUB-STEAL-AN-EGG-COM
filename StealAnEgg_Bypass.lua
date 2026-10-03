-- ============================================================
--  CLOUD HUB | STEAL AN EGG BYPASS SUITE
--  Methods: Chicken Bait / Noclip / Shrink / Swap / Invis
--  Stand inside your Pen BEFORE clicking any egg row.
--  The script locks your return point to where you stand.
-- ============================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ── PET DATABASE ──────────────────────────────────────────────────────────
local DB = {
    ["chicken egg"]=1,["dog egg"]=2,["bird egg"]=8,["owl egg"]=35,
    ["burrowing owl egg"]=35,["raccoon egg"]=45,["fox egg"]=180,
    ["bear egg"]=240,["brr brr patapim egg"]=1800,
    ["frog egg"]=3,["duckling egg"]=4,["catfish egg"]=12,
    ["turtle egg"]=60,["trulimero trulicina egg"]=260,["swan egg"]=320,
    ["axolotl egg"]=2800,["leviathan egg"]=220000,
    ["jerboa egg"]=6,["fennec egg"]=18,["camel egg"]=75,
    ["tob tobi tob tob egg"]=325,["snake egg"]=3600,
    ["sand spider egg"]=16000,["scorpion egg"]=18500,["royal sphinx egg"]=280000,
    ["chimpanzee egg"]=90,["toucan egg"]=110,["crocodile egg"]=420,
    ["gorilla egg"]=4800,["orangutini ananassini egg"]=5500,
    ["spider egg"]=22000,["tiger egg"]=28000,["king snake egg"]=3500000,
    ["penguin egg"]=140,["walrus egg"]=600,["polar bear egg"]=7000,
    ["sabertooth tiger egg"]=35000,["mammoth egg"]=42000,
    ["king mammoth egg"]=400000,["yeti egg"]=5000000,["ice dragon egg"]=65000000,
    ["lava gecko egg"]=180,["lava frog egg"]=850,
    ["flaming bull egg"]=9500,["lava iguana egg"]=11000,
    ["chillin chilli egg"]=55000,["cerberus egg"]=8000000,
    ["phoenix egg"]=85000000,["lava dragon egg"]=100000000,
    ["parrotfish egg"]=220,["swordfish egg"]=1100,["shark egg"]=15000,
    ["orca egg"]=80000,["whale shark egg"]=700000,
    ["beluga whale egg"]=850000,["kraken egg"]=15000000,["el maja egg"]=130000000,
    ["dodo egg"]=280,["pterodactyl egg"]=22000,["ankylosaurus egg"]=120000,
    ["triceratops egg"]=1200000,["bronto egg"]=1500000,
    ["t-rex egg"]=25000000,["tralaledon egg"]=32000000,["mosasaurus egg"]=180000000,
    ["centapede egg"]=1500,["cosmic gecko egg"]=30000,["cosmic gorilla egg"]=180000,
    ["la vacca saturno saturnita egg"]=2200000,["cosmic skeleton boss egg"]=45000000,
    ["cosmic dragon egg"]=60000000,["eternal lunar dragon egg"]=250000000,
    ["unicorn egg"]=1000000000,
    ["crane egg"]=4000,["salamander egg"]=74000,["red panda egg"]=450000,
    ["snowy owl egg"]=7500000,["koi egg"]=12000000,["stag egg"]=145000000,
    ["oni tiger egg"]=600000000,["kitsune egg"]=1800000000,
    ["spideron egg"]=95000,["crustacia egg"]=130000,["bladehide egg"]=750000,
    ["mantaris egg"]=11000000,["rhinotaur egg"]=17500000,
    ["mutant shark egg"]=215000000,["gorilla king egg"]=880000000,
    ["nightflame egg"]=3000000000,
    ["light dove egg"]=225000,["winged lamb egg"]=1250000,
    ["sacred moth egg"]=16000000,["holy peacock egg"]=25000000,
    ["pure jellyfish egg"]=225000000,["centaur egg"]=350000000,
    ["pegasus egg"]=1300000000,["archangel egg"]=5000000000,
    ["flame sprite egg"]=225000,["toro egg"]=1250000,
    ["imp egg"]=16000000,["demon hound egg"]=25000000,
    ["gargoyle egg"]=225000000,["razorfang egg"]=350000000,
    ["skeleton horse egg"]=1300000000,["world burner egg"]=5000000000,
    ["equinox egg"]=1800000000,["aetheron egg"]=6900000000,
    ["scorpio egg"]=10000,["froggo egg"]=50000,["crawler egg"]=1500000,
    ["crocodon egg"]=30000000,["krakenoid egg"]=500000000,
    ["dreadscale egg"]=2000000000,["mecha scorpio egg"]=45000000,
    ["mecha froggo egg"]=155000000,["mecha crawler egg"]=320000000,
    ["mecha crocodon egg"]=680000000,["mecha krakenoid egg"]=1000000000,
    ["mecha dreadscale egg"]=4000000000,
    ["spike egg"]=15000,["spirit manta egg"]=75000,
    ["abyss shark egg"]=2500000,["electric eel egg"]=200000000,
    ["terra snapper egg"]=750000000,["cthulhu egg"]=3000000000,
    ["luminous spike egg"]=350000000,["luminous spirit manta egg"]=500000000,
    ["luminous abyss shark egg"]=600000000,["luminous electric eel egg"]=1750000000,
    ["luminous terra snapper egg"]=2500000000,["luminous cthulhu egg"]=6500000000,
    ["glyptodon egg"]=22500,["sabertooth egg"]=5000000000,
    ["skeletal glyptodon egg"]=550000000,["skeletal terrorbird egg"]=750000000,
    ["skeletal giant sloth egg"]=900000000,["skeletal dunkleosteus egg"]=2500000000,
    ["skeletal gigantus egg"]=4000000000,["skeletal sabertooth egg"]=9000000000,
    ["tung tung sahur egg"]=100,["bananita dolphinita egg"]=400,
    ["belula beluga egg"]=40000,["mangolini parrochini egg"]=800000,
    ["bomboclat crocolat egg"]=20000000,["strawberry elephant egg"]=110000000,
    ["toxic rat egg"]=180000,["wheel hamster egg"]=450000,
    ["frogfly egg"]=1200000,["radcoon egg"]=2200000,
    ["stacked turtle egg"]=12000000,["spiderpig egg"]=25000000,
    ["toucax egg"]=30000000,["three headed chicken egg"]=165000000,
    ["sharkodile egg"]=350000000,["nuceodile egg"]=500000000,
    ["eyeball crab egg"]=825000000,["rhinobear egg"]=1000000000,
    ["nuclear mantis egg"]=1500000000,["deadstinger egg"]=2000000000,
    ["octophant egg"]=4000000000,["mecha scrambler egg"]=7500000000,
    ["eye bat #021 egg"]=115000,["citadel snail #007 egg"]=12500000,
    ["uncoiled armadillo egg"]=625000,["mecha chompa egg"]=600000000,
    ["pink dragon experiment #010 egg"]=2500000000,
    ["rift eye egg"]=11000,["void angler egg"]=30000,
    ["riftwing egg"]=220000,["shardling egg"]=450000,["voidmaw egg"]=50000,
    ["dreadclaw egg"]=2200000,["shattered ram egg"]=8000000,
    ["ventinal egg"]=585000,["mawbreaker egg"]=60000000,
    ["shardwing egg"]=145000000,["wendigo egg"]=15000000,
    ["shattered drake egg"]=800000000,["world eater egg"]=500000000,
    ["void serpent egg"]=900000000,["shattered colossus egg"]=3500000000,
    ["baby aurora dragon egg"]=5000000,["shadow dragon egg"]=25000000,
    ["drilla egg"]=100000000,["scorched dragon egg"]=35000000,
    ["abyss overlord egg"]=100000000,["void dragon egg"]=120000000,
    ["ember dragon egg"]=600000000,
}

local function dbLookup(name)
    local low = name:lower()
    if DB[low] then return DB[low] end
    if DB[low.." egg"] then return DB[low.." egg"] end
    for k,v in pairs(DB) do
        if low:find(k,1,true) or k:find(low,1,true) then return v end
    end
    return nil
end

local function fmtMoney(n)
    if n>=1e9 then return string.format("$%.1fB/s",n/1e9)
    elseif n>=1e6 then return string.format("$%.1fM/s",n/1e6)
    elseif n>=1e3 then return string.format("$%.1fK/s",n/1e3)
    else return string.format("$%d/s",n) end
end

local function getTierColor(val)
    if val>=1e9 then return Color3.fromRGB(160,220,255)
    elseif val>=500e6 then return Color3.fromRGB(255,210,80)
    elseif val>=50e6 then return Color3.fromRGB(255,130,130)
    elseif val>=1e6 then return Color3.fromRGB(120,210,255)
    elseif val>=50e3 then return Color3.fromRGB(180,150,255)
    elseif val>=5e3 then return Color3.fromRGB(255,175,60)
    elseif val>=500 then return Color3.fromRGB(150,180,255)
    elseif val>=50 then return Color3.fromRGB(160,230,180)
    else return Color3.fromRGB(180,185,200) end
end

-- ── CONFIG ────────────────────────────────────────────────────────────────
local CFG = {
    flySpeed    = 120,
    returnSpeed = 160,
    baitWait    = 3.5,
    hoverTime   = 0.6,
    method      = 1,
}

-- ── HELPERS ───────────────────────────────────────────────────────────────
local function getChar() return LocalPlayer.Character end
local function getHRP()
    local c = getChar(); return c and c:FindFirstChild("HumanoidRootPart")
end
local function getHum()
    local c = getChar(); return c and c:FindFirstChildOfClass("Humanoid")
end
local function getPos(obj)
    if obj:IsA("Model") and obj.PrimaryPart then return obj:GetPivot().Position
    elseif obj:IsA("BasePart") then return obj.Position end
    return nil
end
local function findSafeZone()
    local hrp = getHRP()
    if not hrp then return Vector3.new(0,5,0) end
    return hrp.Position
end
local function findChickenEgg()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("chicken") and obj.Name:lower():find("egg") then
            local pos = getPos(obj)
            if pos then return obj, pos end
        end
    end
    return nil, nil
end
local function tweenTo(target, speed)
    local hrp = getHRP(); if not hrp then return end
    local dist = (target - hrp.Position).Magnitude
    local t = math.clamp(dist/speed, 0.05, 10)
    local tw = TweenService:Create(hrp,
        TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        {CFrame = CFrame.new(target + Vector3.new(0,3,0))})
    tw:Play(); tw.Completed:Wait()
end
local function lockMovement(lock)
    local hum = getHum(); if not hum then return end
    hum.WalkSpeed = lock and 0 or 16
    hum.JumpPower = lock and 0 or 50
end

-- ── BYPASS METHODS ────────────────────────────────────────────────────────
local isBusy = false
local statusMsg = ""
local noclipConn = nil
local shrinkActive = false
local invisActive = false

local function method_bait(eggData, basePos)
    local _, chickenPos = findChickenEgg()
    if chickenPos then
        statusMsg = "🐔 Flying to Chicken Egg (bait)..."
        tweenTo(chickenPos, CFG.flySpeed)
        task.wait(0.4)
        statusMsg = "⏳ Waiting for guard aggro... ("..CFG.baitWait.."s)"
        task.wait(CFG.baitWait)
    else
        statusMsg = "⚠ No Chicken Egg — skipping bait..."
        task.wait(0.6)
    end
    local eggPos = getPos(eggData.ref)
    if eggPos then
        statusMsg = "🚀 Guard distracted — flying to "..eggData.name.."!"
        tweenTo(eggPos, CFG.flySpeed * 1.4)
        task.wait(CFG.hoverTime)
        statusMsg = "📦 Collecting..."
        task.wait(0.3)
    end
    statusMsg = "🏠 Returning to pen..."
    tweenTo(basePos, CFG.returnSpeed)
end

local function enableNoclip()
    if noclipConn then return end
    noclipConn = RunService.Stepped:Connect(function()
        local char = getChar(); if not char then return end
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end)
end
local function disableNoclip()
    if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
    local char = getChar()
    if char then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
    end
end
local function method_noclip(eggData, basePos)
    statusMsg = "👻 Noclip ON — phasing to "..eggData.name.."..."
    enableNoclip(); task.wait(0.2)
    local eggPos = getPos(eggData.ref)
    if eggPos then
        tweenTo(eggPos, CFG.flySpeed * 1.6)
        task.wait(CFG.hoverTime)
        statusMsg = "📦 Collecting through walls..."; task.wait(0.3)
    end
    statusMsg = "🏠 Returning (noclip)..."
    tweenTo(basePos, CFG.returnSpeed * 1.4)
    disableNoclip()
end

local function shrinkChar(on)
    local char = getChar(); if not char then return end
    local scale = on and 0.1 or 1
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
            p.Size = p.Size * scale
        end
    end
    shrinkActive = on
end
local function method_shrink(eggData, basePos)
    statusMsg = "🔬 Shrinking hitbox..."
    shrinkChar(true); task.wait(0.3)
    local eggPos = getPos(eggData.ref)
    if eggPos then
        statusMsg = "🚀 Micro-flying to "..eggData.name.."..."
        tweenTo(eggPos, CFG.flySpeed)
        task.wait(CFG.hoverTime)
        statusMsg = "📦 Micro-collecting..."; task.wait(0.3)
    end
    statusMsg = "🏠 Returning (micro)..."
    tweenTo(basePos, CFG.returnSpeed)
    shrinkChar(false)
end

local function method_swap(eggData, basePos)
    local hrp = getHRP(); if not hrp then return end
    local eggPos = getPos(eggData.ref)
    if eggPos then
        statusMsg = "⚡ Swapping to "..eggData.name.."..."
        hrp.CFrame = CFrame.new(basePos:Lerp(eggPos,0.33)+Vector3.new(0,3,0)); task.wait(0.05)
        hrp.CFrame = CFrame.new(basePos:Lerp(eggPos,0.66)+Vector3.new(0,3,0)); task.wait(0.05)
        hrp.CFrame = CFrame.new(eggPos+Vector3.new(0,3,0))
        task.wait(CFG.hoverTime)
        statusMsg = "📦 Instant collect..."; task.wait(0.2)
        statusMsg = "⚡ Swapping back..."
        hrp.CFrame = CFrame.new(eggPos:Lerp(basePos,0.33)+Vector3.new(0,3,0)); task.wait(0.05)
        hrp.CFrame = CFrame.new(eggPos:Lerp(basePos,0.66)+Vector3.new(0,3,0)); task.wait(0.05)
        hrp.CFrame = CFrame.new(basePos+Vector3.new(0,3,0))
    end
end

local function setInvis(on)
    local char = getChar(); if not char then return end
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") then p.Transparency = on and 1 or 0
        elseif p:IsA("Decal") then p.Transparency = on and 1 or 0 end
    end
    invisActive = on
end
local function method_invis(eggData, basePos)
    statusMsg = "🫥 Going invisible..."
    setInvis(true); task.wait(0.3)
    local eggPos = getPos(eggData.ref)
    if eggPos then
        statusMsg = "🫥 Silent approach to "..eggData.name.."..."
        tweenTo(eggPos, 40)
        task.wait(CFG.hoverTime + 0.4)
        statusMsg = "📦 Silent collect..."; task.wait(0.4)
    end
    statusMsg = "🫥 Silent return..."
    tweenTo(basePos, 50)
    setInvis(false)
end

local function collectEgg(eggData)
    if isBusy then return end
    isBusy = true
    lockMovement(true)
    local basePos = findSafeZone()
    local ok, err = pcall(function()
        if CFG.method==1 then method_bait(eggData,basePos)
        elseif CFG.method==2 then method_noclip(eggData,basePos)
        elseif CFG.method==3 then method_shrink(eggData,basePos)
        elseif CFG.method==4 then method_swap(eggData,basePos)
        elseif CFG.method==5 then method_invis(eggData,basePos)
        end
    end)
    if not ok then
        disableNoclip()
        if shrinkActive then shrinkChar(false) end
        if invisActive then setInvis(false) end
        statusMsg = "⚠ "..tostring(err)
        task.wait(2)
    end
    lockMovement(false)
    statusMsg = ""
    isBusy = false
end

-- ── GUI ───────────────────────────────────────────────────────────────────
local sg = Instance.new("ScreenGui")
sg.Name = "CloudHub"
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
sg.Parent = PlayerGui

-- CLOUD PALETTE
local C = {
    bg      = Color3.fromRGB(12, 18, 35),
    bg2     = Color3.fromRGB(18, 26, 52),
    cloud1  = Color3.fromRGB(30, 45, 90),
    cloud2  = Color3.fromRGB(40, 60, 120),
    accent  = Color3.fromRGB(100, 160, 255),
    accent2 = Color3.fromRGB(140, 200, 255),
    muted   = Color3.fromRGB(80, 110, 180),
    white   = Color3.fromRGB(220, 235, 255),
    row1    = Color3.fromRGB(15, 22, 45),
    row2    = Color3.fromRGB(20, 30, 58),
    hover   = Color3.fromRGB(35, 55, 100),
    active  = Color3.fromRGB(20, 60, 60),
    gold    = Color3.fromRGB(255,215,0),
    silver  = Color3.fromRGB(200,200,210),
    bronze  = Color3.fromRGB(205,130,80),
}

local function mkCorner(p, r)
    local c = Instance.new("UICorner", p)
    c.CornerRadius = UDim.new(0, r or 10)
end
local function mkStroke(p, col, th)
    local s = Instance.new("UIStroke", p)
    s.Color = col or C.cloud2
    s.Thickness = th or 1
end

local function lbl(parent,txt,x,w,sz,col,bold,xa)
    local l = Instance.new("TextLabel",parent)
    l.Size = UDim2.new(0,w,1,0)
    l.Position = UDim2.new(0,x,0,0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.TextColor3 = col or C.white
    l.TextSize = sz or 12
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextXAlignment = xa or Enum.TextXAlignment.Left
    l.TextTruncate = Enum.TextTruncate.AtEnd
    return l
end

-- ── MINI BUTTON (shown when main is closed) ────────────────────────────────
local mini = Instance.new("TextButton", sg)
mini.Size = UDim2.new(0,52,0,52)
mini.Position = UDim2.new(0,16,0.5,-26)
mini.BackgroundColor3 = C.cloud1
mini.BorderSizePixel = 0
mini.Text = "☁️"
mini.TextSize = 24
mini.Font = Enum.Font.GothamBold
mini.Visible = false
mkCorner(mini, 16)
mkStroke(mini, C.accent, 1.5)

-- ── MAIN FRAME ────────────────────────────────────────────────────────────
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0,340,0,560)
frame.Position = UDim2.new(0,16,0.5,-280)
frame.BackgroundColor3 = C.bg
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
mkCorner(frame, 16)
mkStroke(frame, C.cloud2, 1.5)

-- decorative cloud blobs inside header area
local function cloudBlob(parent, x, y, w, h, col)
    local b = Instance.new("Frame", parent)
    b.Size = UDim2.new(0,w,0,h)
    b.Position = UDim2.new(0,x,0,y)
    b.BackgroundColor3 = col
    b.BorderSizePixel = 0
    b.ZIndex = 1
    mkCorner(b, math.floor(h/2))
    return b
end

-- HEADER
local hdr = Instance.new("Frame", frame)
hdr.Size = UDim2.new(1,0,0,52)
hdr.BackgroundColor3 = C.bg2
hdr.BorderSizePixel = 0
hdr.ZIndex = 2
mkCorner(hdr, 16)
-- fix bottom corners
local hfix = Instance.new("Frame",hdr)
hfix.Size = UDim2.new(1,0,0.5,0); hfix.Position = UDim2.new(0,0,0.5,0)
hfix.BackgroundColor3 = C.bg2; hfix.BorderSizePixel = 0; hfix.ZIndex = 2

-- cloud blobs in header
cloudBlob(hdr, -10, 8, 80, 28, C.cloud1)
cloudBlob(hdr, 50, 4, 60, 20, C.cloud2)
cloudBlob(hdr, 200, 6, 100, 30, C.cloud1)
cloudBlob(hdr, 260, 10, 70, 22, C.cloud2)

-- hub icon + title
local hubIcon = Instance.new("TextLabel", hdr)
hubIcon.Size = UDim2.new(0,32,0,32)
hubIcon.Position = UDim2.new(0,10,0.5,-16)
hubIcon.BackgroundColor3 = C.accent
hubIcon.Text = "☁"
hubIcon.TextSize = 18
hubIcon.Font = Enum.Font.GothamBold
hubIcon.TextColor3 = Color3.fromRGB(255,255,255)
hubIcon.ZIndex = 3
mkCorner(hubIcon, 10)

local titleL = Instance.new("TextLabel", hdr)
titleL.Size = UDim2.new(0,160,0,20)
titleL.Position = UDim2.new(0,48,0.5,-10)
titleL.BackgroundTransparency = 1
titleL.Text = "CLOUD HUB"
titleL.TextSize = 15
titleL.Font = Enum.Font.GothamBold
titleL.TextColor3 = C.accent2
titleL.TextXAlignment = Enum.TextXAlignment.Left
titleL.ZIndex = 3

local subL = Instance.new("TextLabel", hdr)
subL.Size = UDim2.new(0,160,0,13)
subL.Position = UDim2.new(0,48,0.5,12)
subL.BackgroundTransparency = 1
subL.Text = "Steal an Egg Bypass Suite"
subL.TextSize = 9
subL.Font = Enum.Font.Gotham
subL.TextColor3 = C.muted
subL.TextXAlignment = Enum.TextXAlignment.Left
subL.ZIndex = 3

local timerL = Instance.new("TextLabel", hdr)
timerL.Size = UDim2.new(0,50,0,20)
timerL.Position = UDim2.new(1,-110,0.5,-10)
timerL.BackgroundTransparency = 1
timerL.Text = "⏱ 5s"
timerL.TextSize = 10
timerL.Font = Enum.Font.Gotham
timerL.TextColor3 = C.muted
timerL.TextXAlignment = Enum.TextXAlignment.Right
timerL.ZIndex = 3

-- CLOSE BUTTON
local closeBtn = Instance.new("TextButton", hdr)
closeBtn.Size = UDim2.new(0,28,0,28)
closeBtn.Position = UDim2.new(1,-36,0.5,-14)
closeBtn.BackgroundColor3 = Color3.fromRGB(60,30,30)
closeBtn.Text = "✕"
closeBtn.TextSize = 12
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.fromRGB(255,120,120)
closeBtn.BorderSizePixel = 0
closeBtn.ZIndex = 4
mkCorner(closeBtn, 8)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    mini.Visible = true
end)
mini.MouseButton1Click:Connect(function()
    mini.Visible = false
    frame.Visible = true
end)

-- METHOD TABS
local methodBar = Instance.new("Frame", frame)
methodBar.Size = UDim2.new(1,-10,0,28)
methodBar.Position = UDim2.new(0,5,0,55)
methodBar.BackgroundColor3 = C.bg2
methodBar.BorderSizePixel = 0
mkCorner(methodBar, 8)

local METHODS = {"🐔 Bait","👻 Noclip","🔬 Shrink","⚡ Swap","🫥 Invis"}
local methodBtns = {}

for i, name in ipairs(METHODS) do
    local btn = Instance.new("TextButton", methodBar)
    btn.Size = UDim2.new(0,60,1,-4)
    btn.Position = UDim2.new(0, 4+(i-1)*62, 0, 2)
    btn.BackgroundColor3 = i==1 and C.cloud2 or C.bg
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = i==1 and C.accent2 or C.muted
    btn.TextSize = 9
    btn.Font = Enum.Font.GothamBold
    mkCorner(btn, 6)
    btn.MouseButton1Click:Connect(function()
        CFG.method = i
        for j,b in ipairs(methodBtns) do
            b.BackgroundColor3 = j==i and C.cloud2 or C.bg
            b.TextColor3 = j==i and C.accent2 or C.muted
        end
    end)
    table.insert(methodBtns, btn)
end

-- SPEED SLIDERS
local sliderPanel = Instance.new("Frame", frame)
sliderPanel.Size = UDim2.new(1,-10,0,54)
sliderPanel.Position = UDim2.new(0,5,0,86)
sliderPanel.BackgroundColor3 = C.bg2
sliderPanel.BorderSizePixel = 0
mkCorner(sliderPanel, 8)

local function makeSlider(parent, yPos, labelTxt, mn, mx, def, onChange)
    local lf = Instance.new("Frame", parent)
    lf.Size = UDim2.new(1,-12,0,22)
    lf.Position = UDim2.new(0,6,0,yPos)
    lf.BackgroundTransparency = 1

    local ll = Instance.new("TextLabel", lf)
    ll.Size = UDim2.new(0,95,1,0)
    ll.BackgroundTransparency = 1
    ll.Text = labelTxt
    ll.TextColor3 = C.muted
    ll.TextSize = 10; ll.Font = Enum.Font.Gotham
    ll.TextXAlignment = Enum.TextXAlignment.Left

    local valL = Instance.new("TextLabel", lf)
    valL.Size = UDim2.new(0,36,1,0)
    valL.Position = UDim2.new(1,-36,0,0)
    valL.BackgroundTransparency = 1
    valL.Text = tostring(def)
    valL.TextColor3 = C.accent2
    valL.TextSize = 10; valL.Font = Enum.Font.GothamBold
    valL.TextXAlignment = Enum.TextXAlignment.Right

    local track = Instance.new("Frame", lf)
    track.Size = UDim2.new(0,155,0,4)
    track.Position = UDim2.new(0,98,0.5,-2)
    track.BackgroundColor3 = C.cloud1
    track.BorderSizePixel = 0
    mkCorner(track, 2)

    local fill = Instance.new("Frame", track)
    fill.Size = UDim2.new((def-mn)/(mx-mn),0,1,0)
    fill.BackgroundColor3 = C.accent
    fill.BorderSizePixel = 0
    mkCorner(fill, 2)

    local thumb = Instance.new("TextButton", track)
    thumb.Size = UDim2.new(0,12,0,12)
    thumb.Position = UDim2.new((def-mn)/(mx-mn),0,0.5,-6)
    thumb.BackgroundColor3 = C.accent2
    thumb.BorderSizePixel = 0; thumb.Text = ""; thumb.ZIndex = 5
    mkCorner(thumb, 6)

    local dragging = false
    thumb.MouseButton1Down:Connect(function() dragging = true end)
    UIS.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    RunService.RenderStepped:Connect(function()
        if dragging then
            local mouse = LocalPlayer:GetMouse()
            local pct = math.clamp((mouse.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            local val = math.floor(mn + pct*(mx-mn))
            fill.Size = UDim2.new(pct,0,1,0)
            thumb.Position = UDim2.new(pct,0,0.5,-6)
            valL.Text = tostring(val)
            onChange(val)
        end
    end)
end

makeSlider(sliderPanel, 4,  "Fly Speed",    20, 300, 120, function(v) CFG.flySpeed=v end)
makeSlider(sliderPanel, 28, "Return Speed", 20, 350, 160, function(v) CFG.returnSpeed=v end)

-- HINT BAR
local hint = Instance.new("Frame", frame)
hint.Size = UDim2.new(1,0,0,17)
hint.Position = UDim2.new(0,0,0,143)
hint.BackgroundColor3 = C.cloud1
hint.BorderSizePixel = 0
local hintL = Instance.new("TextLabel", hint)
hintL.Size = UDim2.new(1,0,1,0)
hintL.BackgroundTransparency = 1
hintL.Text = "  ☁ Stand in your Pen first — then click any egg row"
hintL.TextSize = 9
hintL.Font = Enum.Font.Gotham
hintL.TextColor3 = C.muted
hintL.TextXAlignment = Enum.TextXAlignment.Left

-- COL HEADERS
local colHdr = Instance.new("Frame", frame)
colHdr.Size = UDim2.new(1,0,0,20)
colHdr.Position = UDim2.new(0,0,0,160)
colHdr.BackgroundColor3 = C.bg2
colHdr.BorderSizePixel = 0
lbl(colHdr,"#",8,22,9,C.muted,true)
lbl(colHdr,"EGG NAME",32,150,9,C.muted,true)
lbl(colHdr,"MONEY/S",188,80,9,C.muted,true,Enum.TextXAlignment.Right)
lbl(colHdr,"DIST",272,44,9,C.muted,true,Enum.TextXAlignment.Right)

-- SCROLL
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1,0,1,-222)
scroll.Position = UDim2.new(0,0,0,180)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = C.accent
scroll.CanvasSize = UDim2.new(0,0,0,0)
local layout = Instance.new("UIListLayout", scroll)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0,1)

-- FOOTER
local foot = Instance.new("Frame", frame)
foot.Size = UDim2.new(1,0,0,42)
foot.Position = UDim2.new(0,0,1,-42)
foot.BackgroundColor3 = C.bg2
foot.BorderSizePixel = 0
mkCorner(foot, 16)
local ffix = Instance.new("Frame",foot)
ffix.Size = UDim2.new(1,0,0.5,0)
ffix.BackgroundColor3 = C.bg2; ffix.BorderSizePixel = 0

local statusL = Instance.new("TextLabel", foot)
statusL.Size = UDim2.new(1,-12,0,16)
statusL.Position = UDim2.new(0,10,0,4)
statusL.BackgroundTransparency = 1
statusL.Text = "☁ Initialising Cloud Hub..."
statusL.TextSize = 11
statusL.Font = Enum.Font.Gotham
statusL.TextColor3 = C.muted
statusL.TextXAlignment = Enum.TextXAlignment.Left

local countL = Instance.new("TextLabel", foot)
countL.Size = UDim2.new(1,-12,0,13)
countL.Position = UDim2.new(0,10,0,22)
countL.BackgroundTransparency = 1
countL.Text = ""
countL.TextSize = 9
countL.Font = Enum.Font.Gotham
countL.TextColor3 = C.cloud2
countL.TextXAlignment = Enum.TextXAlignment.Left

-- ── ROW SYSTEM ────────────────────────────────────────────────────────────
local rowPool = {}
local activeRows = {}
local scanResults = {}

local function getRow()
    if #rowPool > 0 then return table.remove(rowPool) end
    local r = {}
    r.frame = Instance.new("Frame")
    r.frame.Size = UDim2.new(1,-4,0,30)
    r.frame.BorderSizePixel = 0
    mkCorner(r.frame, 6)
    r.btn = Instance.new("TextButton", r.frame)
    r.btn.Size = UDim2.new(1,0,1,0)
    r.btn.BackgroundTransparency = 1
    r.btn.Text = ""; r.btn.ZIndex = 5
    r.rank  = lbl(r.frame,"",6,24,10,C.white,true)
    r.name  = lbl(r.frame,"",32,152,10,C.white)
    r.money = lbl(r.frame,"",188,80,10,C.accent2,true,Enum.TextXAlignment.Right)
    r.dist  = lbl(r.frame,"",272,44,10,C.muted,false,Enum.TextXAlignment.Right)
    for _,c in ipairs({r.rank,r.name,r.money,r.dist}) do c.ZIndex = 4 end
    return r
end

local function recycleRow(r)
    r.frame.Parent = nil
    table.insert(rowPool, r)
end

local function isEgg(obj)
    return obj.Name:lower():find("egg") ~= nil and (obj:IsA("BasePart") or obj:IsA("Model"))
end
local function getObjPos(obj)
    if obj:IsA("Model") and obj.PrimaryPart then return obj:GetPivot().Position
    elseif obj:IsA("BasePart") then return obj.Position end
    return nil
end

local function doScan()
    local found, count = {}, 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        count += 1; if count%50==0 then task.wait() end
        if isEgg(obj) then
            local pos = getObjPos(obj)
            if pos then
                table.insert(found,{name=obj.Name, val=dbLookup(obj.Name) or 0, ref=obj, pos=pos})
            end
        end
    end
    table.sort(found, function(a,b) return a.val > b.val end)
    scanResults = found
end

local function rebuildRows()
    for _,r in ipairs(activeRows) do recycleRow(r) end
    activeRows = {}
    for i, egg in ipairs(scanResults) do
        local r = getRow()
        local bg = i%2==0 and C.row2 or C.row1
        r.frame.BackgroundColor3 = bg
        r.frame.LayoutOrder = i
        r.rank.Text = tostring(i)
        r.rank.TextColor3 = i==1 and C.gold or i==2 and C.silver or i==3 and C.bronze or C.muted
        r.name.Text = egg.name
        r.money.Text = egg.val>0 and fmtMoney(egg.val) or "?"
        r.money.TextColor3 = getTierColor(egg.val)
        r.dist.Text = "-"
        r.frame.Parent = scroll
        r.btn.MouseEnter:Connect(function()
            if not isBusy then r.frame.BackgroundColor3 = C.hover end
        end)
        r.btn.MouseLeave:Connect(function() r.frame.BackgroundColor3 = bg end)
        local snap = egg
        r.btn.MouseButton1Click:Connect(function()
            if isBusy then return end
            r.frame.BackgroundColor3 = C.active
            task.spawn(function()
                collectEgg(snap)
                r.frame.BackgroundColor3 = bg
            end)
        end)
        table.insert(activeRows, r)
    end
    scroll.CanvasSize = UDim2.new(0,0,0,#scanResults*31)
    countL.Text = "☁ "..#scanResults.." eggs in the sky"
end

-- ── LOOPS ─────────────────────────────────────────────────────────────────
local nextScan = 0
task.spawn(function()
    while true do
        if not isBusy then
            statusL.Text = "☁ Scanning clouds..."
            statusL.TextColor3 = C.muted
            doScan(); rebuildRows()
            statusL.Text = "✓ "..#scanResults.." eggs — "..os.date("%H:%M:%S")
            statusL.TextColor3 = Color3.fromRGB(100,220,140)
            nextScan = tick()+5
            task.wait(5)
        else
            if statusMsg ~= "" then
                statusL.Text = statusMsg
                statusL.TextColor3 = Color3.fromRGB(255,190,60)
            end
            task.wait(0.3)
        end
    end
end)

task.spawn(function()
    while true do
        local rem = math.max(0,math.floor(nextScan-tick()))
        timerL.Text = isBusy and "🔒 busy" or ("⏱ "..rem.."s")
        local char = getChar()
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp and not isBusy then
            local root = hrp.Position
            for i, egg in ipairs(scanResults) do
                if egg.ref and egg.ref.Parent then
                    local pos = getObjPos(egg.ref)
                    if pos then
                        local dist = math.floor((pos-root).Magnitude)
                        local row = activeRows[i]
                        if row then
                            row.dist.Text = dist.."s"
                            row.dist.TextColor3 = dist<20 and Color3.fromRGB(80,255,120)
                                or dist<60 and Color3.fromRGB(255,210,80)
                                or C.muted
                        end
                    end
                end
            end
        end
        task.wait(1)
    end
end)

print("[CloudHub] Loaded — stand in your Pen, click egg to collect ☁")
