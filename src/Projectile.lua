--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{}

function Projectile:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon
    self.potDirection = self.player.direction
    self.pot = self.player.pot
    self.speed = 100
    self.pot.isBroken = false
    
    self.maxDistanceX = 4 * TILE_SIZE
    self.initPosX = self.pot.x
    self.initPosY = self.pot.y
    
    self.pot.y = self.pot.y + self.pot.height
end

function Projectile:update(dt)
    if self.pot.isBroken then
        return
    end

    if self.pot.x > self.initPosX + self.maxDistanceX or
        self.pot.x < self.initPosX - self.maxDistanceX or
        self.pot.y > self.initPosY + self.maxDistanceX or
        self.pot.y < self.initPosY - self.maxDistanceX then
        self:onCollision()
        return
    end

    -- directionの方向にポットを投げる
    if self.potDirection == 'left' then
        self.pot.x = self.pot.x - self.speed * dt
        if self.pot.x <= MAP_RENDER_OFFSET_X + TILE_SIZE then
            self.pot.x = MAP_RENDER_OFFSET_X + TILE_SIZE
            self:onCollision()
        end
    elseif self.potDirection == 'right' then
        self.pot.x = self.pot.x + self.speed * dt
        if self.pot.x + self.pot.width >= VIRTUAL_WIDTH - TILE_SIZE * 2 then
            self.pot.x = VIRTUAL_WIDTH - TILE_SIZE * 2 - self.pot.width
            self:onCollision()
        end
    elseif self.potDirection == 'up' then
        self.pot.y = self.pot.y - self.speed * dt
        if self.pot.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE - self.pot.height / 2 then 
            self.pot.y = MAP_RENDER_OFFSET_Y + TILE_SIZE - self.pot.height / 2
            self:onCollision()
        end
    elseif self.potDirection == 'down' then
        self.pot.y = self.pot.y + self.speed * dt
        local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) 
        + MAP_RENDER_OFFSET_Y - TILE_SIZE
        if self.pot.y + self.pot.height >= bottomEdge then
            self.pot.y = bottomEdge - self.pot.height
            self:onCollision()
        end
    end
end

function Projectile:onCollision()
    self.pot.state = 'broken'
    self.pot.isBroken = true
    Timer.after(2, function()
        for k, object in pairs(self.dungeon.currentRoom.objects) do
            if object == self.pot then
                table.remove(self.dungeon.currentRoom.objects, k)
            end
        end
    end)
end

function Projectile:stopPostion(entity)
    -- それぞれの方向で当たった時の処理
    if self.potDirection == 'left' then
        self.pot.x = entity.x + entity.width
    elseif self.potDirection == 'right' then
        self.pot.x = entity.x - self.pot.width
    elseif self.potDirection == 'up' then
        self.pot.y = entity.y + entity.height
    elseif self.potDirection == 'down' then
        self.pot.y = entity.y - self.pot.height
    end
end