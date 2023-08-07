fx_version 'bodacious'
games {'gta5'}

author 'YoungDev'
description 'Core Spawn Manager'

client_script 'client.lua'
server_scripts {
    'server.lua',
    '@oxmysql/lib/MySQL.lua'
}