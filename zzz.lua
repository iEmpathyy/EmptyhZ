local LOAD_TIME = tick()
local queueonteleport = queue_on_teleport or queueonteleport
local setclipboard = toclipboard or setrbxclipboard or setclipboard
local clonefunction = clonefunc or clonefunction
local hookfunction =
    hookfunc or replacecclosure or detourfunction or replacefunc or replacefunction or replaceclosure or detour_function or
        hookfunction
local setthreadidentity = set_thread_identity or setthreadcaps or setthreadidentity
local firetouchinterests = fire_touch_interests or firetouchinterests
local getnamecallmethod = get_namecall_method or getnamecallmethod
local setnamecallmethod = set_namecall_method or setnamecallmethod
local restorefunction = restorefunction or restoreclosure or restorefunc

-- // cloneref function for exploits that dont support it
local a = Instance.new("Part")
for b, c in pairs(getreg()) do
    if type(c) == "table" and #c then
        if rawget(c, "__mode") == "kvs" then
            for d, e in pairs(c) do
                if e == a then
                    getgenv().InstanceList = c;
                    break
                end
            end
        end
    end
end
local f = {}
function f.invalidate(g)
    if not InstanceList then
        return
    end
    for b, c in pairs(InstanceList) do
        if c == g then
            InstanceList[b] = nil;
            return g
        end
    end
end
if not cloneref then
    getgenv().cloneref = f.invalidate
end

