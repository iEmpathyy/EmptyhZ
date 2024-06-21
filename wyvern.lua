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
message.Text = "loading wynerd"
message.Name =
    "ðŸ’‹â€  ð“ð“˜ð“–ð“–ð“â€€! ð“—ð“ð“’ð“š  â€ðŸ’‹"
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
    local discord = loadstring(game:HttpGet("https://raw.githubusercontent.com/iRasz/Script/main/Config%20Wyvern"))()
    local win = discord:Window("Wynerd 1.269.4 - redblues edition skided by Rass")
    local serv = win:Server("Wynerd", "http://www.roblox.com/asset/?id=6031075938")
    local main = serv:Channel("Home")
    main:Label("\nThank you for using Wynerd!\nThe #2 UGC Games Penetration Testing Tool! (mine is still better)")
    main:Label("Social Media")
    main:Seperator()
    -- main:Label("\n\nPlanned:\n- The Explorer you see at the left side of your screen\n- Move some stuff that doesn't belong in their category\n- More features\n- New techniques to get free UGC items from games")
    main:Button("Join My Discord Channel", function()
    local link = "https://discord.com/invite/q3XpBEGsWc", function()
    main:Button("Join My WhatsApp Channel", function()
    -- Set the link to be copied
    local link = "https://whatsapp.com/channel/0029VaHheNk4SpkFwASXLd2Q"
    
    -- Copy the link to the clipboard
    pcall(function()
        setclipboard(link)
    end)
    
    -- Display a notification
    discord:Notification("Join the WhatsApp Channel", "Link copied to clipboard!", "Okay!")
end)
    discord:Notification("Join the Discord Channel?", "Link copied to clipboard!", "Okay!")
end)

    main:Toggle("Anti Kick (Client)", false, function(bool)
        if bool == "true" then
            local kick;
            kick = hookmetamethod(game, "__namecall", function(obj, ...)
                local args = {...}
                local method = getnamecallmethod()
                if method == "Kick" then
                    if args[1] then
                        discord:Notification("Kick Attempt", "There was an attempt to kick player from client.", "Okay.")
                    end
                    return nil
                end
                return kick(obj, unpack(args))
            end)
        end
    end)
    main:Seperator()
    main:Button("Update Logs", function()
        discord:Notification("Updates", "+ Added Social Media links", "Okay!")
    end)
    main:Button("Credits", function()
        discord:Notification("Credits", "Rass & Shinki", "Okay!")
    end)

    local ugc = serv:Channel("UGC Limiteds")
    ugc:Label("Looking for Remote Bruteforcing? Check out #Remotes!")
    ugc:Seperator()
    ugc:Label(
        "\nThis will auto purchase any limited that gets prompted!\nThis is recommended to use in the rolimons game.\n")
    ugc:Label("With this, you can get #1 serials of web UGC item drops!")
    ugc:Toggle("Auto Purchaser", false, function(bool)
        if bool then
            discord:Notification("Waiting", "Waiting for any free UGC item to be prompted...", "Okay!")
            getrenv()._set = clonefunction(setthreadidentity)
            local old
            old = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7)
                    task.wait()
                    getgenv().promptpurchaserequestedv2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(
                        function(...)
                            discord:Notification("Prompt Detected",
                                "If this is a UGC item, this script will attempt purchase. Please check console.",
                                "Okay!")
                            local startTime = tick()
                            t = {...}
                            local assetId = t[2]
                            local idempotencyKey = t[5]
                            local purchaseAuthToken = t[6]
                            local info = MarketplaceService:GetProductInfo(assetId)
                            local productId = info.ProductId
                            local price = info.PriceInRobux
                            local collectibleItemId = info.CollectibleItemId
                            local collectibleProductId = info.CollectibleProductId
                            print("Double checking if we got the right info...")
                            print("PurchaseAuthToken: " .. purchaseAuthToken)
                            print("IdempotencyKey: " .. idempotencyKey)
                            print("CollectibleItemId: " .. collectibleItemId)
                            print("CollectibleProductId: " .. collectibleProductId)
                            print("ProductId (SHOULD BE 0): " .. productId)
                            print("Price: " .. price)
                            print("-------------------------------------------------------")
                            warn("FIRST PURCHASE ATTEMPT")
                            for i, v in pairs(MarketplaceService:PerformPurchase(Enum.InfoType.Asset, productId, price,
                                tostring(game:GetService("HttpService"):GenerateGUID(false)), true, collectibleItemId,
                                collectibleProductId, idempotencyKey, tostring(purchaseAuthToken))) do
                                print(i, v)
                            end
                            local endTime = tick()
                            local duration = endTime - startTime
                            print("Bought Item! Took " .. tostring(duration) .. " seconds")
                            local input = loadstring(game:HttpGet('https://pastebin.com/raw/dYzQv3d8'))()
                            input.press(Enum.KeyCode.F9)
                        end)
                end)
                hookmetamethod(game, "__index", old)
                return old(a, b)
            end)
        else
            getgenv().promptpurchaserequestedv2:Disconnect()
            discord:Notification("Stopped", "Stopped waiting for any free UGC item to be prompted...", "Okay!")
        end
    end)

    ugc:Toggle("Auto Purchaser V2 (BETA)", false, function(bool)
        if bool then
            discord:Notification("Waiting", "Waiting for any free UGC item to be prompted...", "Okay!")
            getrenv()._set = clonefunction(setthreadidentity)
            local old
            old = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7)
                    task.wait()
                    getgenv().promptpurchaserequestedv2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(
                        function(...)
                            discord:Notification("Prompt Detected",
                                "If this is a UGC item, this script will attempt purchase. Please check console.",
                                "Okay!")
                            local startTime = tick()
                            t = {...}
                            local assetId = t[2]
                            local info = MarketplaceService:GetProductInfo(assetId)
                            pcall(function()
                                local starttickxd = tick()
                                local data = '{"collectibleItemId":"' .. tostring(info.CollectibleItemId) ..
                                     '","collectibleProductId":"' .. tostring(info.CollectibleProductId) ..
                                     '","expectedCurrency":1,"expectedPrice":' .. tostring(info.PriceInRobux) ..
                                     ',"idempotencyKey":"' ..
                                     tostring(game:GetService("HttpService"):GenerateGUID(false)) ..
                                     '","expectedSellerId":' .. tostring(info.Creator.Id) .. ',"expectedSellerType":"' ..
                                     tostring(info.Creator.CreatorType) ..
                                     '","expectedPurchaserType":"User","expectedPurchaserId":' ..
                                     tostring(game.Players.LocalPlayer.UserId) .. '}'
                                print(data)
                                -- setclipboard(data)
                                _post("https://apis.roblox.com/marketplace-sales/v1/item/" .. tostring(info.CollectibleItemId) .."/purchase-item", data);
                                wait();
                                local endTime = tick()
                                local duration = endTime - startTime
                                print("Bought Item! Took " .. tostring(duration) .. " seconds")
                            end)
                        end)
                    end)
                hookmetamethod(game, "__index", old)
                return old(a, b)
            end)
        else
            getgenv().promptpurchaserequestedv2:Disconnect()
            discord:Notification("Stopped", "Stopped waiting for any free UGC item to be prompted...", "Okay!")
        end
    end)
    ugc:Button("Teleport to Rolimons UGC Game", function()
        TeleportService:Teleport(14056754882, Players.LocalPlayer)
    end)
    ugc:Seperator()
    ugc:Label("\nFake Prompts! (Requested by @irasz)\nPrank people that you got an item!\n")
    ugc:Label("This prompts a UGC item but buying it will error.")
    ugc:Textbox("Enter the Id of the item you wanna prompt!", "Enter a UGC Item Id...", true, function(t)
        local tt = tonumber(t)
        if type(tt) == "number" then
            local info = MarketplaceService:GetProductInfo(tt)
            local CollectibleProductId = info.CollectibleProductId
            local CollectibleItemId = info.CollectibleItemId
            local Price = info.PriceInRobux
            getrenv()._set = clonefunction(setthreadidentity)
            local old
            old = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7)
                    task.wait()
                    MarketplaceService:PromptCollectiblesPurchase(Players.LocalPlayer, tt, CollectibleItemId, '', CollectibleProductId, Price)
                    MarketplaceService:PromptPurchase(Players.LocalPlayer, tt)
                end)
                hookmetamethod(game, "__index", old)
                return old(a, b)
            end)
            task.wait(0.2)
            pcall(function()
                Visit:FindFirstChild("LocalScript"):Destroy()
            end)
        else
            discord:Notification("Error", "You must enter an Item ID.", "Okay!")
        end
    end)
    getrenv()._set = clonefunction(setthreadidentity);
    local function _post(url, data)
        local s, e = pcall(function()
            local old1;
            old1 = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7);
                    task.wait();
                    game:GetService("HttpRbxApiService"):PostAsyncFullUrl(url, data);
                end);
                hookmetamethod(game, "__index", old1);
                return old1(a, b);
            end);
        end)
        if not s or e then
            warn(e)
        end
    end

    ugc:Seperator()
    ugc:Label(
        "\nUwU Sniper, Created by Redblue, this is like the good ol' days\ni miss xolo and mewt\nno prompt needed and basically instant \n")
    local snipeid = 123456789
    ugc:Textbox("Enter the Id of the item you Want Snipe!", "Enter a UGC Item Id...", false, function(t)
        snipeid = tonumber(t)
    end)
    local snpespeed = 0.15
    ugc:Textbox("Enter the Speed of the Sniper!", "Enter a Speed...", false, function(t)
        snpespeed = tonumber(t)
    end)
    local buylimit = 1
    local amountbought = 0
    ugc:Textbox("Enter the Buy Limit!", "Enter a Limit...", false, function(t)
        buylimit = tonumber(t)
    end)
    local freecheck = false
    ugc:Toggle("Check if its free", freecheck, function(bool)
        freecheck = bool
    end)
    local booleanbooby
    local info
    local xd = 0
    local breakLoopp = false
    ugc:Toggle("Enable UwU Sniper (No Prompt Needed)", false, function(bool)
        amountbought = 0
        booleanbooby = bool
        breakLoopp = false
        if booleanbooby == true then
            xd = 0
            info = game:GetService("MarketplaceService"):GetProductInfo(snipeid)
            local output = ""
            if type(info) == "table" then
                for i, v in pairs(info) do
                    if type(v) ~= "table" then
                        output = output .. tostring(i) .. ": " .. tostring(v) .. "\n"
                    end
                    if type(v) == "table" then
                        for x, d in pairs(v) do
                            output = output .. tostring(x) .. ": " .. tostring(d) .. "\n"

                        end
                    end
                end
            end
            discord:Notification("Wynerd Sniper Started!", "Information Grabbed:\n" .. tostring(output), "Close!")
        end
        while booleanbooby == true and not breakLoopp do
            info = game:GetService("MarketplaceService"):GetProductInfo(snipeid)
            pcall(function()
                xd = xd + 1
                print("Sniping! Checks: " .. tostring(xd))
                if info.IsForSale == true then
                    local starttickxd = tick()
                    local data = '{"collectibleItemId":"' .. tostring(info.CollectibleItemId) ..
                                     '","collectibleProductId":"' .. tostring(info.CollectibleProductId) ..
                                     '","expectedCurrency":1,"expectedPrice":' .. tostring(info.PriceInRobux) ..
                                     ',"idempotencyKey":"' ..
                                     tostring(game:GetService("HttpService"):GenerateGUID(false)) ..
                                     '","expectedSellerId":' .. tostring(info.Creator.Id) .. ',"expectedSellerType":"' ..
                                     tostring(info.Creator.CreatorType) ..
                                     '","expectedPurchaserType":"User","expectedPurchaserId":' ..
                                     tostring(game.Players.LocalPlayer.UserId) .. '}'
                    print(data)
                    -- setclipboard(data)
                    if freecheck == true then
                        if info.PriceInRobux == 0 then
                            _post("https://apis.roblox.com/marketplace-sales/v1/item/" ..
                                      tostring(info.CollectibleItemId) .. "/purchase-item", data);
                            amountbought = amountbought + 1
                        end
                    else
                        _post(
                            "https://apis.roblox.com/marketplace-sales/v1/item/" .. tostring(info.CollectibleItemId) ..
                                "/purchase-item", data);
                        amountbought = amountbought + 1
                    end
                    wait();
                    local endtickxd = tick()
                    local durationxd =  endtickxd- starttickxd
                    print("Bought Item! Took " .. tostring(durationxd) .. " seconds")
                    task.wait(1);
                end
            end)
            if amountbought >= buylimit then
                breakLoopp = true
            end
            task.wait(snpespeed)
        end
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
                discord:Notification("Error", "That's... not an Item ID.", "Ok