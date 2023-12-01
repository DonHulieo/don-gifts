# don-gifts

Don's Christmas Gifts for FiveM! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5395562).

## Features

- Optimised code, Resting Resmon of 0.0ms and Peaking at 0.04ms Whilst Displaying DrawText.
- Christmas Gift Daily Rewards System
- Players Can Only Claim One Gift Per Pre-Configured Time Period (default 24 hours)
- The Gift can be either;
  - *Fully Unique* picking a Random item from your Shared Items (excluding weapons) or
  - *Randomised* picking a Random item from the Config table
- 10 Trees Pre-Configured, with the Ability to Add More
- Discord Logs for When a Player Claims a Gift

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
      - [DrawText](#drawtext)
      - [Rewards](#rewards)
      - [Locations](#locations)
      - [Notifications](#notifications)
    - [Support](#support)
    - [Changelog](#changelog)

### Preview

- [Don-Gifts](https://www.youtube.com/watch?v=HyM6QdLv-bA)

### Installation

#### Dependencies

- [oxmysql](https://github.com/overextended/oxmysql/releases/tag/v2.7.6)
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
Config.UseTarget = true
Config.Model = `prop_xmas_tree_int`
```

- `Config.UseTarget` boolean, if set false, the player will be able to claim the gift by walking up to the tree and pressing E.
- `Config.Model` string, the model of the tree, this is used for the target. Can be either a hash or a model name.

#### Blips

```lua
Config.Blips = {
  enabled = true,
  name = 'Christmas Tree',
  sprite = 781,
  colour = 25,
  scale = 0.8,
  shortRange = true
}
```

- `enabled` boolean, if set false, the blips will not be shown on the map.
- `name` string, the name of the blip.
- `sprite` integer, the sprite of the blip.
- `colour` integer, the colour of the blip.
- `scale` float, the scale of the blip.
- `shortRange` boolean, if set true, the blip will only be shown when the player is within 425 units of the tree.

#### DrawText

```lua
Config.DrawText = {
  ['grabGift'] = 'Press [~g~E~w~] to grab a gift',
  ['hasGift'] = 'You already have a gift!'
}
```

- `['grabGift']` string, the text to display when the player is within 2.5 units of the tree and doesn't have a gift.
- `['hasGift']` string, the text to display when the player is within 2.5 units of the tree and has a gift.

#### Rewards

```lua
Config.Gifts = {
  unique = false,
  min = 1,
  max = 3,
  total = 5,
  time = '24:00:00',
  ['Items'] = {
    ['Low'] = { -- These items have a 50% chance of being in the present
      'coffee',
      'joint',
      'screwdriverset',
      'whiskey',
      'tosti',
      'snikkel_candy',
      'lockpick',
      'water_bottle'
    },
    ['Med'] = { -- These items have a 35% chance of being in the present
      'security_card_01',
      'security_card_02',
      'advancedlockpick',
      'repairkit'
    },
    ['High'] = { -- These items have a 15% chance of being in the present
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
- The items are split into 3 categories, `['Low']`, `['Med']` and `['High']`. The items are then randomly selected from these categories, with the chance of each category being selected being 50%, 35% and 15% respectively.

#### Locations

```lua
Config.Locations = {
  vector3(211.24, -932.15, 29.69),
  vector3(-269.46, -955.23, 30.22),
  ..., -- Add more locations here
}
```

Follow the format above to add more locations. The script will automatically create the trees at these locations.

#### Notifications

```lua
---@param source number|string|nil The source of the player
---@param text string The text to send
---@param type string The type of notification
function Config.Notify(source, text, type)
  if IsDuplicityVersion() then
    local src = source
    -- Put Your Server Side Notification Here
  else
    -- Put Your Client Side Notification Here
  end
end
```

- `Config.Notify` function, this is used to send notifications to the player. You can use this to send notifications to the player in your own way. Whether that be okok, base QB or ox_lib!

### Support

- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels.
- Open a ticket and please have your Tebex Transation ID ready 🙂.

### Changelog

- v1.0.5 - Automatic MultiFramework Support (Target, Inventory and Core Functions)
- v1.0.4 - Add Support for ESX
- v1.0.3 - Refactor Code and Add PolyZones
- v1.0.1 - Linting
- v1.0.0 - Initial Release
