Config = {}

Config.Model = `prop_xmas_tree_int` -- Model of the object | Can Be Either a String or Hash | https://forge.plebmasters.de/objects

Config.Blips = {
  enabled = true, -- Set to false if you don't want blips
  sprite = 781, -- Blip sprite
  colour = 25, -- Blip colour
  scale = 0.8, -- Blip scale
  shortRange = true -- Blip only shows when within 425 units of the tree
}

Config.DiscordLogs = {
  enabled = true, -- Set to true if you want to log to discord
  image = '', -- Set to the image you want to use for the logs
  colour = 65309 -- https://www.spycolor.com/
}

Config.Gifts = {
  unique = true, -- If set to true, the present will find a totally random set of items from your QBCore.Share.items table.
  min = 1, -- minimum amount of each item
  max = 3, -- maximum amount of each item
  total = 5, -- amount of different items in the present
  time = '24:00:00', -- amount of time before a player can open another present
  ['Items'] = { -- If Config.Unique is false, the items will be randomly selected from this list
    ['BlackList'] = { -- These items will never be in the present
      'present',
      'radioscanner'
    },
    ['Low'] = { -- These items have a 50% chance of being in the present
      'coffee', -- 'bread',
      'joint', -- 'cannabis',
      'screwdriverset', -- 'carotool',
      'whiskey', -- 'phone',
      'lockpick', -- 'radio',
      'water_bottle' -- 'water'
    },
    ['Med'] = { -- These items have a 35% chance of being in the present
      'security_card_01', -- 'gazbottle',
      'security_card_02', -- 'iron',
      'advancedlockpick', -- 'medikit',
      'repairkit' -- 'fixkit'
    },
    ['High'] = { -- These items have a 15% chance of being in the present
      'trojan_usb', -- 'gold',
      'diamond_ring' -- 'diamond'
    }
  }
}

Config.Locations = {
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
}

---@param source number|string|nil The source of the player
---@param text string The text to send
---@param type string The type of notification
---@param time number|nil The time to show the notification
function Config.Notify(source, text, type, time)
  local src = source
  local types = {['error'] = 'error', ['success'] = 'success', ['primary'] = 'primary'}
  -- Use the above table to change notify types to suit your notification resource
  if not IsDuplicityVersion() or not src then return end -- This checks whether the function is being called from the server or client
  -- ServerSide Notification
  -- local Player = GetPlayerData(src)
  -- if not Player then return end
  -- Player.showNotification(text)
  TriggerClientEvent('QBCore:Notify', src, text, types[type] or 'primary', time)
end

Config.Target = {
  enabled = true, -- Set to false if you don't want to use qb-target or ox_target
  distance = 1.5, -- Distance to draw the target
  icon = 'fas fa-gift' -- https://fontawesome.com/icons
}
