-- Copyright (C) Izio, Inc - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by Romain Billot <romainbillot3009@gmail.com>, Jully 2017

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

client_scripts {
    'client.lua'
}

server_scripts {
	'server.lua',
	'@mysql-async/lib/MySQL.lua'
}
