local isPlaying = false
local cicadaSoundId = nil
Citizen.CreateThread(function()
    while true do
        local sleep = 60000
        if Config.Cicada.Enable then
            local hour = GetClockHours()
            local ped = PlayerPedId()
            local isNight = (hour >= Config.Cicada.StartHour or hour < Config.Cicada.EndHour)
            local isOutside = (GetInteriorFromEntity(ped) == 0)
            if isNight then
                sleep = Config.Cicada.CheckInterval
                if isOutside and not isPlaying then
                    cicadaSoundId = GetSoundId()
                    PlaySoundFromEntity(cicadaSoundId, "CICADA_buzzing", ped, "DLC_HEIST_BIOLAB_PREP_SOUNDS", false, 0)
                    isPlaying = true
                elseif not isOutside and isPlaying then
                    StopSound(cicadaSoundId)
                    ReleaseSoundId(cicadaSoundId)
                    cicadaSoundId = nil
                    isPlaying = false
                end
            else
                if isPlaying then
                    StopSound(cicadaSoundId)
                    ReleaseSoundId(cicadaSoundId)
                    cicadaSoundId = nil
                    isPlaying = false
                end
            end
        end
        Wait(sleep)
    end
end)
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if isPlaying and cicadaSoundId then
            StopSound(cicadaSoundId)
            ReleaseSoundId(cicadaSoundId)
        end
    end
end)
