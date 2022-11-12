local ball = {
    p0 = { x = nil, y = nil },
    p = { x = nil, y = nil },
    v = { x = 0, y = 0 },
    width = 10,
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
    
    update = function(self, dt, screen, paddle)
        self.p0.x = self.p.x
        self.p0.y = self.p.y
        self.p.x = self.p.x + (self.v.x * dt)
        self.p.y = self.p.y + (self.v.y * dt)

        if self:left() < screen:left() then
            self.v.x = -self.v.x
        end
        if self:right() > screen:right() then
            self.v.x = -self.v.x
        end

        --local prevBottom = self.p0.x - (self.height / 2)
        -- ??? Ugh, draw the fucking thing
        --local hitPaddleY = (prevBottom < paddle:top()) and
        --   (self:bottom() > paddle:top())
        local hitPaddleX = ((self:right() > paddle:left()) or
            (self:left() < paddle:right())) and
            (self:bottom() > paddle:top())

        if hitPaddleY and hitPaddleX then
            self.p.y = paddle:top() - (self.height / 2)
            self.v.y = -self.v.y
        end
    end,

    draw = function(self)
        love.graphics.rectangle(
            "fill",
            self:left(),
            self:top(),
            self.width,
            self.height
        )
    end,
}

-------------------------------------------------------------------------------
return ball
