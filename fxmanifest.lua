fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'Ruptz'
description 'Vehicle Spawner'
version '1.0.3'

ui_page 'web/build/index.html'

shared_scripts {
	'config.lua',
	'shared/stock_vehicles.lua',
	'@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

files {
	'web/build/index.html',
	'web/build/**/*',
}
