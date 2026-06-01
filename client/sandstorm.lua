local isBlind = false
Citizen.CreateThread(function()
    while true do
        Wait(5000)
        if Config.Sandstorm.Enable then
            local ped = PlayerPedId()
            local weatherHash = GetPrevWeatherTypeHashName()
            local isBadWeather = false
            for _, weather in pairs(Config.Sandstorm.Weathers) do
                if weatherHash == GetHashKey(weather) then
                    isBadWeather = true
                    break
                end
            end
            local isExposed = (GetInteriorFromEntity(ped) == 0) and not IsPedInAnyVehicle(ped, false)
            if isBadWeather and isExposed and not IsPedDeadOrDying(ped, true) then
                local hasMask = GetPedDrawableVariation(ped, 1) > 0
                local hasGlasses = GetPedPropIndex(ped, 1) > -1
                if not hasMask and not hasGlasses then
                    if not isBlind then
                        SetTimecycleModifier(Config.Sandstorm.TimecycleModifier)
                        SetTimecycleModifierStrength(0.8)
                        isBlind = true
                    end
                else
                    if isBlind then
                        ClearTimecycleModifier()
                        isBlind = false
                    end
                end
            else
                if isBlind then
                    ClearTimecycleModifier()
                    isBlind = false
                end
            end
        end
    end
end)
