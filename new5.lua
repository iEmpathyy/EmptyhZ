getgenv().Config = {
    miscfeatures = false
}

-- ██████████████████████ Whitelist Player ██████████████████████

    local players = game:GetService("Players")
    local whitelist = {"devilfruitsXQ", "smurk0od7wkny53bcowu", "MyzuuZYX"}
        if players.LocalPlayer.Name == whitelist [1] or
        if players.LocalPlayer.Name == whitelist [2] or
        if players.LocalPlayer.Name == whitelist [3] then
    
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

local function NotifyP()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Product!";
		Duration = 10; 
		Button1 = "Fired";
		Text = ""
	
	})
end

local function Notify(text)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = text;
		Duration = 10; 
		Button1 = "Ok";
		Text = ""
	
	})
end

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
local loopActive = false
getrenv().getgenv = clonefunction(getgenv)

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

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()--[["https://raw.githubusercontent.com/eskeyv/Loader/main/Gui/ui2.lua"))()]]
local window = DrRayLibrary:Load("Dr.Shin", "Default")

-- ██████████████████████ Tab List ██████████████████████
local normal = DrRayLibrary.newTab("Normal Snipe", "5747127696")
local vip = DrRayLibrary.newTab("VIP+ Snipe", "no")
local cFire = DrRayLibrary.newTab("Chosen Fire", "no")
-- local klik = DrRayLibrary.newTab("Click (PC)", "no")
local serial = DrRayLibrary.newTab("Serial Snipe", "no")
-- local plyrHub = DrRayLibrary.newTab("PlyrHub Limited", "no")
local OPL = DrRayLibrary.newTab("OP Limited", "no")

--█████████████████████ Normal Snipe ████████████████████

normal.newLabel("Normal Snipe")

normal.newToggle("Web Snipe", "Slight delay!", false, function(bool)
    if bool then
			getrenv()._set = clonefunction(setthreadidentity)
			local old
			old = hookmetamethod(game, "__index", function(a, b)
				task.spawn(function()
					_set(7)
					task.wait()
					getgenv().promptpurchaserequestedv2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(
					function(...)
						t = {...}
						local assetId = t[2]
						local idempotencyKey = t[5]
						local purchaseAuthToken = t[6]
						local info = MarketplaceService:GetProductInfo(assetId)
						local productId = info.ProductId
						local price = info.PriceInRobux
						local collectibleItemId = info.CollectibleItemId
						local collectibleProductId = info.CollectibleProductId
						Notify("IdempotencyKey: " .. idempotencyKey)
						Notify("CollectibleItemId: " .. collectibleItemId)
						Notify("CollectibleProductId: " .. collectibleProductId)
						Notify("PurchaseAuthToken: " .. purchaseAuthToken)
						Notify("ProductId (SHOULD BE 0): " .. productId)
						Notify("Price: " .. price)
						warn("FIRST PURCHASE ATTEMPT")
						for i, v in pairs(MarketplaceService:PerformPurchase(Enum.InfoType.Asset, productId, price,
							tostring(game:GetService("HttpService"):GenerateGUID(false)), true, collectibleItemId,
							collectibleProductId, idempotencyKey, tostring(purchaseAuthToken))) do
								discord:Notification("Prompt Detected", "Result...", "" .. v, i)
						end
					end)
				end)
				hookmetamethod(game, "__index", old)
				return old(a, b)
			end)
		else
			getgenv().promptpurchaserequestedv2:Disconnect()
    end
end)
  
