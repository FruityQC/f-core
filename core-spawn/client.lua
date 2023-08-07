AddEventHandler('playerSpawned', function()
    TriggerServerEvent('FC:SpawnPlayer')
end)

RegisterNetEvent('FC:lastPosition')
AddEventHandler('FC:lastPosition', function(PosX, PosY, PosZ)
    Citizen.Wait(1)

    local defaultModel = GetHashKey('g_m_y_lost_01')
    RequestModel(defaultModel)
    while not HasModelLoaded(defaultModel) do 
        Citizen.Wait(1)
        FreezeEntityPosition(GetPlayerPed(-1), true)
    end
    SetPlayerModel(PlayerId(), defaultModel)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(defaultModel)
    SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
    Citizen.Wait(1000)
    FreezeEntityPosition(GetPlayerPed(-1), false)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 100, false, false)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        lastX, lastY, lastZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        TriggerServerEvent('FC:SavePlayerPosition', lastX, lastY, lastZ)
    end
end)