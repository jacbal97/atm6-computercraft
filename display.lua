local monitor = peripheral.find("monitor")
local modem = peripheral.find("modem")
local channel = 3089
local storage = {}

--monitor vars
local mobFarmArray = {1, 1, 10, 4}

function winCreate(arr)
    return window.create(monitor,arr[1],arr[2],arr[3],arr[4])
end

function getArea(arr, x, y)
    if(x > arr[1] and x < arr[1] + arr[3] and y > arr[2] and y < arr[2] + arr[4]) then
        return true
    else
        return false
    end
end

function action(event, button, x, y)
    local type, button, x, y = os.pullEvent()
    print(type, button, x, y)
    if button == "top" then

        if (getArea(mobFarmArray,x,y)) then
            if(storage[1] == true) then
                storage[1] = false
                return channel, false
            else
                storage[1] = true
                return channel, true
            end
        end

    end
    return nil
end

function display()

    local mobFarm = winCreate(mobFarmArray)

    if (storage[1] == true) then
        mobFarm.setBackgroundColor(colors.green)
    else
        mobFarm.setBackgroundColor(colors.red)
    end
    mobFarm.clear()
end
    

while true do
    display()
    local arr = os.pullEvent()
    if(arr == "monitor_touch") then
            port, task = action()
        if(task ~= nil) then
            modem.transmit(port, port+1, task)  
        end
    end
end