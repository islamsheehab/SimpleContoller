local Controllers = {
    LinearController    = {},
    QuadraticController = {},
    MonomialController  = {}, -- generalisation of linear, quadratic, ... controllers
}

-- Metatable-based polymorphism
Controllers.MonomialController.__index = Controllers.MonomialController
setmetatable(Controllers.MonomialController, Controllers)

Controllers.__index = Controllers

return Controllers
