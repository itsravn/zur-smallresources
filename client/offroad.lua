local function isClassBanned(class)
    for _, banned in pairs(Config.OffRoad.BannedClasses) do
        if class == banned then return true end
    end
    return false
end
local function isBadMaterial(material)
    for _, mat in pairs(Config.OffRoad.Materials) do
        if material == mat then return true end
    end
    return false
end
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        if Config.OffRoad.Enable then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                local veh = GetVehiclePedIsIn(ped, false)
                if GetPedInVehicleSeat(veh, -1) == ped then
                    local class = GetVehicleClass(veh)
                    if isClassBanned(class) then
                        local speed = GetEntitySpeed(veh) * 3.6
                        if speed > Config.OffRoad.SpeedThreshold then
                            local material = GetVehicleWheelSurfaceMaterial(veh, 0)
                            if isBadMaterial(material) then
                                sleep = 500
                                if math.random(1, 100) <= Config.OffRoad.BurstChance then
                                    local randomTire = math.random(0, 3)
                                    if not IsVehicleTyreBurst(veh, randomTire, false) then
                                        SetVehicleTyreBurst(veh, randomTire, true, 1000.0)
                                    end
                                end
                            end
                        end
                    end
                else
                    sleep = 2000
                end
            else
                sleep = 2000
            end
        end
        Wait(sleep)
    end
end)
