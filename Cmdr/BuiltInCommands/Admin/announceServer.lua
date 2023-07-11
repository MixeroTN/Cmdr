-- // This is only for PCS

local TextService = game:GetService("TextService")
local ServerScriptService = game:GetService("ServerScriptService")

local server = ServerScriptService:WaitForChild("Server")

local preparationQueue = require(server:WaitForChild("PreparationQueue"))

local indicators = preparationQueue:ReturnService("Indicators")

return function (context, text)
	-- // Filters the text
	local filterResult = TextService:FilterStringAsync(text, context.Executor.UserId, Enum.TextFilterContext.PublicChat)
	local resultForBroadcast = filterResult:GetNonChatStringForBroadcastAsync()

	-- // Yield until Knit Framework is ready
	preparationQueue:Await()

	-- // Indicates the Popup, image id 0 will show no image
	indicators:IndicatePopup("announcement", "rbxassetid://0", "[ANNOUNCEMENT] " .. resultForBroadcast, Color3.fromRGB(255, 238, 0), 5 + (#resultForBroadcast / 20))

	return "Created announcement."
end
