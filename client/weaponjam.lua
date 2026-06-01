local shotCount = 0
local isJammed = false
local lastShotTime = 0
Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if Config.WeaponJam.Enable then
            local ped = PlayerPedId()
            if IsPedArmed(ped, 4) then
                sleep = 0
                local currentTime = GetGameTimer()
                if isJammed then
                    DisableControlAction(0, 24, true)
                    if IsControlJustPressed(0, 45) then
                        isJammed = false
                        shotCount = 0
                        Wait(1000)
                    end
                else
                    if IsPedShooting(ped) then
                        shotCount = shotCount + 1
                        lastShotTime = currentTime
                        if shotCount >= Config.WeaponJam.MaxContinuousShots then
                            isJammed = true
                            ClearPedTasks(ped)
                        end
                    end
                    if shotCount > 0 and (currentTime - lastShotTime) > Config.WeaponJam.CooldownTime then
                        shotCount = 0
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
