AddEventHandler('es:playerLoaded', function(source)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerClientEvent('iFood:openNUI', source, user.get('hunger'), user.get('thirst'))
	end)
end)