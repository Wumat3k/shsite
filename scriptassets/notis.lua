local a = {}
local b = Random.new()
local c = {
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0"
}
function getRandomLetter()
    return c[b:NextInteger(1, #c)]
end
function getRandomString(d, e)
    local d = d or 10
    local f = ""
    for g = 1, d do
        local h = getRandomLetter()
        if e and b:NextNumber() > .5 then
            h = string.upper(h)
        end
        f = f .. h
    end
    return f
end
function a:Notify(i, j, k, l)
    local m = i
    local n = j
    local o = k
    local p = 9
    local q = Instance.new("ScreenGui")
    local r = Instance.new("Frame")
    local s = Instance.new("TextLabel")
    local t = Instance.new("UITextSizeConstraint")
    local u = Instance.new("Frame")
    local v = Instance.new("TextLabel")
    local w = Instance.new("UITextSizeConstraint")
    local x = Instance.new("UIAspectRatioConstraint")
    q.Name = getRandomString(25, true)
    q.Parent = game.CoreGui
    q.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r.Name = "MainFrame"
    r.Visible = false
    r.Parent = q
    r.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    r.Position = UDim2.new(0.871597469, 0, 0.816417277, 0)
    r.Size = UDim2.new(0.128367677, 0, 0.135011435, 0)
    r.BorderSizePixel = 0
    s.Name = "NotiText"
    s.Parent = r
    s.BackgroundColor3 = Color3.fromRGB(44, 120, 224)
    s.BackgroundTransparency = 1.000
    s.Position = UDim2.new(0.0370370373, 0, 0.330508471, 0)
    s.Size = UDim2.new(0.92592591, 0, 0.50000006, 0)
    s.Font = Enum.Font.Gotham
    s.Text = n
    s.TextColor3 = Color3.fromRGB(255, 255, 255)
    s.TextScaled = true
    s.TextSize = 19.000
    s.TextWrapped = true
    t.Parent = s
    t.MaxTextSize = 19
    u.Name = "Bar"
    u.Parent = r
    u.BackgroundColor3 = l
    u.BorderSizePixel = 0
    u.Position = UDim2.new(0, 0, 0.983050823, 0)
    u.Size = UDim2.new(0, 0, 0.0169491544, 0)
    v.Name = "NotiTitle"
    v.Parent = r
    v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v.BackgroundTransparency = 1.000
    v.Position = UDim2.new(0, 0, 0.0593220331, 0)
    v.Size = UDim2.new(0.995884776, 0, 0.271186471, 0)
    v.Font = Enum.Font.GothamSemibold
    v.Text = m
    v.TextColor3 = Color3.fromRGB(68, 68, 68)
    v.TextScaled = true
    v.TextSize = 19.000
    v.TextWrapped = true
    w.Parent = v
    w.MaxTextSize = 19
    x.Parent = r
    x.AspectRatio = 2.059
    r.Position = UDim2.new(1, 0, 0.816417277, 0)
    r.Visible = true
    game:GetService("TweenService"):Create(
        r,
        TweenInfo.new(.6, Enum.EasingStyle.Quart, Enum.EasingDirection.In, 0, false, 0),
        {Position = UDim2.new(0.871597469, 0, 0.816417277, 0)}
    ):Play()
    wait(.8)
    game:GetService("TweenService"):Create(
        u,
        TweenInfo.new(o, Enum.EasingStyle.Quart, Enum.EasingDirection.In, 0, false, 0),
        {Size = UDim2.new(1, 0, 0, 2)}
    ):Play()
    wait(o + 0.2)
    game:GetService("TweenService"):Create(
        r,
        TweenInfo.new(p, Enum.EasingStyle.Quart, Enum.EasingDirection.In, 0, false, 0),
        {Position = UDim2.new(800, 0, r.Position.Y)}
    ):Play()
    wait(p + 0.1)
    q:Destroy()
end
return a