normal.newToggle("Auto Close Prompt", "No Prompt!", false, function(bool)
  		loopActive = bool
  		if loopActive then
  			while loopActive == true do
  				local purchasePrompt = game.CoreGui:FindFirstChild("PurchasePrompt")
  				if purchasePrompt then
  					local productPurchaseContainer = purchasePrompt:FindFirstChild("ProductPurchaseContainer")
  					if productPurchaseContainer then
  						local animator = productPurchaseContainer:FindFirstChild("Animator")
  						if animator then
  							local prompt = animator:FindFirstChild("Prompt")
  							if prompt and 
  								prompt:FindFirstChild("AlertContents") and
  								prompt.AlertContents:FindFirstChild("Footer") and
  								prompt.AlertContents.Footer:FindFirstChild("Buttons") then
  
  								for _, button in ipairs(prompt.AlertContents.Footer.Buttons:GetChildren()) do
  									if button:FindFirstChild("ButtonContent") and
  										button.ButtonContent:FindFirstChild("ButtonMiddleContent") and
  										button.ButtonContent.ButtonMiddleContent:FindFirstChildOfClass("TextLabel") and
  										button.ButtonContent.ButtonMiddleContent:FindFirstChildOfClass("TextLabel").Text == "Cancel" then
  
  										local pos = button.AbsolutePosition
  										print(pos)
  
  										for _, v in ipairs(prompt.AlertContents.Footer.Buttons:GetChildren()) do
  											print(v.Name)
  										end
  
  										game:GetService("VirtualInputManager"):SendMouseButtonEvent(pos.X + button.AbsoluteSize.X / 2, pos.Y + button.AbsoluteSize.Y, 0, true, game, 1)
  										wait()
  										game:GetService("VirtualInputManager"):SendMouseButtonEvent(pos.X + button.AbsoluteSize.X / 2, pos.Y + button.AbsoluteSize.Y, 0, false, game, 1)
  									end
  								end
  							end
  						end
  					end
  				end
  				wait(0)
  				if loopActive == false then
  					break
  				end
  			end
  		end
end)

normal.newToggle("Auto Close Error", "No Error!", false, function(value)
			loopActive = value
			spawn(function()
				while loopActive do
					local pp = game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt")
					if pp and pp.AlertContents and pp.AlertContents.Footer and pp.AlertContents.Footer.Buttons and not pp.AlertContents.Footer.Buttons:FindFirstChild("2") then
						if pp.AlertContents.Footer.Buttons:FindFirstChild("1") then
							local b1 = pp.AlertContents.Footer.Buttons[1].AbsolutePosition
							game:GetService("VirtualInputManager"):SendMouseButtonEvent(b1.X + 55, b1.Y + 65.5, 0, true, game, 1)
							wait()
							game:GetService("VirtualInputManager"):SendMouseButtonEvent(b1.X + 55, b1.Y + 65.5, 0, false, game, 1)
						end
					end
					task.wait()
				end
			end)
end)
	
	normal.newButton("Anti Afk", "Prevents kicks from occurring", function()
		local VirtualUser = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:Connect(function()
			VirtualUser:CaptureController()VirtualUser:ClickButton2(Vector2.new())
		end)
	end)
	
	normal.newToggle("Auto Hide Other Players", "Reduce Lag", false, function(bool)
        if bool then
            local usernames = {}
            while task.wait(0.1) do
                local players = Players:GetPlayers()
                local localPlayer = Players.LocalPlayer
                local cusernames = {}
                for _, player in ipairs(players) do
                    if player ~= localPlayer then
                        table.insert(cusernames, player.Name)
                        if not usernames[player.Name] then
                            usernames[player.Name] = true
                        end
                    end
                end
                for username, _ in pairs(usernames) do
                    if not table.find(cusernames, username) then
                        usernames[username] = nil
                    end
                end
                local models = game.Workspace:GetChildren()
                for _, model in ipairs(models) do
                    if model:IsA("Model") then
                        if usernames[model.Name] then
                            model:Destroy()
                        end
                    end
                end
                if Visit:FindFirstChild("Part") then
                    break
                end
            end
        else
            local kill = Instance.new("Part")
            kill.Parent = Visit
            task.wait(0.2)
            kill:Destroy()
        end
	end)

-- VIP+++++++

vip.newLabel("VIP+++")
vip.newToggle("Anti Prompt Loading Delay", "Speed of light⚡", false, function(bool1)
    _G.antidelay = bool1
    spawn(function()

        while task.wait(0) and _G.antidelay do
            if game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt:FindFirstChild("AlertContents") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents:FindFirstChild(
                    "Footer") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer:FindFirstChild(
                    "Buttons") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons:FindFirstChild(
                    "2") and
                game:GetService("CoreGui").PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer
                    .Buttons["2"]:FindFirstChild("LoadingImage") then
                game:GetService("CoreGui").PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer
                    .Buttons["2"].LoadingImage:Destroy()
            end
        end
    end)
end)

