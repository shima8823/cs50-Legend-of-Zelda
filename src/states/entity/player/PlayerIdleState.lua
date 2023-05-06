--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:init(player, dungeon)
    EntityIdleState.init(self, player)
    self.dungeon = dungeon
end

function PlayerIdleState:enter(player, dungeon)
    
    -- render offset for spaced character sprite (negated in render function of state)
    self.entity.offsetY = 5
    self.entity.offsetX = 0

    if self.entity.hasPot then
        self.entity:changeAnimation('idle-pot-' .. self.entity.direction)
    end
end

function PlayerIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk')
    end

    if love.keyboard.wasPressed('space') then
        if self.entity.hasPot then
            self.entity:changeState('pot-throw')
            self.entity.pot.projectile = Projectile(self.entity, self.dungeon)
            self.entity.pot = nil
        else
            self.entity:changeState('swing-sword')
        end
    end

    if (love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return')) and self.entity.pot and not self.entity.hasPot and not self.entity.pot.isBroken then
        self.entity:changeState('pot-lift')
    end

end