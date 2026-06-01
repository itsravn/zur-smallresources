Citizen.CreateThread(function()
    while true do
        local sleep = 5000
        if Config.Dirt.Enable then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                local veh = GetVehiclePedIsIn(ped, false)
                if GetPedInVehicleSeat(veh, -1) == ped then
                    local speed = GetEntitySpeed(veh) * 3.6
                    if speed > 10.0 then
                        local material = GetVehicleWheelSurfaceMaterial(veh, 0)
                        local isBadMaterial = false
                        for _, mat in pairs(Config.Dirt.Materials) do
                            if material == mat then
                                isBadMaterial = true
                                break
                            end
                        end
                        if isBadMaterial then
                            local currentDirt = GetVehicleDirtLevel(veh)
                            if currentDirt < Config.Dirt.MaxDirtLevel then
                                SetVehicleDirtLevel(veh, currentDirt + 2.0)
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
