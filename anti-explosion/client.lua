-- client.lua


-- client.lua

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- V�rifiez s'il y a une explosion dans un rayon de 50 unit�s
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        
        if IsExplosionInSphere(-1, pos.x, pos.y, pos.z, 50.0) then
            TriggerServerEvent('recordExplosion')
            Citizen.Wait(1000)  -- Attendre 1 seconde avant de v�rifier � nouveau pour �viter les spams
        end
    end
end)