vip.newButton(--[[Camp's Game]]"fast Priority Sniper", "Lightning UGC ☠️⚡", function()
        local Cooldown;
        Cooldown = hookfunction(wait, function(v)

            v = 0;

            return Cooldown(v);
        end);
end)

local webhookcolour = 0x21ff29

local embedTitle = "||" .. game.Players.LocalPlayer.Name .. " (" .. game.Players.LocalPlayer.UserId ..
")|| has bought A" .. " new Bundle has been Bought! " 
local limitedugcwebhook 
vip.newInput("Input Webhook", "Input your webhook discord!", function(value) -- "number" or "string"
    limitedugcwebhook = value
end)
getgenv().LimmyBought = false

vip.newToggle("Limited Bought Webhook", "Test", false, function(bool1)
    getgenv().LimmyBought = bool
end)
game:GetService("MarketplaceService").PromptPurchaseFinished:Connect(
        function(player, assetId, wasPurchased)
            if wasPurchased and limitedugcwebhook ~= nil then
                if getgenv().LimmyBought == true then

                    local success, response = pcall(function()
                        requested = (syn and syn.request) or (fluxus and fluxus.request) or request or
                                        (http and http.request) or http_request
                        requested({
                            Url = tostring(limitedugcwebhook),
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = game:GetService("HttpService"):JSONEncode({
                                content = "",
                                embeds = {{
                                    title = embedTitle .. os.date(" %I:%M:%S %p"),
                                    description = "**The Asset bought is**\n" .. "**Id / Name:** [" .. tostring(assetId) ..
                                        "](https://www.roblox.com/catalog/" .. tostring(assetId) ..
                                        "/PlayerHubOnTop) / " ..
                                        game:GetService("MarketplaceService"):GetProductInfo(assetId).Name ..
                                        "\n **Description:** " ..
                                        game:GetService("MarketplaceService"):GetProductInfo(assetId).Description ..
                                        "\n **Created by:** " ..
                                        game:GetService("MarketplaceService"):GetProductInfo(assetId).Creator.Name,
                                    color = webhookcolour
                                }}
                            })
                        })
                    end)
                    if not success then
                        requested = (syn and syn.request) or (fluxus and fluxus.request) or request or
                                        (http and http.request) or http_request
                        requested({
                            Url = tostring(limitedugcwebhook),
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = game:GetService("HttpService"):JSONEncode({
                                content = "",
                                embeds = {{
                                    title = embedTitle .. os.date(" %I:%M:%S %p"),
                                    description = "Bought (ID) " .. tostring(assetId),
                                    color = webhookcolour
                                }}
                            })
                        })
                    end
                end
            end
        end)

--███████████ T O U C H  I N T E R E S T ████████████

local aPI = "Touch Interest"
cFire.newDropdown("What to fire??",  "Select one of these options!", {"Touch Interest", "Proximity Prompt", "Click Detector"}, true, function(Value)
    aPI = Value
end)

cFire.newLabel("Rejoin to stop it")
cFire.newButton("Fire Chosen Class Above", "Click this button for firechosen", function()
    spawn(function()
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if aPI == "Proximity Prompt" and descendant:IsA("ProximityPrompt") then
            fireproximityprompt(descendant)
        end
        if aPI == "Touch Interest" and descendant:IsA("TouchTransmitter") and
            game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart then
            task.spawn(function()
                firetouchinterest(descendant:FindFirstAncestorWhichIsA("Part"),
                    game.Players.LocalPlayer.Character.PrimaryPart, 1)
                task.wait()
                firetouchinterest(descendant:FindFirstAncestorWhichIsA("Part"),
                    game.Players.LocalPlayer.Character.PrimaryPart, 0)
            end)
        end
        if aPI == "Click Detector" and descendant:IsA("ClickDetector") then
            task.spawn(function()
                fireclickdetector(descendant)
                    end)
                end
            end
        end)
    end)


    -- ██████████████████████ C L I C K  ( P C ) ██████████████████████

    --[[ klik.newLabel("------------- Clicking Tools (Only works for PC maybe) -------------") -- Creates the folder(U will put here your buttons,etc)
    
    task.wait(0.1)
    klik.newLabel("------------- 55X and 65.5Y is Default Offsets -------------")

    local autoclicklim = 0
    klik.newSlider("AutoClick Speed...", "Default 0 & Max. 5", 5, false, function(value)
        autoclicklim = value
    end)
    
    local limoffsetX = 55
    klik.newSlider("AutoClick Offset X", "Min. -200 & Max. 200", 200, false, function(value)
        limoffsetX = value
    end)
    local limoffsetY = 65.5
    klik.newSlider("AutoClick Offset Y", "Min. -200 & Max. 200", 200, false, function(value)
        limoffsetY = value
    end)
    local MaxPrice = 1
    klik.newSlider("Max Price (1 Default)", "Min. 1 & Max. 10000, use default (1)", 10000, false, function(value)
        MaxPrice = value
    end)
    
    klik.newToggle("Auto Clicker Buy Limited", "Auto Click Limited (OP)", false, function(bool1)
        _G.limsniperautoclicker = bool1
        spawn(function()
    
            while task.wait(autoclicklim) and _G.limsniperautoclicker do
                if game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt:FindFirstChild("AlertContents") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents:FindFirstChild(
                        "Footer") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer:FindFirstChild(
                        "Buttons") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons:FindFirstChild(
                        "2") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild(
                        "ButtonContent").ButtonMiddleContent and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild(
                        "ButtonContent").ButtonMiddleContent:FindFirstChildOfClass("TextLabel") and tonumber(
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild(
                        "ButtonContent").ButtonMiddleContent:FindFirstChildOfClass("TextLabel").Text) <= tonumber(MaxPrice) then
    
    
                            local yes = game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents
                                            .Footer.Buttons[2].AbsolutePosition
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(yes.X + tonumber(limoffsetX),
                                yes.Y + tonumber(limoffsetY), 0, true, game, 1)
                            task.wait()
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(yes.X + tonumber(limoffsetX),
                                yes.Y + tonumber(limoffsetY), 0, false, game, 1)
    
                end
            end
        end)
    end)

    klik.newToggle("Auto Clicker Buy (0 ONLY)", "Auto click buy 0 price maybe.", false, function(bool2)
        _G.limsniperautoclicker2 = bool2
        spawn(function()
            while task.wait(autoclicklim) and _G.limsniperautoclicker2 do
                if game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt:FindFirstChild("AlertContents") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents:FindFirstChild(
                        "Footer") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer:FindFirstChild(
                        "Buttons") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons:FindFirstChild(
                        "2") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild(
                        "ButtonContent").ButtonMiddleContent and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild(
                        "ButtonContent").ButtonMiddleContent:FindFirstChildOfClass("TextLabel") and tonumber(
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild(
                        "ButtonContent").ButtonMiddleContent:FindFirstChildOfClass("TextLabel").Text) <= tonumber(0) then
    
                            local yes = game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents
                                            .Footer.Buttons[2].AbsolutePosition
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(yes.X + tonumber(limoffsetX),
                                yes.Y + tonumber(limoffsetY), 0, true, game, 1)
                            task.wait()
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(yes.X + tonumber(limoffsetX),
                                yes.Y + tonumber(limoffsetY), 0, false, game, 1)
    
                end
            end
        end)
    end)
    klik.newToggle("Auto Close Error Clicker", "Auto close error", false, function(bool2)
        _G.limsniperautoclicker33 = bool2
        spawn(function()
            while task.wait(autoclicklim) and _G.limsniperautoclicker33 do
                if game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt:FindFirstChild("AlertContents") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents:FindFirstChild(
                        "Footer") and
                    game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer:FindFirstChild(
                        "Buttons") and
                    not game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons:FindFirstChild(
                        "2") then
                    if game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons:FindFirstChild(
                        "1") then
    
                                local yes = game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt
                                                .AlertContents.Footer.Buttons[1].AbsolutePosition
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(yes.X + tonumber(limoffsetX),
                                    yes.Y + tonumber(limoffsetY), 0, true, game, 1)
                                task.wait()
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(yes.X + tonumber(limoffsetX),
                                    yes.Y + tonumber(limoffsetY), 0, false, game, 1)
    
                    end
                end
            end
        end)
    end) ]]

    -- ██████████████████████ S E R I A L  S N I P E ██████████████████████
			
    serial.newLabel("Serial Snipe") -- Creates the folder(U will put here your buttons,etc)
    
    local serialyouwant = 69
    serial.newInput("Serial you Want", "Number only, not text!!", function(value) -- "number" or "string"
        serialyouwant = value
    end)
    
    serial.newLabel("------------- PRODUCT ID -------------")
    local productidserialsniper = 123456789
    serial.newInput("Product Id to Serial Snipe", "Number only!", function(value) -- "number" or "string"
        productidserialsniper = value
    end)
    local intervalserialsnper = 0
    serial.newSlider("Loop interval Serial Sniper", "Max. 10!", 10, false, function(value)
        intervalserialsnper = value
    end)

    serial.newLabel("------------- PRODUCT TOTAL -------------")
    local originalstockserial = 69
    serial.newInput("Product's Total / Original Copies", "Number only, not text!!", function(value) -- "number" or "string"
        originalstockserial = value
    end)
    serial.newButton("Get Total stock ^", "Get Total Stock Item.", function()
        if request then
            local xdresponse = request({
                Url = "https://catalog.roblox.com/v1/catalog/items/" .. tostring(productidserialsniper) .. "/details?itemType=Asset",
                Method = "GET"
            })
                local xdmessage = game:GetService("HttpService"):JSONDecode(xdresponse.Body)
    if xdmessage and xdmessage["totalQuantity"] then
    print(xdmessage["totalQuantity"])
    originalstockserial = xdmessage["totalQuantity"]
    end
        end
    end)
    local tickserialsniper = 2
    serial.newSlider("Threads of checks", "Max. 8!", 8, false, function(value)
        tickserialsniper = value
    end)
    serial.newToggle("Serial Sniper (Have its Buy Prompt Opened)", "idk what this, you better activate it.", false, function(bool2)
        _G.SerialSniper = bool2
        spawn(function()
            while _G.SerialSniper and task.wait(intervalserialsnper) do
                task.spawn(function()
                    for i = 1, tonumber(tickserialsniper) do
                        task.spawn(function()
                            if game:GetService("MarketplaceService"):GetProductInfo(productidserialsniper).Remaining ~= nil then
                                print(originalstockserial -
                                          game:GetService("MarketplaceService"):GetProductInfo(productidserialsniper).Remaining,
                                    "Sales")
                                if (originalstockserial -
                                    game:GetService("MarketplaceService"):GetProductInfo(productidserialsniper).Remaining) ==
                                    (tonumber(serialyouwant) - 1) then
                                    if game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt") and
                                        game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt:FindFirstChild(
                                            "AlertContents") and
                                        game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents:FindFirstChild(
                                            "Footer") and
                                        game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents
                                            .Footer:FindFirstChild("Buttons") and
                                        game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents
                                            .Footer.Buttons:FindFirstChild("2") and
                                        game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents
                                            .Footer.Buttons[2]:FindFirstChild("ButtonContent").ButtonMiddleContent and
                                        game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents
                                            .Footer.Buttons[2]:FindFirstChild("ButtonContent").ButtonMiddleContent:FindFirstChildOfClass(
                                            "TextLabel") and tonumber(
                                        game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents
                                            .Footer.Buttons[2]:FindFirstChild("ButtonContent").ButtonMiddleContent:FindFirstChildOfClass(
                                            "TextLabel").Text) <= tonumber(MaxPrice) then
    
                                                local yes = game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator
                                                                .Prompt.AlertContents.Footer.Buttons[2].AbsolutePosition
                                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(yes.X +
                                                                                                                tonumber(
                                                        limoffsetX), yes.Y + tonumber(limoffsetY), 0, true, game, 1)
                                                task.wait()
                                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(yes.X +
                                                                                                                tonumber(
                                                        limoffsetX), yes.Y + tonumber(limoffsetY), 0, false, game, 1)
    
    
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
        end)
    end)

    -- ██████████████████████ P L Y R H U B ██████████████████████

    --[[ plyrHub.newLabel("._player") -- Creates the folder(U will put here your buttons,etc)
    local limid = 14472256544
    plyrHub.newInput("Input Limited ID", "Number ID.", function(value) -- "number" or "string"
        limid = value
    end) ]]

    
    -- ██████████████████████ O P  L I M I T E D ██████████████████████

    OPL.newButton("Print Limited Info", "Click ^ (Check console log)", function()
        print("Asset ID: " .. game:GetService("MarketplaceService"):GetProductInfo(limid).AssetId .. " \n" .. "Name: " ..
                  game:GetService("MarketplaceService"):GetProductInfo(limid).Name .. " \n" .. "Description: " ..
                  game:GetService("MarketplaceService"):GetProductInfo(limid).Description ..
                  " \n Use This to Buy It!  \n   game:GetService('MarketplaceService'):PromptPurchase(game.Players.LocalPlayer, " ..
                  limid .. ")")
    end)
    OPL.newButton("Copy Limited Info", "Click ^ (Copy clipboard)", function()
        setclipboard("-- This Script was Generated by sohe Ingame Game Sniper Script\nAsset ID: " .. game:GetService("MarketplaceService"):GetProductInfo(limid).AssetId .. " \n" ..
                         "Name: " .. game:GetService("MarketplaceService"):GetProductInfo(limid).Name .. " \n" ..
                         "Description: " .. game:GetService("MarketplaceService"):GetProductInfo(limid).Description ..
                         " \n Use This to Buy It!  \n   game:GetService('MarketplaceService'):PromptPurchase(game.Players.LocalPlayer, " ..
                         limid .. ")")
    end)
    local updspeed = 0
    OPL.newSlider("Update Speed", "Max. 5!", 5, false, function(value)
        updspeed = value
    end)
    OPL.newButton("Buy Limited", "Click ^", function()
        game:GetService("MarketplaceService"):PromptPurchase(game.Players.LocalPlayer, tostring(limid))
    end)
    
    local limsniper = false
    
    OPL.newToggle("Toggle Auto Limited Sniper V1 (AutoPrompts)", "Auto prompt v1! idk work or nah, lets try.", false, function(bool1)
        limsniper = bool1
        spawn(function()
            while task.wait(updspeed) and limsniper and limid ~= nil do
                game:GetService("MarketplaceService"):PromptPurchase(game.Players.LocalPlayer, tostring(limid))
            end
        end)
    end)
    wait(0.1)
    local limsniper1 = false
    OPL.newToggle("Toggle Auto Limited Sniper V2 (Prompt when Onsale)", "ONSALE!!! idk work or nah, lets try.", false, function(bool)
        limsniper1 = bool
        spawn(function()
            while task.wait(updspeed) and limsniper1 == true do
                if limid ~= nil and game:GetService("MarketplaceService"):GetProductInfo(tonumber(limid)).IsForSale then
                    game:GetService("MarketplaceService"):PromptPurchase(game.Players.LocalPlayer, tostring(limid))
                end
            end
        end)
    end)
    local limsniper2 = false
    OPL.newToggle("Toggle Auto Limited Sniper V3 (Prompt when Onsale)", "ONSALE AGAIN!!! idk work or nah, lets try.", false, function(bool)
        limsniper2 = bool
        spawn(function()
            while task.wait(updspeed) and limsniper2 == true do
                if limid ~= nil and game:GetService("MarketplaceService"):GetProductInfo(limid).Remaining ~= nil then
                    game:GetService("MarketplaceService"):PromptPurchase(game.Players.LocalPlayer, tostring(limid))
                end
            end
        end)
    end)
    
    local gameid
    OPL.newPrimt("Insert Game ID", "number!!", function(value) -- "number" or "string"
        gameid = value
    end)
    OPL.newButton("TP to game ID", "Click to TP ^", function()
        game:GetService("TeleportService"):Teleport(gameid, LocalPlayer)
    
    end)
    
    OPL.newLabel("----------------------------------------") -- Creates the folder(U will put here your buttons,etc)
    
    OPL.newLabel("THIS IS RISKY COULD GET YOU BANNED (by Keii)")

    OPL.newButton("Get ingame UGC V1", "Click ^", function()
        spawn(function()
        for i, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                v:FireServer(limid)
            end
            if v:IsA("BindableEvent") then
                v:Fire(limid)
            end
            if v:IsA("RemoteFunction") then
                v:InvokeServer(limid)
    
            end
        end
    end)
    end)
    
    OPL.newButton("Get ingame UGC V2", "Click ^", function()
        spawn(function()
        for i, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                spawn(function()
                    v:FireServer(limid)
                end)
                spawn(function()
                    v:FireServer(tostring(limid))
                end)
                spawn(function()
                    v:FireServer(game.Players.LocalPlayer.UserId, limid)
                end)
                spawn(function()
                    v:FireServer(game.Players.LocalPlayer.UserId, tostring(limid))
                end)
                spawn(function()
                    v:FireServer(limid, game.Players.LocalPlayer.UserId)
                end)
                task.wait(0.1)
                spawn(function()
                    v:FireServer(tostring(limid), game.Players.LocalPlayer.UserId)
                end)
                spawn(function()
                    v:FireServer(tostring(game.Players.LocalPlayer.UserId), limid)
                end)
                spawn(function()
                    v:FireServer(tostring(game.Players.LocalPlayer.UserId), tostring(limid))
                end)
                spawn(function()
                    v:FireServer(limid, tostring(game.Players.LocalPlayer.UserId))
                end)
                spawn(function()
                    v:FireServer(tostring(limid), tostring(game.Players.LocalPlayer.UserId))
                end)
                spawn(function()
                    v:FireServer(game.Players.LocalPlayer, limid)
                end)
                task.wait(0.1)
                spawn(function()
                    v:FireServer(game.Players.LocalPlayer, tostring(limid))
                end)
                spawn(function()
                    v:FireServer(limid, game.Players.LocalPlayer)
                end)
                spawn(function()
                    v:FireServer(tostring(limid), game.Players.LocalPlayer)
                end)
            end
            if v:IsA("BindableEvent") then
                spawn(function()
                    v:Fire(limid)
                end)
                spawn(function()
                    v:Fire(tostring(limid))
                end)
                spawn(function()
                    v:Fire(tostring(game.Players.LocalPlayer.UserId), limid)
                end)
                spawn(function()
                    v:Fire(tostring(game.Players.LocalPlayer.UserId), tostring(limid))
                end)
                spawn(function()
                    v:Fire(limid, tostring(game.Players.LocalPlayer.UserId))
                end)
                task.wait(0.1)
                spawn(function()
                    v:Fire(tostring(limid), tostring(game.Players.LocalPlayer.UserId))
                end)
                spawn(function()
                    v:Fire(game.Players.LocalPlayer, limid)
                end)
                spawn(function()
                    v:Fire(game.Players.LocalPlayer, tostring(limid))
                end)
                task.wait(0.1)
                spawn(function()
                    v:Fire(limid, game.Players.LocalPlayer)
                end)
                spawn(function()
                    v:Fire(tostring(limid), game.Players.LocalPlayer)
                end)
            end
            if v:IsA("RemoteFunction") then
                spawn(function()
                    v:InvokeServer(limid)
                end)
                spawn(function()
                    v:InvokeServer(tostring(limid))
                end)
                spawn(function()
                    v:InvokeServer(game.Players.LocalPlayer, limid)
                end)
                task.wait(0.1)
                spawn(function()
                    v:InvokeServer(game.Players.LocalPlayer, tostring(limid))
                end)
                spawn(function()
                    v:InvokeServer(limid, game.Players.LocalPlayer)
                end)
                spawn(function()
                    v:InvokeServer(tostring(limid), game.Players.LocalPlayer)
                end)
                spawn(function()
                    v:InvokeServer(game.Players.LocalPlayer.UserId, limid)
                end)
                task.wait(0.1)
                spawn(function()
                    v:InvokeServer(game.Players.LocalPlayer.UserId, tostring(limid))
                end)
                spawn(function()
                    v:InvokeServer(limid, game.Players.LocalPlayer.UserId)
                end)
                spawn(function()
                    v:InvokeServer(tostring(limid), game.Players.LocalPlayer.UserId)
                end)
                spawn(function()
                    v:InvokeServer(tostring(game.Players.LocalPlayer.UserId), limid)
                end)
                spawn(function()
                    v:InvokeServer(tostring(game.Players.LocalPlayer.UserId), tostring(limid))
                end)
                task.wait(0.1)
                spawn(function()
                    v:InvokeServer(limid, tostring(game.Players.LocalPlayer.UserId))
                end)
                spawn(function()
                    v:InvokeServer(tostring(limid), tostring(game.Players.LocalPlayer.UserId))
                end)
                    end
            end
        end)
    end)
end)

elseif players.LocalPlayer then
	game.Players.LocalPlayer:Kick("YOU NOT WHITELIST N1@@4, BUY WHITELIST FIRST AND USE THIS SCRIPT")
end