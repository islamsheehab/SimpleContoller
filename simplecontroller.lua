local Controllers = {
    LinearController    = {},
    QuadraticController = {},
    MonomialController  = {}, -- generalisation of linear, quadratic, ... controllers
}

-- Metatable-based polymorphism
Controllers.MonomialController.__index = Controllers.MonomialController
setmetatable(Controllers.MonomialController, Controllers)

Controllers.__index = Controllers

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

return Controllers
