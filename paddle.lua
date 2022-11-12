local paddle = {
    p = { x = nil, y = nil },
    speed = 500,
    width = 100,
    height = 10,

    left = function(self)
        return self.p.x - (self.width / 2)
    end,

    right = function(self)
        return self.p.x + (self.width / 2)
    end,

    top = function(self)
        return self.p.y - (self.height / 2)
    end,

    bottom = function(self)
        return self.p.y + (self.height / 2)
    end,

    update = function(self, dt, screen)
        if love.keyboard.isDown("left") then
            self.p.x = self.p.x - (dt * self.speed)
            if self.p.x < (self.width / 2) then
                self.p.x = self.width / 2
            end
        end
        if love.keyboard.isDown("right") then
            self.p.x = self.p.x + (dt * self.speed)
            if self.p.x > (screen.width - (self.width / 2)) then
                self.p.x = screen.width - (self.width / 2)
            end
        end
    end,

    draw = function(self)
        love.graphics.rectangle(
        "fill",
        self.p.x - (self.width / 2),
        self.p.y - (self.height / 2),
        self.width,
        self.height
    )
    end,
}

-------------------------------------------------------------------------------
return paddle
