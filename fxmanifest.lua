fx_version 'cerulean'
game 'gta5'

author 'DonHulieo & NovaMonkey'
description 'Daily Reward System for FiveM'
version '1.1.0'

server_scripts {'@oxmysql/lib/MySQL.lua', 'server/main.lua', 'server/logs.lua'}

client_scripts {'@PolyZone/client.lua', '@PolyZone/CircleZone.lua', 'client/main.lua'}

shared_scripts {'shared/config.lua', 'shared/lib.lua', 'locales/lang.lua', 'locales/*.lua'}

escrow_ignore '**.lua'

dependencies {'oxmysql', 'PolyZone'}

lua54 'yes'
