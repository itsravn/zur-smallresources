Citizen.CreateThread(function()
    while true do
        if Config.Blink.Enable then
            local ped = PlayerPedId()
            if not IsPedDeadOrDying(ped, true) then
                SetFacialIdleAnimOverride(ped, "mood_sleeping_1", 0)
                Wait(Config.Blink.BlinkDuration)
                ClearFacialIdleAnimOverride(ped)
            end
            Wait(math.random(Config.Blink.MinInterval, Config.Blink.MaxInterval))
        else
            Wait(5000)
        end
    end
end)
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        ClearFacialIdleAnimOverride(PlayerPedId())
    end
end)
