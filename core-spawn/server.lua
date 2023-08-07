RegisterServerEvent('FC:SpawnPlayer')
AddEventHandler('FC:SpawnPlayer', function()
    local source = source
    MySQL.Async.fetchScalar('SELECT position FROM users WHERE steamid = @steamid', {
        ['@steamid'] = GetPlayerIdentifierByType(source, 'steam')
    }, function(result)
        local SpawnPos = json.decode(result)
        TriggerClientEvent('FC:lastPosition', source, SpawnPos[1], SpawnPos[2], SpawnPos[3])
    end)
end)

RegisterServerEvent('FC:SavePlayerPosition')
AddEventHandler('FC:SavePlayerPosition', function(PosX, PosY, PosZ)
    MySQL.Async.fetchScalar('UPDATE users SET position = @position WHERE steamid = @steamid', {
        ['@steamid'] = GetPlayerIdentifierByType(source, 'steam'),
        ['@position'] = '{ ' .. PosX .. ', ' .. PosY .. ', ' .. PosZ .. '}'
    })
end)