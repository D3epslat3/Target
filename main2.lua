function love.load()
    targat2 = {}
    targat2.x = 300 
    targat2.y = 300 

    targat2.raidus = 50
    targat2.raidus1 = 40
    targat2.raidus2 = 30
    targat2.raidus3 = 20
    targat2.raidus4 = 10
end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", targat2.x, targat2.y, targat2.raidus)
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", targat2.x, targat2.y, targat2.raidus1)
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", targat2.x, targat2.y, targat2.raidus2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", targat2.x, targat2.y, targat2.raidus3)
    love.graphics.setColor(1, 1, 0)
    love.graphics.circle("fill", targat2.x, targat2.y, targat2.raidus4)
end


function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        local mouseToTarget = distanceBetween(x, y, targat2.x, targat2.y)
        if mouseToTarget < targat.raidus then
            score = score + 1
            targat2.x = math.random(targat2.raidus, love.graphics.getWidth() - targat2.raidus)
            targat2.y = math.random(targat2.raidus, love.graphics.getHeight() - targat2.raidus)
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end