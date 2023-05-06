PlayerPotLiftState = Class{__includes = BaseState}

function PlayerPotLiftState:init(player)
    self.player = player
    self.dungeon = dungeon
    self.player.pot.solid = false

    self.player:changeAnimation('pot-lift-' .. self.player.direction)

    Timer.tween(0.45, {
        [self.player.pot] = {x = self.player.x, y = self.player.y - self.player.pot.height + 7}
    }):finish(function()
        self.player.hasPot = true
        self.player:changeState('walk')
    end)

end

function PlayerPotLiftState:enter(params)
    self.player.currentAnimation:refresh()
end

function PlayerPotLiftState:update(dt)
    -- if we've fully elapsed through one cycle of animation, change back to idle state
    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end
end

function PlayerPotLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end