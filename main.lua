local targetImage
local targetX, targetY
local targetWidth, targetHeight
local isTargetClicked

function love.load()
    love.window.setMode(800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})
    
    target = {}

    target.x = 200 
    target.y = 200 

    target.radius = 50  -- Corrigido 'radius' em vez de 'raidus'
    target.radius1 = 40
    target.radius2 = 30
    target.radius3 = 20
    target.radius4 = 10

    background = love.graphics.newImage("img/fundo.png")

    score = 0
    misses = 0 -- Novo contador de erros
    timer = 0

    gameFont = love.graphics.newFont(40)
end

function love.keypressed(key)
    if key == "r" then
        timer = 0
    end
end

function love.update(dt)
    timer = timer + dt
end

function love.draw()
    -- Redefine a cor para branco antes de desenhar o fundo
    love.graphics.setColor(1, 1, 1)

    -- Desenho do background
    for i = 0, love.graphics.getWidth() / background:getWidth() do
        for j = 0, love.graphics.getHeight() / background:getHeight() do
            love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end 
    love.graphics.draw(background, 0, 0, 0, love.graphics.getWidth() / background:getWidth(), love.graphics.getHeight() / background:getHeight())

    -- Desenho dos círculos do alvo
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius)
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", target.x, target.y, target.radius1)
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", target.x, target.y, target.radius3)
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius4)

    -- Desenho da pontuação e do temporizador
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print("Score: " .. score .. " " .. misses, 0, 0)  -- Exibindo a pontuação e os erros no formato "Score: 0 0"
    love.graphics.print("Timer: " .. string.format("%.2f", timer), 300, 0) -- Timer na posição corrigida
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            score = score + 1
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
        else
            misses = misses + 1 -- Incrementa os erros quando clica fora do alvo
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
