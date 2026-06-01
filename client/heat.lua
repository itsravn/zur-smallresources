local heatExhaustionActive = false
local heatTimeAccumulated = 0
Citizen.CreateThread(function()
    while true do
        Wait(5000)
        if Config.Heat.Enable then
            local ped = PlayerPedId()
            if not IsPedDeadOrDying(ped, true) then
                local hour = GetClockHours()
                local weatherHash = GetPrevWeatherTypeHashName()
                local isHotTime = (hour >= Config.Heat.StartHour and hour <= Config.Heat.EndHour)
                local isExtraSunny = (weatherHash == GetHashKey(Config.Heat.WeatherType) or weatherHash == GetHashKey("CLEAR"))
                local isExposed = (GetInteriorFromEntity(ped) == 0) and not IsPedInAnyVehicle(ped, false)
                
                if isHotTime and isExtraSunny and isExposed then
                    if not heatExhaustionActive then
                        heatExhaustionActive = true
                        Citizen.CreateThread(function()
                            while heatExhaustionActive do
                                Wait(0)
                                SetPedMoveRateOverride(PlayerPedId(), Config.Heat.MoveSpeed)
                            end
                        end)
                    end
                    heatTimeAccumulated = heatTimeAccumulated + 5000
                    if heatTimeAccumulated >= Config.Heat.ThirstTickRate then
                        TriggerServerEvent('zur-smallresources:server:ApplyHeatFatigue')
                        heatTimeAccumulated = 0
                    end
                else
                    if heatExhaustionActive then
                        heatExhaustionActive = false
                        heatTimeAccumulated = 0
                    end
                end
            end
        end
    end
end)
