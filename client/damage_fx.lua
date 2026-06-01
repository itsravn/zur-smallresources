local lastHealth = 0
local function ApplyBloodAndScreenFX(coords, damageTaken)
    local rainLevel = GetRainLevel()
    if rainLevel < 0.2 and not IsEntityInWater(PlayerPedId()) then
        local size = 0.5 + (damageTaken / 100.0)
        AddDecal(Config.DamageFX.BloodDecalID, coords.x, coords.y, coords.z - 0.95, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0, size, size, 1.0, 0.0, 0.0, 1.0, 5000, 0, 0, 0)
    end
    if damageTaken >= Config.DamageFX.Thresholds.Medium then
        StartScreenEffect(Config.DamageFX.ScreenEffect, 2000, false)
    end
end
Citizen.CreateThread(function()
    Wait(2000)
    lastHealth = GetEntityHealth(PlayerPedId())
    while true do
        Wait(100)
        if Config.DamageFX.Enable then
            local ped = PlayerPedId()
            local currentHealth = GetEntityHealth(ped)
            if lastHealth > currentHealth and currentHealth > 0 then
                local damageTaken = lastHealth - currentHealth
                if damageTaken >= Config.DamageFX.Thresholds.Light then
                    local animType = "Light"
                    if damageTaken >= Config.DamageFX.Thresholds.Heavy then
                        animType = "Heavy"
                    elseif damageTaken >= Config.DamageFX.Thresholds.Medium then
                        animType = "Medium"
                    end
                    
                    local coords = GetEntityCoords(ped)
                    ApplyBloodAndScreenFX(coords, damageTaken)
                    SetFacialIdleAnimOverride(ped, "mood_injured_1", 0)
                    
                    local animName = Config.DamageFX.Anims[animType]
                    if animName ~= "" and not IsPedInAnyVehicle(ped, false) then
                        local dict = Config.DamageFX.AnimDict
                        RequestAnimDict(dict)
                        local timer = 0
                        while not HasAnimDictLoaded(dict) and timer < 1000 do Wait(10) timer = timer + 10 end
                        
                        if HasAnimDictLoaded(dict) then
                            TaskPlayAnim(ped, dict, animName, 8.0, -8.0, 1000, 48, 0, false, false, false)
                            RemoveAnimDict(dict)
                        end
                    end
                    Citizen.SetTimeout(2000, function()
                        ClearFacialIdleAnimOverride(ped)
                    end)
                end
            end
            lastHealth = currentHealth
        end
    end
end)
