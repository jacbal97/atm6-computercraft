local modem = peripheral.find("modem")
local set = false
local channel = 3089

while true do
    modem.open(channel)
    local syf1, syf2, syf3, syf4, message = os.pullEvent("modem_message")
    if (message == true) then
        redstone.setAnalogOutput("back", 1)
    else
        redstone.setAnalogOutput("back", 0)
    end
end