getrenv().Visit = cloneref(game:GetService("Visit"))
getrenv().MarketplaceService = cloneref(game:GetService("MarketplaceService")) -- // theres a reason why thats referenced in the roblox environment
getrenv().HttpRbxApiService = cloneref(game:GetService("HttpRbxApiService"))
getrenv().HttpService = cloneref(game:GetService("HttpService"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local ContentProvider = cloneref(game:GetService("ContentProvider"))
local RunService = cloneref(game:GetService("RunService"))
local Stats = cloneref(game:GetService("Stats"))
local Players = cloneref(game:GetService("Players"))
local NetworkClient = cloneref(game:GetService("NetworkClient"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local ProximityPromptService = cloneref(game:GetService("ProximityPromptService"))
local Lighting = cloneref(game:GetService("Lighting"))
local AssetService = cloneref(game:GetService("AssetService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local NetworkSettings = settings().Network
local UserGameSettings = UserSettings():GetService("UserGameSettings")
getrenv().getgenv = clonefunction(getgenv)

local message = Instance.new("Message")
message.Text = "Loading Vouriōus Hub"
message.Name = "ðŸ’‹â€  ð“ð“˜ð“–ð“–ð“â€€! ð“—ð“ð“’ð“š  â€ðŸ’‹"
message.Parent = CoreGui

task.wait(0.25)

getgenv().stealth_call = function(script)
    getrenv()._set = clonefunction(setthreadidentity)
    local old
    old = hookmetamethod(game, "__index", function(a, b)
        task.spawn(function()
            _set(7)
            task.wait(0.1)
            local went, error = pcall(function()
                loadstring(script)()
            end)
            print(went, error)
            if went then
                local check = Instance.new("LocalScript")
                check.Parent = Visit
            end
        end)
        hookmetamethod(game, "__index", old)
        return old(a, b)
    end)
end

local function touch(x)
    x = x:FindFirstAncestorWhichIsA("Part")
    if x then
        if firetouchinterest then
            task.spawn(function()
                firetouchinterest(x, Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), 1)
                wait()
                firetouchinterest(x, Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), 0)
            end)
        end
        x.CFrame = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
    end
end

for i, v in pairs(game.RobloxReplicatedStorage:GetDescendants()) do
    pcall(function()
        v:Destroy()
    end)
end

task.spawn(function()
    local discord = loadstring(game:HttpGet("https://raw.githubusercontent.com/iEmpathyy/EmptyhZ/main/Config%20Wyvern.txt"))()
    local win = discord:Window("Wyvern - Skidded by Vouriōus")
    local serv = win:Server("Vouriōus Hub", "http://www.roblox.com/asset/?id=6031075938")
    local main = serv:Channel("Home")

    main:Label("\nUGC Penetration by xsohe, vouriōus & rass")
    main:Label("Check out the other Social Media to see our available tools!")
    main:Seperator()

    main:Button("WhatsApp Channel", function()
    -- Set the link to be copied
    local link = "https://whatsapp.com/channel/0029VaHheNk4SpkFwASXLd2Q"
    
        -- Copy the link to the clipboard
    pcall(function()
        setclipboard(link)
    end)
    
    -- Display a notification
    discord:Notification("WhatsApp Channel", "Link copied to clipboard!", "Done!")
end)

    main:Button("Discord Server", function()
    -- Set the link to be copied
    local link = "https://discord.com/invite/q3XpBEGsWc"
    
    -- Copy the link to the clipboard
    pcall(function()
        setclipboard(link)
    end)
    
    -- Display a notification
    discord:Notification("Discord Server", "Link copied to clipboard!", "Done!")
end)

    main:Seperator()
    
    main:Label("\nUses SetLocalPlayerInfo() to change your info!")
    main:Textbox("Spoof as player with User ID (Client)", "Enter your new User ID...", false, function(t)
        local tt = tonumber(t)
        if type(tt) == "number" then
            local name = Players:GetNameFromUserIdAsync(tt)
            Players:SetLocalPlayerInfo(tt, name, name, Enum.MembershipType.Premium, false)
            discord:Notification("Success", "You are now " .. name .. "! (" .. tt .. ")", "Okay!")
        else
            discord:Notification("Failed", "Please put a correct User ID.", "Okay!")
        end
    end)
    main:Button("Spoof yourself as the Game Owner", function()
        local name = Players:GetNameFromUserIdAsync(tonumber(game.CreatorId))
        Players:SetLocalPlayerInfo(game.CreatorId, name, name, Enum.MembershipType.Premium, false)
        discord:Notification("Success", "You are now " .. name .. "! (" .. game.CreatorId .. ")", "Okay!")
    end)
    
    main:Seperator()
    
    main:Toggle("Anti Kick (Client)", false, function(bool)
        if bool == "true" then
            local kick;
            kick = hookmetamethod(game, "__namecall", function(obj, ...)
                local args = {...}
                local method = getnamecallmethod()
                if method == "Kick" then
                    if args[1] then
                        discord:Notification("Kick Attempt", "There was an attempt to kick player from client.", "Okay!.")
                    end
                    return nil
                end
                return kick(obj, unpack(args))
            end)
        end
    end)
    main:Toggle("Anti AFK", false, function(bool)
            if bool then
                Players.LocalPlayer.Idled:connect(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end)
            end
        end)
    main:Seperator()
    main:Button("Update Logs", function()
        discord:Notification("Updates", "[+] Added Social Media\n[-] Removed UGC Limited, Player & Network features", "Okay!")
    end)
    main:Button("Skidded Credits", function()
        discord:Notification("Skidded by Vouriōus", "HELPER BY:\nSoheNyz\nRass\nDion\nxqiyaa and others dawg", "Okay!")
    end)

    local remotes = serv:Channel("Remotes")
    remotes:Label(
        "\nFires all remotes in the game as an attempt to prompt the item.\nWarning: This can be risky and can fire a decoy remote!\n")
    remotes:Textbox("UGC Limited Item ID", "Enter Item ID that you wanna be included in the arguments...", false,
        function(t)
            local tt = tonumber(t)
            if type(tt) == "number" then
                getgenv().limitedidforfiringremotewithwyvern = tt
                discord:Notification("Success",
                    "The script now remembers that the Item ID you want is " .. tostring(tt) .. "!", "Okay!")
            else
                discord:Notification("Error", "That's... not an Item ID.", "Okay!")
            end
        end)
    remotes:Dropdown("Remote Arguments...",
        {"No Arguments/Blank", "LocalPlayer", "Your Username", "UGC Item ID", "UGC Item ID, LocalPlayer",
         "LocalPlayer, UGC Item ID", "'UGC' as a string", "UGC Item ID, 'true' boolean", "'true' boolean",
         "literal lua code to prompt item", "loadstring prompt item"}, function(x)
            if not getgenv().limitedidforfiringremotewithwyvern then
                discord:Notification("Error",
                    "You must put a Limited Item ID at the first textbox before firing... Or just set it to blank if you're using this not for the purpose of UGC hunting.",
                    "Okay!")
            else
                local id = getgenv().limitedidforfiringremotewithwyvern
                local fire = function(args)
                    local count = 0
                    for i, v in pairs(game:GetDescendants()) do
                        if v:IsA("RemoteEvent") or v:IsA("UnreliableRemoteEvent") then
                            count = count + 1
                            task.spawn(function()
                                v:FireServer(args)
                            end)
                        elseif v:IsA("RemoteFunction") then
                            count = count + 1
                            task.spawn(function()
                                v:InvokeServer(args)
                            end)
                        end
                    end
                    discord:Notification("Success", "Fired " .. count .. " RemoteEvents and RemoteFunctions!", "Okay!")
                end
                local _fire = function(args, args2)
                    local count = 0
                    for i, v in pairs(game:GetDescendants()) do
                        if v:IsA("RemoteEvent") or v:IsA("UnreliableRemoteEvent") then
                            count = count + 1
                            task.spawn(function()
                                v:FireServer(args, args2)
                            end)
                            pcall(function()
                                v:FireServer(args, args2)
                            end)
                        elseif v:IsA("RemoteFunction") then
                            count = count + 1
                            task.spawn(function()
                                v:InvokeServer(args, args2)
                            end)
                        end
                    end
                    discord:Notification("Success", "Fired " .. count .. " RemoteEvents and RemoteFunctions", "Okay!")
                end
                if x == "No Arguments/Blank" then
                    fire(" ")
                elseif x == "LocalPlayer" then
                    fire(game.Players.LocalPlayer)
                elseif x == "Your Username" then
                    fire(tostring(game.Players.LocalPlayer))
                elseif x == "UGC Item ID" then
                    fire(id)
                elseif x == "UGC Item ID, LocalPlayer" then
                    _fire(id, game.Players.LocalPlayer)
                elseif x == "LocalPlayer, UGC Item ID" then
                    _fire(game.Players.LocalPlayer, id)
                elseif x == "'UGC' as a string" then
                    fire("UGC")
                elseif x == "UGC Item ID, 'true' boolean" then
                    _fire(id, true)
                elseif x == "'true' boolean" then
                    fire(true)
                elseif x == "literal lua code to prompt item" then
                    fire('game:GetService("MarketplaceService"):PromptPurchase(game.Players.' ..
                             tostring(game.Players.LocalPlayer) .. ', ' .. tostring(id) .. ')')
                elseif x == "loadstring prompt item" then
                    fire('loadstring(`game:GetService("MarketplaceService"):PromptPurchase(game.Players.' ..
                             tostring(game.Players.LocalPlayer) .. ', ' .. tostring(id) .. ')`)()')
                end
            end
        end)
    remotes:Seperator()
    remotes:Label(
        "\nThis will block client communication with the server.\nUseful for bypassing clientsided anticheats!\n")
    remotes:Toggle("Block All RemoteEvents and RemoteFunctions", false, function(bool)
        if bool then
            local Methods = {"FireServer", "fireserver", "InvokeServer", "invokeserver", "Fire", "fire", "Invoke",
                             "invoke"}

            getgenv().Toggleblock = true
            local OldNameCall = nil
            OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(...)
                local Self = ...
                if table.find(Methods, getnamecallmethod()) then
                    if Toggle and Self then
                        return
                    end
                end
                return OldNameCall(...)
            end))
        else
            getgenv().Toggleblock = false
        end
    end)
    remotes:Seperator()
    remotes:Button("Print All Remotes (Includes Path)", function()
        for i, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                print("RemoteEvent: " .. v:GetFullName())
            elseif v:IsA("RemoteFunction") then
                print("RemoteFunction: " .. v:GetFullName())
            elseif v:IsA("UnreliableRemoteEvent") then
                print("UnreliableRemoteEvent: " .. v:GetFullName())
            end
        end
        discord:Notification("Success", "Check console by clicking F9 or typing '/console' in the chat.", "Okay!")
        local input = loadstring(game:HttpGet('https://pastebin.com/raw/dYzQv3d8'))()
        input.press(Enum.KeyCode.F9)
    end)
    local games = serv:Channel("Games")
    local antikickonteleport = false
    games:Toggle("Inject Anti Kick on Teleport", false, function(bool)
        if bool then
            antikickonteleport = true
        else
            antikickonteleport = false
        end
    end)
    games:Label("\nBelow is a list of subplaces of this game.\nChoose the one that you want to be teleported into!")
    local places = {}
    local placeids = {}
    local pp = AssetService:GetGamePlacesAsync()
    while true do
        for _, place in pp:GetCurrentPage() do
            table.insert(places, place.Name)
            table.insert(placeids, place.PlaceId)
        end
        if pp.IsFinished then
            break
        end
        pp:AdvanceToNextPageAsync()
    end
    games:Dropdown("Subplace/Hidden Games List", places, function(x)
        local index = nil
        for i, name in ipairs(places) do
            if name == x then
                index = i
                break
            end
        end

        if index then
            local placeId = placeids[index]
            discord:Notification("Teleporting", "Teleporting to...\n" .. x .. "\nGame ID: " .. placeId, "Okay!")
            if antikickonteleport then
                pcall(function()
                    queueonteleport(
                        'local kick; kick = hookmetamethod(game, "__namecall", function(obj, ...) local args = {...} local method = getnamecallmethod() if method == "Kick" then if args[1] then print("...") end return nil end return kick(obj, unpack(args)) end)')
                end)
                TeleportService:Teleport(placeId, Players.LocalPlayer)
            else
                TeleportService:Teleport(placeId, Players.LocalPlayer)
            end
        else
            discord:Notification("Error", "Place not found... Well this shouldn't have happened. WTF.", "Okay!")
        end
    end)
    games:Label("If you only see the main game, no other subplaces found.")
    games:Seperator()
    games:Textbox("Pause gameplay for a specified amount of time.",
        "How long do you want to pause the game for? (In seconds)", true, function(t)
            local tt = tonumber(t)
            if type(tt) == "number" then
                Players.LocalPlayer.GameplayPaused = true
                task.wait()
                Players.LocalPlayer.GameplayPaused = false
                task.wait()
                Players.LocalPlayer.GameplayPaused = true
                task.wait(tt)
                Players.LocalPlayer.GameplayPaused = false
            else
                discord:Notification("Error", "You must enter a number. (In seconds)", "Okay!")
            end
        end)
    games:Label("Pausing the gameplay will overlay everything,\nEvery UI becomes unclickable.")
    games:Seperator()
    games:Toggle("Force Full Bright Lighting", false, function()
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end)
    games:Button("Teleport to Smallest Server", function()
        local gameapi = "https://games.roblox.com/v1/games/"
        local _place = game.PlaceId
        local _servers = gameapi .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
            local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
            return HttpService:JSONDecode(Raw)
        end
        local Server, Next;
        repeat
            local Servers = ListServers(Next)
            Server = Servers.data[1]
            Next = Servers.nextPageCursor
        until Server
        discord:Notification("Teleporting", "Teleporting to...\n" .. game.PlaceId .. "\nJob ID: " .. Server.id, "Okay!")
        if antikickonteleport then
            pcall(function()
                queueonteleport(
                    'local kick; kick = hookmetamethod(game, "__namecall", function(obj, ...) local args = {...} local method = getnamecallmethod() if method == "Kick" then if args[1] then print("...") end return nil end return kick(obj, unpack(args)) end)')
            end)
            TeleportService:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
        else
            TeleportService:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
        end
    end)
    games:Button("Force Close Roblox App", function()
        game:Shutdown()
    end)
    games:Label("Current Game's Place ID:\n" .. game.PlaceId)
    games:Label("Current Game's Universe ID:\n" .. game.GameId)
    games:Label("Current Game's Job ID: \n" .. game.JobId)
    
    local input = serv:Channel("Input Automations")
        
    input:Toggle("Auto Grab All Dropped Tools", false, function(bool)
        if bool then
            for i, v in pairs(workspace:GetChildren()) do
                if Players.LocalPlayer.Character:FindFirstChild("Humanoid") and v:IsA("BackpackItem") and
                    v:FindFirstChild("Handle") then
                    Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(v)
                end
            end
            if getgenv().connected then
                getgenv().connected:Disconnect()
            end
            getgenv().connected = workspace.ChildAdded:Connect(function(child)
                if Players.LocalPlayer.Character:FindFirstChild("Humanoid") and child:IsA("BackpackItem") and
                    child:FindFirstChild("Handle") then
                    Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(child)
                end
            end)
        elseif not bool then
            if getgenv().connected then
                getgenv().connected:Disconnect()
            end
        end
    end)
    input:Toggle("Infinite ProximityPrompt Range", false, function(bool)
        if bool then
            ProximityPromptService.MaxPromptsVisible = math.huge
            for i, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.MaxActivationDistance = math.huge
                end
            end
        elseif not bool then
            ProximityPromptService.MaxPromptsVisible = 16
            for i, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.MaxActivationDistance = 10
                end
            end
        end
    end)
    input:Toggle("Instant ProximityPrompt", false, function(bool)
        local promptsignal = nil
        if bool then
            promptsignal = nil
            task.wait()
            promptsignal = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
                pcall(function()
                    fireproximityprompt(prompt)
                end)
            end)
        elseif not bool then
            if promptsignal ~= nil then
                promptsignal:Disconnect()
                promptsignal = nil
            end
        end
    end)
    input:Button("Equip All Tools", function()
        for i, v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = Players.LocalPlayer.Character
            end
        end
    end)
    input:Button("Force Drop Tool", function()
        for i, v in pairs(Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = workspace
            end
        end
    end)
    input:Seperator()
    input:Button("Fire All ClickDetectors", function()
        for i, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ClickDetector") then
                v.MaxActivationDistance = math.huge
                pcall(function()
                    fireclickdetector(v)
                end)
            end
        end
    end)
    input:Button("Fire All TouchInterests", function()
        for i, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                touch(v)
            end
        end
    end)
    input:Button("Fire All ProximityPrompts", function()
        for i, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                pcall(function()
                    fireproximityprompt(v)
                end)
            end
        end
    end)
    local purchase = serv:Channel("Purchase Exploits")
    local x_x = HttpService:JSONDecode(game:HttpGet(
        "https://apis.roblox.com/developer-products/v1/developer-products/list?universeId=" .. game.GameId .. "&page=1"))
    local dnames = {}
    local dproductIds = {}
    if type(x_x.DeveloperProducts) == "nil" then
        table.insert(dnames, " ")
    end

    pcall(function()

        local currentPage = 1

        repeat
            local response = game:HttpGet(
                "https://apis.roblox.com/developer-products/v1/developer-products/list?universeId=" ..
                    tostring(game.GameId) .. "&page=" .. tostring(currentPage))
            local decodedResponse = HttpService:JSONDecode(response)
            local developerProducts = decodedResponse.DeveloperProducts
            print("Page " .. currentPage .. ":")
            for _, developerProduct in pairs(developerProducts) do
                table.insert(dnames, developerProduct.Name)
                table.insert(dproductIds, developerProduct.ProductId)
            end
            currentPage = currentPage + 1
            local final = decodedResponse.FinalPage
        until final

    end)
    purchase:Label("Fake Purchaser!\nThis tricks server that you bought a DevProduct!")
    purchase:Label("Only works in some games...")
    local index
    purchase:Dropdown("Below is a list of all DevProducts in this game!", dnames, function(x)
        index = nil
        for i, name in ipairs(dnames) do
            if name == x then
                index = i
                break
            end
        end
    end)
    getgenv().wyvernlooppurchases = false
    purchase:Label("If nothing shows above, no DevProducts found.")
    purchase:Toggle("Loop Selected Dev Product", false, function(bool)
        getgenv().wyvernlooppurchases = bool
        while getgenv().wyvernlooppurchases == true and task.wait() do
            if index then
                local product = dproductIds[index]
                pcall(function()
                    stealth_call('MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, ' ..product .. ', true) ')
                end)
            end
        end
    end)
    purchase:Button("Fire Selected Dev Product!", function()
        if index then
            local product = dproductIds[index]
            pcall(function()
                stealth_call(
                    'MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, ' ..
                        product .. ', true) ')
            end)
            task.wait(0.2)
            if not Visit:FindFirstChild("LocalScript") then
                discord:Notification("Error", "Your executor blocked function SignalPromptProductPurchaseFinished.",
                    "Okay!")
            else
                discord:Notification("Success",
                    "Fired PromptProductPurchaseFinished signal to server with productId: " .. tostring(product),
                    "Okay!")
                Visit:FindFirstChild("LocalScript"):Destroy()
            end
        else
            discord:Notification("Error", "Something went wrong but I don't know what.", "Okay!")
        end
    end)
    purchase:Button("Fire All Dev Products", function()
        getrenv()._set = clonefunction(setthreadidentity)
        local starttickcc = tick()
        for i, product in pairs(dproductIds) do
            task.spawn(function()
                pcall(function()
                    stealth_call(
                        'MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, ' ..
                            product .. ', true) ')
                end)
            end)
            task.wait()
        end
        local endtickcc = tick()
        local durationxd = endtickcc - starttickcc
        discord:Notification("Attempt", "Fired All Dev Products! Took ".. tostring(durationxd)  .. " Seconds!", "Okay!")
    end)
    getgenv().wyvernlooppurchases2 = false
    purchase:Toggle("Loop All Dev Products", false, function(bool)
        getgenv().wyvernlooppurchases2 = bool
        while getgenv().wyvernlooppurchases2 == true and task.wait() do
            for i, product in pairs(dproductIds) do
                task.spawn(function()
                    pcall(function()
                        stealth_call('MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, ' ..product .. ', true) ')
                    end)
                end)
                task.wait()
            end
        end
    end)
    purchase:Seperator()
    purchase:Label("Pretty much the same as the one above but for gamepass")
    local wyverngamepass = game.HttpService:JSONDecode(game:HttpGet(
        "https://games.roblox.com/v1/games/" .. game.GameId .. "/game-passes?limit=100&sortOrder=1"))
    local gnames = {}
    local gproductIds = {}
    for i, v in pairs(wyverngamepass.data) do
        table.insert(gnames, v.name)
        table.insert(gproductIds, v.id)
    end
    local gamepass
    purchase:Dropdown("Below is a list of all GamePass in this game!", gnames, function(x)
        for i, name in ipairs(gnames) do
            if name == x then
                gamepass = gproductIds[i]
                break
            end
        end

    end)
    purchase:Label("If nothing shows above, no GamePass found.")
    purchase:Button("Fire Selected Gamepass", function()
        if gamepass then
            pcall(function()
                stealth_call('MarketplaceService:SignalPromptGamePassPurchaseFinished(game.Players.LocalPlayer, ' ..
                                 tostring(gamepass) .. ', true)')
            end)
            task.wait(0.2)
            if not Visit:FindFirstChild("LocalScript") then
                discord:Notification("Error", "Your executor blocked function SignalPromptGamePassPurchaseFinished.",
                    "Okay!")
            else
                discord:Notification("Success",
                    "Fired PromptProductGamePassPurchaseFinished signal to server with productId: " ..
                        tostring(gamepass), "Okay!")
                Visit:FindFirstChild("LocalScript"):Destroy()
            end
        else
            discord:Notification("Error", "Something went wrong but I don't know what.", "Okay!")
        end
    end)
    purchase:Seperator()
    purchase:Label("Signals to server that an item purchase failed.")
    purchase:Label("This can trick servers to reprompt an item!")
    local returnvalprompt = false
    purchase:Toggle("Item Purchase Success Return Value", returnvalprompt, function(bool)
        returnvalprompt = bool
    end)
    purchase:Textbox("Item ID of the UGC item", "Enter the Item ID...", false, function(t)
        local tt = tonumber(t)
        if type(tt) == "number" then
            pcall(function()
                stealth_call('MarketplaceService:SignalPromptPurchaseFinished(game.Players.LocalPlayer, ' .. tt ..
                                 ', false) MarketplaceService:SignalPromptPurchaseFinished(game.Players.LocalPlayer, ' ..
                                 tt .. ', ' .. tostring(returnvalprompt) ')')
            end)
            task.wait(0.2)
            if not Visit:FindFirstChild("LocalScript") then
                discord:Notification("Error", "Your executor blocked function SignalPromptPurchaseFinished.", "Okay!")
            else
                discord:Notification("Success",
                    "Fired signal PromptPurchaseFinished with bool false and productId: " .. tostring(tt), "Okay!")
                Visit:FindFirstChild("LocalScript"):Destroy()
            end
        else
            discord:Notification("Error", "That's... Not an Item ID.", "Okay!")
        end
    end)
    purchase:Seperator()
    local serv2 = win:Server("Create by xsohe", "")
    local ajg = serv2:Channel("Universal Script")
    ajg:Label("ini adalah script universal yg gw tambahin sendiri berdasarkan yg gw tau \nklo mo request ntar gw tmbahin fiturnya")

    ajg:Seperator()
    ajg:Button("Infinite Yield", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/Infiniteyield/master/source"), true)()
    end)

    ajg:Button("Ghost Hub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
    end)

    ajg:Button("Keyboard", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advhsjjdhxsidifvsh/mobkeyboard/main/main.txt", true))()
    end)
    
    ajg:Button("Fly UI", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ddaveyz/Fix-Fly-V4/main/Fly.lua"))()
    end)

    main:Label("                            Wynerd loaded in " ..
                   string.format("%s seconds.", string.format("%.2f", tostring(tick() - LOAD_TIME))))
    pcall(function()
        message:Destroy()
    end)
end)
