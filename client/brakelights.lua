Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if Config.BrakeLights.Enable then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                local veh = GetVehiclePedIsIn(ped, false)
                if GetPedInVehicleSeat(veh, -1) == ped then
                    sleep = 0
                    if IsControlPressed(0, 72) or IsControlPressed(0, 76) then
                        SetVehicleBrakeLights(veh, true)
                    else
                        SetVehicleBrakeLights(veh, false)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
