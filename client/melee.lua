local lastMeleeTime = 0
Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if Config.Melee.Enable then
            local ped = PlayerPedId()
            if not IsPedInAnyVehicle(ped, false) then
                local weaponHash = GetSelectedPedWeapon(ped)
                local isUnarmed = weaponHash == `WEAPON_UNARMED`
                local isMelee = GetWeaponDamageType(weaponHash) == 2
                
                if isUnarmed or isMelee then
                    sleep = 0
                    local currentTime = GetGameTimer()
                    
                    if (currentTime - lastMeleeTime) < Config.Melee.WindupTime then
                        DisableControlAction(0, 24, true)
                        DisableControlAction(0, 140, true)
                        DisableControlAction(0, 141, true)
                        DisableControlAction(0, 142, true)
                    else
                        if IsControlJustPressed(0, 24) or IsControlJustPressed(0, 140) then
                            local dict = "melee@wild@"
                            RequestAnimDict(dict)
                            Citizen.CreateThread(function()
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(ped, dict, "ground_attack", 8.0, -8.0, Config.Melee.AnimDuration, 0, 0, false, false, false)
                                RemoveAnimDict(dict)
                            end)
                            lastMeleeTime = currentTime
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
