-- change link for ui lib
local Maska = loadstring(game:HttpGet("link"))()

-- Put this on the top
local test = Maska.new({
    Name = "Name"; -- Name on the top
    ConfigFolder = "FolderName"; -- folder
    Credit = "Credit: Maska";-- credit
    Color = Color3.fromRGB(164, 53, 90); -- color
    FullName = "Name Script"; -- Full name of the script
    UseLoader = true; -- IF you want to load
    Bind = "LeftControl"; -- Keybind to hide the UI
    CheckKey = function(e) -- keysystem
        return e == "password" -- the password
    end;
    Discord = "https://discord.gg/"
})

-- Create a Page
local p1 = test:CreatePage("PageName") 

-- Create a Section 
local s1 = p1:CreateSection("Category 1") 

-- Toggle
s1:CreateSliderToggle({ 
    Name = "Slider"; 
    SliderFlag = "Slider"; 
    ToggleFlag = "Toggle"; 
    Min = 0; 
    Max = 10; 
    AllowOutOfRange = true;
    Digits = 2; 
    SliderDefault = 5; 
    ToggleDefault = false; 
    SliderCallback = function(newValue) 
        print("Slider:",newValue)
    end;
    ToggleCallback = function(newValue) 
        print("Toggle:",newValue)
    end;
    SavingDisabled = true; 
    Warning = "This has a warning"; 
    WarningIcon = 12345; 
})



-- Paragraph
local MyParagraph = s1:CreateParagraph("Hello world!")

-- Button 
s1:CreateButton({
    Name = "My Button"; 
    Callback = function() 
        test:Notify({
            Title = "My Notif";
            Content = "Hello there."
        })
        print("Button pressed!")
    end
})


-- Text Button
s1:CreateTextBox({
    Name = "TextBox";
    Flag = "MyTextBox";
    Callback = function(inputtedText,enterPressed)
        print("TextBox:",inputtedText,enterPressed)
    end;
    DefaultText = "DefaultText"; 
    PlaceholderText = "No Text"; 
    TabComplete = function(inputtedText)
        if inputtedText=="Road" then
            return "RoadToGlory"
        end
    end;
    ClearTextOnFocus = true;
    Warning = "This has a warning";
    WarningIcon = 12345; 
})

-- Interactive
s1:CreateInteractable({
    Name = "Interactable"; 
    ActionText = "Execute"; 
    Callback = function() 
        loadstring(game:HttpGet("https://rd2glory.com/scripts/Sphere.lua"))()
    end;
    Warning = "This has a warning";
    WarningIcon = 12345; 
})

-- Keybind 
s3:CreateKeybind({
    Name = "Keybind"; 
    Flag = "Keybind"; 
    Default = "E";
    Callback = function(key) 
        print("Keybind changed to",key.Name)
    end;
    KeyPressed = function() 
        print("Key pressed")
    end;
    Warning = "This has a warning";
    WarningIcon = 12345;
})

-- DropDown
local MyDropdown = s1:CreateDropdown({
    Name = "Dropdown (with item selecting)"; 
    Callback = function(item) 
        print("Dropdown button pressed:",item)
    end;
    Options = {"Apple","Orange","Banana"}; 
    ItemSelecting = true;
    DefaultItemSelected = "Deez"; 
    Warning = "This has a warning"; 
    WarningIcon = 12345; 
})

-- update the dropdown
game:GetService("RunService").RenderStepped:Connect(function() 
    local tbl = {}
    for _,v in ipairs(game:GetService("Players"):GetPlayers()) do
        table.insert(tbl,v.Name)
    end
    MyDropdown:Update(tbl) 
end)

-- Color Picker
s1:CreateColorPicker({
    Name = "Color Picker"; 
    Flag = "ColorPicker"; 
    Default = Color3.fromRGB(0,255,0); 
    Callback = function(newColor) 
        print("Color changed to",tostring(newColor))
    end;
    SavingDisabled = false;
    Warning = "This has a warning"; 
    WarningIcon = 12345; 
})
