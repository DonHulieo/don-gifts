# don-gifts

Don's Daily Gifts for FiveM! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5395562).

## Features

- Optimised Code, Resting Resmon of 0.00ms and Remaining at 0.0ms in Use or Peaking at 0.04ms Whilst Displaying DrawText.
- Default Christmas Theme, but Can be Changed to Suit Any Theme.
- Daily Rewards System
- Players Can Only Claim One Gift Per Pre-Configured Time Period (default 24 hours)
- The Gift can be either;
  - *Fully Unique* Items are Randomly Picked From Your Framework's Items Table (excluding weapons)
  - *Randomised* Items are Picked From 3 Categories, Low, Medium and High, with the Chance of Each Category being Configurable
- 10 Trees Pre-Configured, with the Ability to Add More
- Discord Logs for When a Player Claims a Gift
- Anti Exploit Checks for When a Player Claims a Gift

## Table of Contents

- [don-gifts](#don-gifts)
  - [Features](#features)
  - [Table of Contents](#table-of-contents)
    - [Preview](#preview)
    - [Installation](#installation)
      - [Dependencies](#dependencies)
      - [Initial Setup](#initial-setup)
    - [Configuration](#configuration)
      - [Image and Item](#image-and-item)
        - [qb-inventory](#qb-inventory)
        - [ox\_inventory](#ox_inventory)
      - [Globals](#globals)
      - [Blips](#blips)
      - [Discord Logs](#discord-logs)
      - [Rewards](#rewards)
      - [Locations](#locations)
      - [Locales](#locales)
      - [Notifications](#notifications)
      - [Target](#target)
    - [Support](#support)
    - [Changelog](#changelog)

### Preview

[don-gifts](https://www.youtube.com/watch?v=HyM6QdLv-bA)

### Installation

#### Dependencies

**This script requires the following scripts to be installed:**

- [duff](https://github.com/DonHulieo/duff)

**Depending on your Framework, Inventory and if you use a Targetting system, you will need to have installed either of the following dependencies:**

- [qb-core](https://github.com/qbcore-framework/qb-core)
- [es_extended](https://github.com/esx-framework/esx_core)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [ox_inventory](https://github.com/overextended/ox_inventory)
- [ox_target](https://github.com/overextended/ox_target)
- [qb-target](https://github.com/qbcore-framework/qb-target)

#### Initial Setup

- Always use the latest FiveM artifacts (tested on 6683), you can find them [here](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/).
- Download the latest version from your keymaster.
- Extract the contents of the zip file into your resources folder, into a folder which starts after your framework & `duff` or;
- Ensure the script in your `server.cfg` after your framework & `duff`.
- Configure `shared/config.lua` to your liking, see [Configuration](#configuration) for more information.

### Configuration

#### Image and Item

- Add the image here to your relevant framework inventory folder.
- Add the item to your relevant framework shared items, following the formats below.

##### qb-inventory

```lua
present = {
  name = 'present',
  label = 'Present',
  weight = 500,
  type = 'item',
  image = 'present.png',
  unique = false,
  useable = true,
  shouldClose = true,
  combinable = nil,
  description = 'Have you been naughty or nice?'
}
```

##### ox_inventory

```lua
['present'] = {
  label = 'Gift',
  weight = 1000,
  stack = true,
  close = true,
  description = 'A gift for someone special',
  client = {
    image = 'present.png',
  },
  server = {
    export = 'don-gifts.present'
  }
}
```

**Note:** The item name must be `present` and the image name must be `present.png`, but the rest of the item can be configured to your framework and liking.

#### Globals

```lua
['DebugMode'] = false,
['Model'] = `prop_xmas_tree_int`,
```

- `DebugMode` boolean, whether to show debug messages in the console.
- `Model` integer|string, the model of the object, this is also used for the target. Can be either a hash or a model name. You can find the model names [here](https://forge.plebmasters.de/objects).

#### Blips

```lua
['Blips'] = {
  enabled = true,
  sprite = 781,
  colour = 25,
  scale = 0.8,
  shortRange = true
}
```

- `enabled` boolean, whether to show blips on the map.
- `sprite` integer, the sprite of the blip, you can find the sprites [here](https://docs.fivem.net/docs/game-references/blips/).
- `colour` integer, the colour of the blip, you can find the colours [here](https://docs.fivem.net/docs/game-references/blips/#blip-colors).
- `scale` float, the scale of the blip.
- `shortRange` boolean, whether the blip is shown when close to the player or always.

#### Discord Logs

**Note:** You will need to have a Discord Webhook setup to use this feature. Your webhook should be saved on line 8 of `server/logs.lua`.

```lua
['DiscordLogs'] = {
  enabled = true,
  image = '',
  colour = 65309
}
```

- `enabled` boolean, whether to log to discord.
- `image` string, the image to use for the logs.
- `colour` integer, the colour of the embed, you can find the colours [here](https://www.spycolor.com/).

#### Rewards

```lua
['Gifts'] = {
  unique = true,
  min = 1,
  max = 3,
  total = 5,
  time = '24:00:00',
  ['Items'] = {
    ['BlackList'] = {
      'present',
      'radioscanner'
    },
    ['Chance'] = {
      ['Low'] = 50,
      ['Med'] = 35,
      ['High'] = 15
    },
    ['Low'] = {
      'coffee',
      'joint',
      'screwdriverset',
      'whiskey',
      'lockpick',
      'water_bottle'
    },
    ['Med'] = {
      'security_card_01',
      'security_card_02',
      'advancedlockpick',
      'repairkit'
    },
    ['High'] = {
      'trojan_usb',
      'diamond_ring'
    }
  },
}
```

- `unique` boolean, whether to reward a random set of items from your items table (excluding weapons) or to reward items from the `['Items']` table.
- `min` integer, the minimum amount of each item.
- `max` integer, the maximum amount of each item.
- `total` integer, the amount of different items in the present.
- `time` string, the amount of time before a player can open another present (accurate to the second).
- `['Items']` table, the items that can be in the present if `['Gifts'].unique` is set to false.
- `['Items']['BlackList']` table, the items that will not be in the present if `['Gifts'].unique` is set to true.
- `['Items']['Chance]` table, the chance of each category being in the present if `['Gifts'].unique` is set to false.
- The items are then split into 3 more categories, `['Low']`, `['Med']` and `['High']`. The items are then randomly selected from these categories, with the chance of each category being determined by the `['Chance]` table.

#### Locations

```lua
['Locations'] = {
  vector3(211.24, -932.15, 29.69),
  vector3(-269.46, -955.23, 30.22),
  vector3(-1037.86, -2737.72, 19.17),
  vector3(-1811.87, -1206.59, 13.3),
  vector3(-413.05, 1168.69, 324.85),
  vector3(-3240.06, 970.25, 11.7),
  vector3(608.15, 2745.24, 40.99),
  vector3(1697.02, 3774.44, 33.75),
  vector3(1695.43, 4787.8, 41.01),
  vector3(127.36, 6632.87, 30.86)
}
```

Follow the format above to add more locations. The script will automatically create the objects at these locations.

#### Locales

If you are using a locale other than English, you will need to translate the `en.lua` file, if your locale is not already included.

#### Notifications

```lua
---@param source number|string|nil The source of the player
---@param text string The text to send
---@param type string The type of notification
---@param time number|nil The time to show the notification
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
end
```

- `Notify` function, this is used to send notifications to the player. You can use this to send notifications to the player in your own way. Whether that be okok, base QB or ox_lib!
- `types` table, this is used to change the notification types to suit your notification resource. The default is set to `qb`'s notification types. To change this, simply change the value of the key to the type of notification you want to send. (ie. for okok, change `['primary'] = 'primary'` to `['primary'] = 'info'`).

#### Target

```lua
['Target'] = {
  enabled = true, -- Set to false if you don't want to use qb-target or ox_target
  distance = 1.5, -- Distance to draw the target
  icon = 'fas fa-gift' -- https://fontawesome.com/icons
}
```

- `enabled` boolean, whether to use a target system or drawtext.
- `distance` float, the distance the player has to be within to see the target.
- `icon` string, the icon to use for the target. You can find the icons [here](https://fontawesome.com/icons).

### Support

- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels.
- Open a ticket and please have your Tebex Transation ID ready 🙂.

### Changelog

- v1.1.7 - Fixes for Aysnchronous Callbacks, Linting and Annotations updates.
- v1.1.6 - Object creation moved to the server side, PolyZones' removed and replaced with [CMapZones](https://github.com/DonHulieo/duff/blob/main/server/mapzones.lua).
- v1.1.5 - Support updates for [duff](https://github.com/DonHulieo/duff).
- v1.1.4 - Add [duff](https://github.com/DonHulieo/duff) as a dependency.
- v1.1.3 - Changed to use Promises in Version Checker, Fixed Crash Related to Blips & Update README.
- v1.1.2 - Improve Blip Deletion, Fix Some Annotations & Improve RNG.
- v1.1.1 - Added Configurable Chance for Each Category, Removed `oxmysql` in Favour of Resourve KVPs and Code Linting.
- v1.1.0 - Attempt to Fix Ghost `name` column in SQL, Added Exploit Check for Recieving Gifts & Added a Version Checker.
- v1.0.9 - Improve Weapon Check on Present Items and Added Logs for Items in Present.
- v1.0.8 - Created Locales, Small Edits to Notify and Fixed Issue With ESX Inventories Always Returning Full.
- v1.0.7 - Fixed Issue With Items in High Table Not Being Added to Present.
- v1.0.6 - Added a Notify if the Players Inventory is Full and Added Item Blacklist for Unique Gifts.
- v1.0.5 - Automatic MultiFramework Support (Target, Inventory and Core Functions).
- v1.0.4 - Add Support for ESX.
- v1.0.3 - Refactor Code and Add PolyZones.
- v1.0.1 - Linting.
- v1.0.0 - Initial Release.
