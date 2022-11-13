local screen = require("screen")
local ball = require("ball")
local paddle = require("paddle")

-------------------------------------------------------------------------------
function reset()
    ball.p.x = screen.width / 2
    ball.p.y = screen.height / 2
    ball.v.x = math.random() * 500
    ball.v.y = math.random() * 500
    paddle.p.x = screen.width / 2
    paddle.p.y = screen.height - (paddle.height / 2) - 10
end

-------------------------------------------------------------------------------
function love.load()
    love.window.setMode(screen.width, screen.height)
    reset()
end

function love.update(dt)
    ball:update(dt, screen, paddle)
    paddle:update(dt, screen)
    if love.keyboard.isDown("r") then
        reset()
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    ball:draw()
    paddle:draw()
end
