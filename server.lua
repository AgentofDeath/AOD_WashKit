ESX = nil -- need to declare both server and client sided


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) --server sided esx trigger


ESX.RegisterUsableItem('washkit', function(source)
    local _source = source --declare source
    local xPlayer  = ESX.GetPlayerFromId(source)--get the player using it

    xPlayer.removeInventoryItem('washkit', 1) --remove it on use

    TriggerClientEvent('AOD:CleanThisBitch', _source) --trigger our event on use
    
end)
