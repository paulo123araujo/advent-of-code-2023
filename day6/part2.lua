local data = {}

local read_time = function(str)
    for n in str:gmatch("%d+") do
        table.insert(data, { time = tonumber(n) })
    end
end

local read_distance = function(str)
    local i = 1
    for n in str:gmatch("%d+") do
        data[i].distance = tonumber(n)
        i = i + 1
    end
end

local calculate_total = function()
    local total = 1
    for _, item in ipairs(data) do
        local c = 0
        for i = 1, item.time, 1 do
            if i * (item.time - i) > item.distance then
                c = c + 1
            end
        end
        total = total * c
    end

    return total
end

while true do
    local line = io.read("L")
    if line == nil then
        break
    end

    line = line:gsub("%s+", "")
    if line:match("(%w+)(.*)") == "Time" then
        read_time(line)
    else
        read_distance(line)
    end
end

print(calculate_total())
