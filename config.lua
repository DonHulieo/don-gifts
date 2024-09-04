return {
  ---@type boolean Whether to show debug messages in the console
  ['DebugMode'] = false,
  ---@type integer|string Model of the object | Can Be Either a String or Hash | https://forge.plebmasters.de/objects
  ['Model'] = `prop_xmas_tree_int`,
  ---@type {enabled: boolean, sprite: number, colour: number, scale: number, shortRange: boolean}
  ['Blips'] = {
    enabled = true, -- Whether to show blips on the map
    sprite = 781, -- Blip sprite | https://docs.fivem.net/docs/game-references/blips/
    colour = 25, -- Blip colour | https://docs.fivem.net/docs/game-references/blips/#blip-colors
    scale = 0.8, -- Blip scale
    shortRange = true -- Whether the blip is shown when close to the player or always.
  },
  ---@type {enabled: boolean, image: string, colour: number}
  ['DiscordLogs'] = {
    enabled = true, -- Whether to log to discord
    image = '', -- Set to the image you want to use for the logs
    colour = 65309 -- The colour of the embed | https://www.spycolor.com/
  },
  ---@type {unique: boolean, min: number, max: number, total: number, time: string, Items: {BlackList: string[], Chance: {Low: number, Med: number, High: number}, Low: string[], Med: string[], High: string[]}}
  ['Gifts'] = {
    unique = true, -- Whether to reward a random set of items from your items table
    min = 1, -- Minimum amount of each item
    max = 3, -- Maximum amount of each item
    total = 5, -- Amount of different items in the present
    time = '24:00:00', -- Amount of time before a player can open another present
    ['Items'] = { -- If Config.Unique is false, the items will be randomly selected from this list
      ['BlackList'] = { -- These items will never be in the present
        'present',
        'radioscanner'
      },
      ['Chance'] = {
        ['Low'] = 50, -- 50% chance of being in the present
        ['Med'] = 35, -- 35% chance of being in the present
        ['High'] = 15 -- 15% chance of being in the present
      },
      ['Low'] = {
        'coffee', -- 'bread',
        'joint', -- 'cannabis',
        'screwdriverset', -- 'carotool',
        'whiskey', -- 'phone',
        'lockpick', -- 'radio',
        'water_bottle' -- 'water'
      },
      ['Med'] = {
        'security_card_01', -- 'gazbottle',
        'security_card_02', -- 'iron',
        'advancedlockpick', -- 'medikit',
        'repairkit' -- 'fixkit'
      },
      ['High'] = {
        'trojan_usb', -- 'gold',
        'diamond_ring' -- 'diamond'
      }
    },
  },
  ---@type vector3[] Locations of the trees
  ['Locations'] = {
    vector3(211.24, -932.15, 29.69), -- Legion Square
    vector3(-269.46, -955.23, 30.22), -- Base QB City Hall Building
    vector3(-1037.86, -2737.72, 19.17), -- LSIA
    vector3(-1811.87, -1206.59, 13.3), -- City Pier
    vector3(-413.05, 1168.69, 324.85), -- Observatory
    vector3(-3240.06, 970.25, 11.7), -- Great Ocean Highway pier
    vector3(608.15, 2745.24, 40.99), -- Sandy Shores Clothes Store
    vector3(1697.02, 3774.44, 33.75), -- Sandy Shores Ammunation
    vector3(1695.43, 4787.8, 41.01), -- Grapeseed
    vector3(127.36, 6632.87, 30.86) -- Paleto Bay
  },
  ---@type fun(source: integer|string?, text: string, type: string, time: integer?)
  ['Notify'] = function(source, text, type, time)
    local src = source
    local types = {['error'] = 'error', ['success'] = 'success', ['primary'] = 'primary'}
    -- Use the above table to change notify types to suit your notification resource
    if not IsDuplicityVersion() or not src then return end -- This checks whether the function is being called from the server or client
    -- ServerSide Notification
    -- local Player = duff.bridge.getplayer(src)
    -- if not Player then return end
    -- Player.showNotification(text)
    TriggerClientEvent('QBCore:Notify', src, text, types[type] or 'primary', time)
  end,
  ---@type {enabled: boolean, distance: number, icon: string}
  ['Target'] = {
    enabled = true, -- Whether to use a target system or drawtext
    distance = 1.5, -- The distance the player has to be within to see the target
    icon = 'fas fa-gift' -- The icon to use for the target | https://fontawesome.com/icons
  }
}