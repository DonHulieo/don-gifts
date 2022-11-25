Config = Config or {}

Config.UseTarget = false -- Set to false if you don't want to use qb-target

Config.Blips = true -- if you want blips or not
Config.BlipName = 'Christmas Tree' -- blip mame
Config.BlipSprite = 781 -- blip sprite
Config.BlipColor = 25 -- blip color
Config.BlipScale = 0.8 -- blip scale

Config.DiscordLogs = true -- Set to true if you want to log to discord // This requires the qb-log script located in qb-smallresources
Config.LogSettings = {
    webhook = "default", -- Set to your discord webhook // Set to "default" if you want to use the default webhook
    title = "Don Gifts", -- Set to the title you want to use for the logs
    colour = "green", -- Set to the color you want to use for the logs // Defaults are default, blue, red, green, white, black, orange, yellow, pink and light green
}

Config.GiftSettings = {
    ['unique'] = false, -- If set to true, the present will find a totally random set of items from your QBCore.Share.items table.
    ['min'] = 1, -- minimum amount of each item
    ['max'] = 3, -- maximum amount of each item
    ['total'] = 5, -- amount of different items in the present
}

Config.Items = { -- If Config.Unique is false, the items will be randomly selected from this list
    low = { -- These items have a 50% chance of being in the present
        [1] = {name = 'coffee'},
        [2] = {name = 'joint'},
        [3] = {name = 'screwdriverset'},
        [4] = {name = 'whiskey'},
        [5] = {name = 'tosti'},
        [6] = {name = 'snikkel_candy'},
        [7] = {name = 'lockpick'},
        [8] = {name = 'water_bottle'},
    },
    med = { -- These items have a 35% chance of being in the present
        [1] = {name = 'security_card_01'},
        [2] = {name = 'security_card_02'},
        [3] = {name = 'advancedlockpick'},
        [4] = {name = 'repairkit'},
    },
    high = { -- These items have a 15% chance of being in the present
        [1] = {name = 'trojan_usb'},
        [2] = {name = 'diamond_ring'},
    },
}

Config.Locations = {
    [1] = vector3(211.24, -932.15, 29.69), -- Legion Square
    [2] = vector3(-269.46, -955.23, 30.22), -- Base QB City Hall Building
    [3] = vector3(-1037.86, -2737.72, 19.17), -- LSIA
    [4] = vector3(-1811.87, -1206.59, 13.3), -- City Pier
    [5] = vector3(-413.05, 1168.69, 324.85), -- Observatory
    [6] = vector3(-3240.06, 970.25, 11.7), -- Great Ocean Highway pier
    [7] = vector3(608.15, 2745.24, 40.99), -- Sandy Shores Clothes Store
    [8] = vector3(1697.02, 3774.44, 33.75), -- Sandy Shores Ammunation
    [9] = vector3(1695.43, 4787.8, 41.01), -- Grapeseed
    [10] = vector3(127.36, 6632.87, 30.86), -- Paleto Bay
}