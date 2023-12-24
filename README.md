# don-gifts

Don's Christmas Gifts for FiveM! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5395562).

## Features

- Optimised code, Resting Resmon of 0.00ms and Remaining at 0.0ms in Use or Peaking at 0.04ms Whilst Displaying DrawText.
- Christmas Gift Daily Rewards System
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
      - [Globals](#globals)
      - [Blips](#blips)
      - [Rewards](#rewards)
      - [Locations](#locations)
      - [Locales](#locales)
      - [Notifications](#notifications)
      - [Target](#target)
    - [Support](#support)
    - [Changelog](#changelog)

### Preview

[Don-Gifts YouTube Preview](https://www.youtube.com/watch?v=HyM6QdLv-bA)

### Installation

#### Dependencies

- [PolyZone](https://github.com/mkafrin/PolyZone)

**Depending on your Framework and if you use a Targetting system, you will need to have installed either of the following dependencies:**

- [QBCore](https://github.com/qbcore-framework/qb-core)
- [ESX](https://github.com/esx-framework/esx_core)
- [ox_target](https://github.com/overextended/ox_target)
- [qb-target](https://github.com/qbcore-framework/qb-target)

#### Initial Setup

- Always use the latest FiveM artifacts (tested on 6683), you can find them [here](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/).
- Download the latest version from your keymaster.
- Extract the contents of the zip file into your resources folder, into a folder which starts after your framework or;
- Ensure the script in your `server.cfg` after your framework.
- Install the Present Image and Item (see below).

**Note:** This script automatically inserts the required SQL into your database. It also configures it's Target, Inventory and Core functions to work with your framework, automatically.

### Configuration

#### Image and Item

- Add the image here to your relevant framework inventory folder.
- Add the item to your relevant framework shared items, following the format below.

```lua
['present'] = {
  ['name'] = 'present', 
  ['label'] = 'Present', 
  ['weight'] = 500, 
  ['type'] = 'item', 
  ['image'] = 'present.png', 
  ['unique'] = false, 
  ['useable'] = true, 
  ['shouldClose'] = true, 
  ['combinable'] = nil, 
  ['description'] = 'Have you been naughty or nice?'
},
```

**Note** The item name must be `present` and the image name must be `present.png`, but the rest of the item can be configured to your framework and liking.

#### Globals

```lua
Config.DebugMode = false
Config.Locale = 'en'
Config.Model = `prop_xmas_tree_int`
```

- `Config.DebugMode` boolean, if set true, the script will print debug messages to the console.
- `Config.Locale` string, the locale to use for the script. This is for non QBCore framework users. You can find the names in the `locales` folder.
- `Config.Model` string, the model of the tree, this is used for the target. Can be either a hash or a model name. You can find the model names [here](https://forge.plebmasters.de/objects).

#### Blips

```lua
Config.Blips = {
  enabled = true,
  sprite = 781,
  colour = 25,
  scale = 0.8,
  shortRange = true
}
```

- `enabled` boolean, if set false, the blips will not be shown on the map.
- `sprite` integer, the sprite of the blip.
- `colour` integer, the colour of the blip.
- `scale` float, the scale of the blip.
- `shortRange` boolean, if set true, the blip will only be shown when the player is within 425 units of the tree.

#### Rewards

```lua
Config.Gifts = {
  unique = false,
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
      'tosti',
      'snikkel_candy',
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
  }
}
```

- `unique` boolean, if set true, the present will find a totally random set of items from your QBCore.Share.items table (excluding weapons).
- `min` integer, the minimum amount of each item.
- `max` integer, the maximum amount of each item.
- `total` integer, the amount of different items in the present.
- `time` string, the amount of time before a player can open another present (accurate to the second).
- `['Items']` table, the items that can be in the present if `Config.Gifts.unique` is set to false.
- `['Items']['BlackList']` table, the items that will not be in the present if `Config.Gifts.unique` is set to true.
- `['Items']['Chance]` table, the chance of each category being in the present if `Config.Gifts.unique` is set to false.
- The items are then split into 3 more categories, `['Low']`, `['Med']` and `['High']`. The items are then randomly selected from these categories, with the chance of each category being determined by the `['Chance]` table.

#### Locations

```lua
Config.Locations = {
  vector3(211.24, -932.15, 29.69),
  vector3(-269.46, -955.23, 30.22),
  ..., -- Add more locations here
}
```

Follow the format above to add more locations. The script will automatically create the trees at these locations.

#### Locales

When changing the locales, please ensure you the fxmanifest.lua is set to the correct locale. For example, if you are using English, the fxmanifest.lua `shared_scripts` should look like this:

```lua
shared_scripts {'locales/lang.lua', 'locales/en.lua', ...}
```

Where `locales/en.lua` is the locale you are using. If you are using another locale, change the `en` to the locale you are using.
**Note:** If you are using a locale other than English, you will need to translate the `en.lua` file, if your locale is not already included.

#### Notifications

```lua
---@param source number|string|nil The source of the player
---@param text string The text to send
---@param type string The type of notification
---@param time number|nil The time to show the notification
function Config.Notify(source, text, type, time)
  local src = source
  local types = {['error'] = 'error', ['success'] = 'success', ['primary'] = 'primary'}
  if not IsDuplicityVersion() or not src then return end
  -- ServerSide Notification
end
```

- `Config.Notify` function, this is used to send notifications to the player. You can use this to send notifications to the player in your own way. Whether that be okok, base QB or ox_lib!
- `types` table, this is used to change the notification types to suit your notification resource. The default is set to `qb`'s notification types. To change this, simply change the value of the key to the type of notification you want to send. (ie. for okok, change `['primary'] = 'primary'` to `['primary'] = 'info'`).

#### Target

```lua
Config.Target = {
  enabled = true,
  distance = 1.5,
  icon = 'fas fa-gift'
}
```

- `enabled` boolean, if set false, the target will not be shown.
- `distance` float, the distance to draw the target.
- `icon` string, the icon to use for the target. You can find the icons [here](https://fontawesome.com/icons).

### Support

- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels.
- Open a ticket and please have your Tebex Transation ID ready 🙂.

### Changelog

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
