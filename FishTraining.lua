-- Ensure the script only runs in Fish Training
if game.PlaceId == 116432016116625 then
    -- UNIVERS Hub for Fish Training
    local CurrentVersion = "🌟 UNIVERS Hub v1 🌌 | Fish Training 🎣"
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    -- Create Main Window
    local Window = Rayfield:CreateWindow({
        Name = CurrentVersion,
        LoadingTitle = "🌌 Loading Univers Hub v1... 🌌",
        LoadingSubtitle = "By 🌟 Univers Team 🌌",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "UniversHubConfigs",
            FileName = "FishTraining"
        },
        Discord = { Enabled = true, Invite = "PwbtqEDT", RememberJoins = true }
    })

    -- ===================== TABS ===================== --
    local homeTab = Window:CreateTab("🏠 Home")
    homeTab:CreateSection("Welcome to Univers Hub!")
    homeTab:CreateParagraph({
        Title = "🌟 About",
        Content = "Univers Hub enhances your Fish Training experience with powerful and easy-to-use features."
    })

    local mainTab = Window:CreateTab("🎣 Main Features")
    local miscTab = Window:CreateTab("⚙️ Miscellaneous")
    local communityTab = Window:CreateTab("🌐 Community")

    -- ===================== MAIN FEATURES ===================== --
    mainTab:CreateSection("Automated Features")

    -- Infinite Wins
    local isInfWinEnabled = false
    mainTab:CreateToggle({
        Name = "Infinite Wins",
        Flag = "InfWinToggle",
        Callback = function(state)
            isInfWinEnabled = state
            Rayfield:Notify({
                Title = "Infinite Wins",
                Content = isInfWinEnabled and "Enabled" or "Disabled",
                Duration = 3
            })
            while isInfWinEnabled do
                pcall(function()
                    game:GetService("ReplicatedStorage").Events.GiveWins:FireServer(1e6) -- Replace with the correct event for wins
                end)
                task.wait(0.5)
            end
        end
    })

    -- Auto Rebirth
    local isAutoRebirthEnabled = false
    mainTab:CreateToggle({
        Name = "Auto Rebirth",
        Flag = "AutoRebirthToggle",
        Callback = function(state)
            isAutoRebirthEnabled = state
            Rayfield:Notify({
                Title = "Auto Rebirth",
                Content = isAutoRebirthEnabled and "Enabled" or "Disabled",
                Duration = 3
            })
            while isAutoRebirthEnabled do
                pcall(function()
                    game:GetService("ReplicatedStorage").Events.Rebirth:FireServer() -- Replace with the correct event for rebirth
                end)
                task.wait(1)
            end
        end
    })

    -- Auto Training
    local isAutoTrainingEnabled = false
    mainTab:CreateToggle({
        Name = "Auto Train Strength",
        Flag = "AutoTrainToggle",
        Callback = function(state)
            isAutoTrainingEnabled = state
            Rayfield:Notify({
                Title = "Auto Train",
                Content = isAutoTrainingEnabled and "Enabled" or "Disabled",
                Duration = 3
            })
            while isAutoTrainingEnabled do
                pcall(function()
                    game:GetService("ReplicatedStorage").Events.TrainStrength:FireServer() -- Replace with the correct event for training
                end)
                task.wait(0.3)
            end
        end
    })

    -- ===================== MISCELLANEOUS FEATURES ===================== --
    miscTab:CreateSection("Player Tweaks")

    -- Speed and Jump Power Sliders
    miscTab:CreateSlider({
        Name = "Walk Speed",
        Range = { 16, 300 },
        Increment = 5,
        CurrentValue = 16,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    })

    miscTab:CreateSlider({
        Name = "Jump Power",
        Range = { 50, 300 },
        Increment = 10,
        CurrentValue = 50,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end
    })

    -- Anti-Staff Detection
    miscTab:CreateSection("Anti-Staff")
    miscTab:CreateButton({
        Name = "Enable Anti-Staff",
        Callback = function()
            local staffRanks = { "Owner", "Admin", "Moderator" } -- Add appropriate staff ranks
            game.Players.PlayerAdded:Connect(function(player)
                if table.find(staffRanks, player:GetRoleInGroup(123456)) then -- Replace with group ID
                    game.Players.LocalPlayer:Kick("Staff member detected. Leaving the game!")
                end
            end)
            Rayfield:Notify({
                Title = "Anti-Staff Enabled",
                Content = "You will automatically leave if a staff member joins.",
                Duration = 5
            })
        end
    })

    -- ===================== COMMUNITY FEATURES ===================== --
    communityTab:CreateSection("Join Us")
    communityTab:CreateButton({
        Name = "Copy Discord Link",
        Callback = function()
            setclipboard("https://discord.gg/PwbtqEDT")
            Rayfield:Notify({
                Title = "Discord Link Copied",
                Content = "Join the Univers Hub community on Discord!",
                Duration = 3
            })
        end
    })

    -- ===================== FINAL NOTIFICATION ===================== --
    Rayfield:Notify({
        Title = "Script Loaded",
        Content = "Welcome to Univers Hub for Fish Training!",
        Duration = 5
    })

else
    warn("This script is not compatible with the current game.")
end
