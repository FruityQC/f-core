AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local steamid
    local license 

    for k, v in ipairs(identifiers) do 
        if string.match(v, 'steam:') then 
            steamid = v
            print(v)
        end
    end

    if not steamid then
        deferrals.done('Steam is required')
    else --Si steam est ouvert
       deferrals.done() 

       MySQL.Async.fetchScalar('SELECT 1 FROM users WHERE steamid = @steamid', {
           ['@steamid'] = steamid 
       }, function(result)
            if not result then
                print('CREATING USER INTO CORE DATABASE')

                MySQL.Async.execute('INSERT INTO users (steamname, steamid, license) VALUES (@steamname, @steamid, @license)', {
                    ['@steamname'] = GetPlayerName(source), ['@steamid'] = steamid, ['@license'] = license})
            else
                print("Steamid OK")
            end
        end)
    end
end)