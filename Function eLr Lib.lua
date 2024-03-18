local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/eLriver/eLr-UI-Library/main/source.lua"))()

local Window = Library:CreateWindow("Window", game.CoreGui)

local Tab = Window:CreateTab("Tab")

local Section = Tab:CreateSection("Section")

Section:CreateLabel("Label")
--[[ Update Label by
local label = Section:CreateLabel("Label")
    label:UpdateText("NewText")
]]

Section:CreateButton("Button", function ()
    print("Clicked")
end)
--[[ Update Button by
local button = Section:CreateButton("Label")
    button:UpdateButton("NewText")
]]
Section:CreateToggle("Toggle", "Info", false, function (v)
    if v then
        print("On")
    else
        print("Off")
    end
end)

Section:CreateSlider("Slider", 1, 100, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

Section:CreateDropdown("Dropdown", {"Thing1", "Thing2", "Thing3"}, function(v)
    print(v)
end)
--[[ Refresh Dropdown by
    local oldList = {
    "2019",
    "2020"
    }
    local newList = {
    "2021",
    "2022"
    }
    local dropdown = Section:CreateDropdown("Dropdown", oldList, function(v)
        print(v)
    end)
    Section:CreateButton("Update Dropdown", function()
        dropdown:Refresh(newList)
    end)
]]
Section:CreateSearchBox("SearchBox", {"table", "ant", "bat", "cat"}, function(v)
    print(v)
end)
--[[ Refresh Dropdown by
    local oldList = {
    "2019",
    "2020"
    }
    local newList = {
    "2021",
    "2022"
    }
    local dropdown = Section:CreateDropdown("Dropdown", oldList, function(v)
        print(v)
    end)
    Section:CreateButton("Update Dropdown", function()
        dropdown:Refresh(newList)
    end)
]]
Section:CreateDropSelect("DropSelect", {"nothing", "easter", "Moon"}, function(v)
    print(v) -- v is a table
end)
--[[ Refresh Dropdown by
    local oldList = {
    "2019",
    "2020"
    }
    local newList = {
    "2021",
    "2022"
    }
    local dropdown = Section:CreateDropdown("Dropdown", oldList, function(v)
        print(v)
    end)
    Section:CreateButton("Update Dropdown", function()
        dropdown:Refresh(newList)
    end)
]]