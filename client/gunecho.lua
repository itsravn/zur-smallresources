local function PlayGunshotEcho(coords, isIndoor)
    Citizen.CreateThread(function()
        local soundId = GetSoundId()
        if isIndoor then
            PlaySoundFromCoord(soundId, Config.GunEcho.Sounds.IndoorShot, coords.x, coords.y, coords.z, Config.GunEcho.AudioBank, false, 0, false)
            Wait(Config.GunEcho.Delays.Indoor)
            PlaySoundFromCoord(soundId, Config.GunEcho.Sounds.IndoorEcho, coords.x, coords.y, coords.z, Config.GunEcho.AudioBank, false, 0, false)
        else
            PlaySoundFromCoord(soundId, Config.GunEcho.Sounds.OutdoorShot, coords.x, coords.y, coords.z, Config.GunEcho.AudioBank, false, 0, false)
            Wait(Config.GunEcho.Delays.Outdoor)
            PlaySoundFromCoord(soundId, Config.GunEcho.Sounds.OutdoorEcho, coords.x, coords.y, coords.z, Config.GunEcho.AudioBank, false, 0, false)
        end
        Wait(1000)
        ReleaseSoundId(soundId)
    end)
end
Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if Config.GunEcho.Enable then
            local ped = PlayerPedId()
            if IsPedArmed(ped, 4) then
                sleep = 0 
                if IsPedShooting(ped) then
                    local coords = GetEntityCoords(ped)
                    local isIndoor = (GetInteriorFromEntity(ped) ~= 0)
                    PlayGunshotEcho(coords, isIndoor)
                    Wait(50) 
                end
            end
        end
        Wait(sleep)
    end
end)
