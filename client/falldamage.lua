local isOnGround = true
local fallStartTime = nil
Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if Config.FallDamage.Enable then
            local ped = PlayerPedId()
            if IsPedOnFoot(ped) and not IsPedDeadOrDying(ped, true) then
                sleep = 0
                local isClimbing = IsPedClimbing(ped) or IsPedVaulting(ped)
                local currentlyOnGround = not IsEntityInAir(ped)
                
                if currentlyOnGround and not isOnGround then
                    if fallStartTime then
                        local fallDuration = GetGameTimer() - fallStartTime
                        local fallTimeSec = fallDuration / 1000.0
                        local fallHeight = (9.81 * (fallTimeSec * fallTimeSec)) / 2
                        local damage = 0
                        
                        if fallHeight >= Config.FallDamage.DeathHeight then
                            damage = 200
                        elseif fallHeight >= Config.FallDamage.HeavyHeight then
                            damage = Config.FallDamage.HeavyDamage
                        elseif fallHeight >= Config.FallDamage.MediumHeight then
                            damage = Config.FallDamage.MediumDamage
                        elseif fallHeight >= Config.FallDamage.LightHeight then
                            damage = Config.FallDamage.LightDamage
                        end
                        
                        if damage > 0 then
                            ApplyDamageToPed(ped, damage, false)
                        end
                        fallStartTime = nil
                    end
                end
                
                if not currentlyOnGround and not isClimbing then
                    if not fallStartTime then
                        fallStartTime = GetGameTimer()
                    end
                else
                    if isClimbing then
                        fallStartTime = nil
                    end
                end
                isOnGround = currentlyOnGround
            else
                isOnGround = true
                fallStartTime = nil
            end
        end
        Wait(sleep)
    end
end)
