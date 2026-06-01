local isSwaying = false
Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if Config.GunSway.Enable then
            local ped = PlayerPedId()
            if IsPedArmed(ped, 4) then
                sleep = 50
                if IsPlayerFreeAiming(PlayerId()) then
                    local health = GetEntityHealth(ped)
                    local stamina = GetPlayerSprintStaminaRemaining(PlayerId())
                    local isInjured = health < Config.GunSway.InjuredThreshold
                    local isTired = stamina < Config.GunSway.TiredThreshold
                    if isInjured or isTired then
                        if not isSwaying then
                            local amplitude = Config.GunSway.ShakeAmplitudeMedium
                            if isInjured and isTired then 
                                amplitude = Config.GunSway.ShakeAmplitudeHeavy 
                            end
                            ShakeGameplayCam("HAND_SHAKE", amplitude)
                            isSwaying = true
                        end
                    else
                        if isSwaying then
                            StopGameplayCamShaking(true)
                            isSwaying = false
                        end
                    end
                else
                    if isSwaying then
                        StopGameplayCamShaking(true)
                        isSwaying = false
                    end
                end
            else
                if isSwaying then
                    StopGameplayCamShaking(true)
                    isSwaying = false
                end
            end
        end
        Wait(sleep)
    end
end)
