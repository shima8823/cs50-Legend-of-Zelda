--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        consumable = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['pot'] = {
        type = 'pot',
        texture = 'tiles',
        frame = 14,
        width = 16,
        height = 16,
        solid = true,
        consumable = false,
        defaultState = 'unbroken',
        states = {
            ['unbroken'] = {
                frame = 14
            },
            ['broken'] = {
                frame = 52
            }
        },
    },
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        consumable = true,
        defaultState = 'full',
        states = {
            ['full'] = {
                frame = 5
            }
        },
        onConsume = function(player)
            gSounds['recovery']:play()
            player.health = math.min(6, player.health + 2)
        end
    },
}