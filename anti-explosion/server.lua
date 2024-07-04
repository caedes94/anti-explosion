-- server.lua

local webhookURL = ''  -- Remplacez par votre URL de webhook Discord

local explosionsCount = {}  -- Tableau pour stocker le nombre d'explosions par joueur
local explosionLimit = 4    -- Nombre d'explosions maximum avant expulsion
local kickMessage = "Vous avez été expulsé pour usage abusif d'explosifs."

-- Fonction pour envoyer un message au webhook Discord
local function sendToDiscord(name, message, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = name,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Anti-Explosion Script",
            },
        }
    }
    PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode({username = "FiveM Server", embeds = connect}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('recordExplosion')
AddEventHandler('recordExplosion', function()
    local player = source
    local playerId = GetPlayerIdentifiers(player)[1]
    
    if not playerId then
        print("Impossible de récupérer l'identifiant du joueur.")
        return
    end
    
    if not explosionsCount[playerId] then
        explosionsCount[playerId] = 0
    end
    
    explosionsCount[playerId] = explosionsCount[playerId] + 1
    
    print(("Joueur %s a déclenché une explosion. Compteur d'explosions : %d"):format(playerId, explosionsCount[playerId]))
    
    if explosionsCount[playerId] >= explosionLimit then
        print(("Joueur %s a atteint la limite d'explosions. Expulsion en cours..."):format(playerId))
        DropPlayer(player, kickMessage)
        sendToDiscord("Expulsion de joueur", ("Le joueur %s a été expulsé pour usage abusif d'explosifs."):format(playerId), 16711680)  -- Rouge
    end
end)

AddEventHandler('playerDropped', function(reason)
    local player = source
    local playerId = GetPlayerIdentifiers(player)[1]
    
    if playerId and explosionsCount[playerId] then
        explosionsCount[playerId] = nil
        print(("Compteur d'explosions réinitialisé pour le joueur %s"):format(playerId))
    end
end)
