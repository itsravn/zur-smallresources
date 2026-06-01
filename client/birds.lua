Citizen.CreateThread(function()
    while true do
        local sleep = 60000 
        if Config.Birds.Enable then
            local hour = GetClockHours()
            if hour >= Config.Birds.StartHour and hour < Config.Birds.EndHour then
                sleep = Config.Birds.CheckInterval
                local ped = PlayerPedId()
                if GetInteriorFromEntity(ped) == 0 then
                    if math.random(1, Config.Birds.Chance) == 1 then
                        local coords = GetEntityCoords(ped)
                        local offsetX = (math.random(10, 20)) * (math.random(1, 2) == 1 and 1 or -1)
                        local offsetY = (math.random(10, 20)) * (math.random(1, 2) == 1 and 1 or -1)
                        local offsetZ = math.random(5, 10) 
                        local soundId = GetSoundId()
                        PlaySoundFromCoord(soundId, "BIRD_CHIRP", coords.x + offsetX, coords.y + offsetY, coords.z + offsetZ, "DLC_HEIST_BIOLAB_PREP_SOUNDS", false, 0, false)
                        ReleaseSoundId(soundId)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
