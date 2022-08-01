local Controllers = {
    LinearController    = {},
    QuadraticController = {},
    MonomialController  = {}, -- generalisation of linear, quadratic, ... controllers
}

-- Metatable-based polymorphism
Controllers.MonomialController.__index = Controllers.MonomialController
setmetatable(Controllers.MonomialController, Controllers)

Controllers.__index = Controllers

function Controllers:SetGoal(goal: number)

end

function Controllers:SetCurrent(value: number)
 
end

function Controllers:Get()

end

function Controllers.MonomialController.new(degree: number, strength: number)
    degree = degree or 1
    strength = strength or 1

    local self = {
        Degree    = degree,
        Strength  = strength,

        Goal      = 0,
        Current   = 0,

        PreviousTime = os.clock()
    }

    return setmetatable(self, Controllers.MonomialController)
end

function Controllers.LinearController.new(strength: number)
    return Controllers.MonomialController.new(1, strength)
end

function Controllers.QuadraticController.new(strength: number)
    return Controllers.MonomialController.new(2, strength)
end

function Controllers.MonomialController:Update()
    local deltaTime     = os.clock() - self.PreviousTime
    local error         = self.Goal - self.Current
    local increment     = (error ^ self.Degree) * deltaTime
    
    self.Current += increment
end

return Controllers
