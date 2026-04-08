local GameName = Zenith.GameName 

local EntityClass = {
    Main = {
        Functions = {},
        Cache = {}
    },
    Misc = {
        Functions = {},
        Cache = {}
    },
    Global = {}
}

EntityClass.Main.Functions.__index = EntityClass.Main.Functions
EntityClass.Misc.Functions.__index = EntityClass.Misc.Functions

EntityClass.Global.IsAlive = function(entity)
    local Humanoid = entity and entity:FindFirstChildOfClass("Humanoid")
    return Humanoid and Humanoid.Health > 0.1
end

EntityClass.Main.Create = function(self : table, Object : Instance)
    local isPlayer = Object:IsA("Player")

    local Entity = setmetatable({
        Pointer = Object,
        Character = isPlayer and Object.Character or Object
    }, self.Functions)

    self.Cache[Object] = Entity 

    return Entity 
end

return EntityClass
