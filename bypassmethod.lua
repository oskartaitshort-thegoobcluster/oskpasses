-- ===== Letter map (EMPTY – add your own) =====
local map = {
    a = "ล",
    b = "ʙ",
    c = "ᴄ"
    d = "ᴅ"
    e = "ᴇ"
    f = "ꜰ"
    g = "ɡ"
    h = "һ"
    i = "і"
    j = "ᴊ˙"
    k = "ᴋ"
    l = "I"
    m = "ทา"
    n = "ท"
    o = "ᴏ"
    p = "ᴘ"
    q = "ǫ"
    r = "ʀ"
    s = "ꜱ"
    t = "ᴛ"
    u = "ษ"
    v = "ᴠ"
    w = "ᴡ"
    x = "x"
    y = "ʏ"
    z = "ᴢ"
}

-- ===== Convert function =====
local function convertText(text)
    local output = ""

    for i = 1, #text do
        local char = text:sub(i, i):lower()
        output = output .. (map[char] or char)
    end

    return output
end

-- ===== UI =====
local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")
local SendButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

-- Textbox
TextBox.Parent = ScreenGui
TextBox.Size = UDim2.new(0, 300, 0, 40)
TextBox.Position = UDim2.new(0.5, -150, 0.8, 0)
TextBox.PlaceholderText = "Type message..."
TextBox.Text = ""
TextBox.TextScaled = true
TextBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
TextBox.TextColor3 = Color3.fromRGB(255,255,255)

-- Send button
SendButton.Parent = ScreenGui
SendButton.Size = UDim2.new(0, 300, 0, 40)
SendButton.Position = UDim2.new(0.5, -150, 0.8, 45)
SendButton.Text = "Send Converted"
SendButton.TextScaled = true
SendButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
SendButton.TextColor3 = Color3.fromRGB(255,255,255)

-- ===== Send to chat =====
SendButton.MouseButton1Click:Connect(function()
    local converted = convertText(TextBox.Text)

    -- New Roblox chat system (works in many games)
    local TextChatService = game:GetService("TextChatService")
    local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")

    if channel then
        channel:SendAsync(converted)
    else
        warn("Chat channel not found")
    end
end)
