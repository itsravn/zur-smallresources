local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('zur-smallresources:server:ApplyHeatFatigue', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local currentThirst = Player.PlayerData.metadata['thirst']
        local newThirst = currentThirst - Config.Heat.ThirstDeduction
        if newThirst < 0 then newThirst = 0 end
        Player.Functions.SetMetaData('thirst', newThirst)
        if newThirst > 0 and newThirst < 20.0 then
            TriggerClientEvent('QBCore:Notify', src, "Güneşin kavurucu sıcağı seni tüketiyor, su bulmalısın...", "error", 5000)
        end
    end
end)
