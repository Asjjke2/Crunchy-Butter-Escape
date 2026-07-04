-- ========================================================
-- واجهة المستخدم النهائية المستقرة [نسخة سحب الصورة والإطار الأسود]
-- ========================================================
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local ButtonsScroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- نافذة التأكيد لراكان
local ConfirmFrame = Instance.new("Frame")
local ConfirmText = Instance.new("TextLabel")
local YesBtn = Instance.new("TextButton")
local NoBtn = Instance.new("TextButton")

-- الزر العائم المطور (نظام إطار أسود كامل وقابل للسحب)
local ToggleButton = Instance.new("Frame")
local ToggleImage = Instance.new("ImageButton")
local UICorner_Frame = Instance.new("UICorner")
local UICorner_Image = Instance.new("UICorner")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- القائمة الرئيسية
MainFrame.Name = "KhaledCrunchyFinalHub"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 280, 0, 260)
MainFrame.Active = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, -40, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Text = "سكربت خالد الاسطوره"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 15
Title.Font = Enum.Font.SourceSansBold

-- زر الإغلاق المربع X
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(0, 40, 0, 45)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.SourceSansBold

ButtonsScroll.Parent = MainFrame
ButtonsScroll.Position = UDim2.new(0.05, 0, 0.22, 0)
ButtonsScroll.Size = UDim2.new(0.9, 0, 0, 180)
ButtonsScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ButtonsScroll.ScrollBarThickness = 6

UIListLayout.Parent = ButtonsScroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- إعداد نافذة التأكيد
ConfirmFrame.Parent = ScreenGui
ConfirmFrame.Size = UDim2.new(0, 240, 0, 130)
ConfirmFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ConfirmFrame.Visible = false
ConfirmFrame.Active = true

ConfirmText.Parent = ConfirmFrame
ConfirmText.Size = UDim2.new(1, 0, 0, 60)
ConfirmText.Text = "متاكد يا راكان يا زق  تبي تشغله؟"
ConfirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmText.TextSize = 16
ConfirmText.Font = Enum.Font.SourceSansBold
ConfirmText.BackgroundTransparency = 1

YesBtn.Parent = ConfirmFrame
YesBtn.Size = UDim2.new(0, 90, 0, 35)
YesBtn.Position = UDim2.new(0.08, 0, 0.55, 0)
YesBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
YesBtn.Text = "نعم"
YesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.TextSize = 14
YesBtn.Font = Enum.Font.SourceSansBold

NoBtn.Parent = ConfirmFrame
NoBtn.Size = UDim2.new(0, 90, 0, 35)
NoBtn.Position = UDim2.new(0.55, 0, 0.55, 0)
NoBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
NoBtn.Text = "لا"
NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoBtn.TextSize = 14
NoBtn.Font = Enum.Font.SourceSansBold

-- إنشاء الزر العائم - إطار أسود كامل ومستقل
ToggleButton.Name = "KhaledCustomDragButton"
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 48, 0, 48) -- حجم عادي ومناسب
ToggleButton.Position = UDim2.new(0.02, 0, 0.4, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- إطار أسود صريح
ToggleButton.BackgroundTransparency = 0
ToggleButton.Visible = false
ToggleButton.Active = true

UICorner_Frame.CornerRadius = UDim.new(0, 6)
UICorner_Frame.Parent = ToggleButton

-- الصورة داخل الإطار الأسود
ToggleImage.Parent = ToggleButton
ToggleImage.Size = UDim2.new(0, 40, 0, 40) -- أصغر قليلاً ليظهر الإطار الأسود حولها
ToggleImage.Position = UDim2.new(0.5, -20, 0.5, -20)
ToggleImage.BackgroundTransparency = 1
ToggleImage.Image = "rbxassetid://117228230346733" -- معرف صورتك الجديدة

UICorner_Image.CornerRadius = UDim.new(0, 4)
UICorner_Image.Parent = ToggleImage

-- ========================================================
-- دالة التحريك السلس المحسنة (تدعم سحب الزر من الصورة مباشرة)
-- ========================================================
local function makeDraggable(frame, customHandle)
    local UserInputService = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos
    local handle = customHandle or frame
    
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

makeDraggable(MainFrame)
makeDraggable(ToggleButton, ToggleImage) -- الآن الصورة تعمل كمقبض سحب للزر بالكامل
makeDraggable(ConfirmFrame)

-- فتح وإغلاق الواجهة (مع نظام منع التداخل مع السحب)
local dragThreshold = 5
local clickStartPos = Vector3.new()

ToggleImage.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        clickStartPos = input.Position
    end
end)

ToggleImage.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local delta = (input.Position - clickStartPos).Magnitude
        if delta < dragThreshold then -- إذا لم تكن حركة سحب، يتم فتح القائمة
            MainFrame.Visible = true
            ToggleButton.Visible = false
        end
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ConfirmFrame.Visible = false
    ToggleButton.Visible = true
end)

-- ========================================================
-- البرمجة والتشغيل الفعلي للـ Win بالتعريب الكامل والإيقاف
-- ========================================================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local activeWinLoop = nil
local pendingPart = nil
local pendingButtonUI = nil

local function touchPart(part)
    if part and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        hrp.CFrame = part.CFrame * CFrame.new(0, 2, 0)
        if firetouchinterest then
            firetouchinterest(hrp, part, 0)
            task.wait(0.02)
            firetouchinterest(hrp, part, 1)
        end
    end
end

local foundButtons = {}
local buttonToggles = {}
local winCounter = 1

for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("TouchTransmitter") and v.Parent then
        local btnPart = v.Parent
        local btnName = btnPart.Name
        
        for _, child in pairs(btnPart:GetDescendants()) do
            if child:IsA("TextLabel") and (string.find(child.Text, "+") or string.find(child.Text:lower(), "win")) then
                btnName = child.Text
                break
            end
        end
        
        if (string.find(btnName:lower(), "win") or string.find(btnName, "+")) 
        and not string.find(btnName:lower(), "killbrick") 
        and not string.find(btnName:lower(), "spacepart") 
        and not foundButtons[btnPart] then
            
            foundButtons[btnPart] = true
            buttonToggles[btnPart] = false
            
            local NewBtn = Instance.new("TextButton")
            NewBtn.Parent = ButtonsScroll
            NewBtn.Size = UDim2.new(1, -10, 0, 35)
            NewBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            NewBtn.Text = "تفعيل تلقائي: فوز " .. tostring(winCounter)
            NewBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            winCounter = winCounter + 1
            
            ButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
            
            NewBtn.MouseButton1Click:Connect(function()
                if not buttonToggles[btnPart] then
                    pendingPart = btnPart
                    pendingButtonUI = NewBtn
                    ConfirmFrame.Visible = true
                else
                    activeWinLoop = nil
                    buttonToggles[btnPart] = false
                    NewBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                end
            end)
        end
    end
end

YesBtn.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
    if pendingPart and pendingButtonUI then
        activeWinLoop = nil
        for part, _ in pairs(buttonToggles) do
            buttonToggles[part] = false
        end
        for _, child in pairs(ButtonsScroll:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            end
        end
        
        task.wait(0.1)
        
        local currentLoop = pendingPart
        activeWinLoop = currentLoop
        buttonToggles[currentLoop] = true
        pendingButtonUI.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        
        task.spawn(function()
            while activeWinLoop == currentLoop do
                touchPart(currentLoop)
                task.wait(0.3)
            end
            pendingButtonUI.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            buttonToggles[currentLoop] = false
        end)
    end
end)

NoBtn.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
    pendingPart = nil
    pendingButtonUI = nil
end)
