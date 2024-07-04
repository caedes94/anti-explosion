-- client.lua


-- client.lua

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- Vérifiez s'il y a une explosion dans un rayon de 50 unités
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        
        if IsExplosionInSphere(-1, pos.x, pos.y, pos.z, 50.0) then
            TriggerServerEvent('recordExplosion')
            Citizen.Wait(1000)  -- Attendre 1 seconde avant de vérifier à nouveau pour éviter les spams
        end
    end
end)
