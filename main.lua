-- always place turtle facing positive X
direction = 1 --1X+ 2Z- 3X- 4Z+

function goForward()
    turtle.forward()
    if direction == 1 then
        x = x + 1
    elseif direction == 2 then
        z = z - 1
    elseif direction == 3 then
        x = x - 1
    elseif direction == 4 then
        z = z + 1
    end
    printCords()
end

function goUp()
    turtle.up()
    y = y + 1
    printCords()
end

function goDown()
    turtle.down()
    y = y - 1
    printCords()
end

function turnLeft()
    turtle.turnLeft()
    if direction == 4 then
        direction = 1
    else
        direction = direction + 1
    end
end

function turnRight()
    turtle.turnRight()
    if direction == 1 then
        direction = 4
    else
        direction = direction - 1
    end
end

function printCords()
    print("Cords: ", x, y, z)
end

function init()
    while tonumber(y) > 12 do
        if turtle.detectDown() then
            turtle.digDown()
            goDown()
        else
            goDown()
        end
    end
    print("Ready to mine!")
end

function checkInv()
    for j = 1, 16, 1 do
        local data = turtle.getItemDetail(j)
        if data then
            if data.name ~= "minecraft:diamond" and data.name ~= "minecraft:iron_ore" then
                turtle.select(j)
                turtle.drop()
                turtle.select(1)
            end
        end
    end
end

function mine()
    for i = 0, 100, 1 do

        if i % 10 == 0 then
            checkInv()
        end

        turnLeft()
        success, data = turtle.inspect()
        if success then
            if data.name == "minecraft:diamond_ore" then
                turtle.dig()
                diamondCount = diamondCount + 1
            end
        end

        turnRight()
        turnRight()
        success, data = turtle.inspect()
        if success then
            if data.name == "minecraft:diamond_ore" then
                turtle.dig()
                diamondCount = diamondCount + 1
            end
        end

        turnLeft()
        success, data = turtle.inspectUp()
        if success then
            if data.name == "minecraft:diamond_ore" then
                turtle.digUp()
                diamondCount = diamondCount + 1
            end
        end

        success, data = turtle.inspectDown()
        if success then
            if data.name == "minecraft:diamond_ore" then
                turtle.digDown()
                diamondCount = diamondCount + 1
            end
        end
        
        if turtle.detect() then
            success, data = turtle.inspect()
            if success then
                if data.name == "minecraft:diamond_ore" then
                    diamondCount = diamondCount + 1
                end
            end
            turtle.dig()
            goForward()
        else
            goForward()
        end
    end
end

print("Give x, y, z")
x = read()
y = read()
z = read()

diamondCount = 0
--print("Give depth limit")
--local limit = read()

turtle.refuel()
init()
mine()
print("Found ", diamondCount, " diamonds!")