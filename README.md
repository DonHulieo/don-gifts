# don-gifts
Don's Christmas Gifts for QBCore! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5395562).

# Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)

# Features
- Optimised code, resmon of 0.0ms in rest, 0.0ms in use whilst using QB Target and 0.5ms with DrawText.
- Christmas Gift Daily Rewards System
- Players can only claim one gift per day
- The Gift can be either;
    - *Fully Unique* picking a Random set of items from your Shared Items (excluding weapons) or
    - *Randomised* picking a Random set of items from a list of items you set in the Config
- 10 Trees preconfigured, but you can add as many as you want
- Discord Logs for when a player claims a gift 

# Preview
- *coming soon..*

# Important Config
```
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
```
# Image and Item
- Add the image here to \qb-invetory\html\images
- Add the item to your QBCore shared items
```
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
    ['description'] = 'Have you been naughty or nice?'},
```
# Support
- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels. 
- Open a ticket and please have your Tebex Transation ID ready 🙂.

# Changelog
- v1.0.0 - Initial Release
