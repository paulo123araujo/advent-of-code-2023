local numbers = 0

function getLastDigitFromString(str)
    local to_return = nil
    local c = str
    while true do
        local i = getIndex(c, "%d")
        if not i then
            break
        end
        to_return = string.match(c, "%d")
        c = string.sub(c, 1, i - 1) .. string.sub(c, i + 1)
    end
    return to_return
end

function getIndex(str, chr)
    local index = string.find(str, chr, 1, false)
    return index
end

while true do
    local line = io.read("L")
    if line == nil then
        break
    end
    local first_number = string.match(line, "%d")
    local last_number = getLastDigitFromString(line)

    numbers = numbers + tonumber(first_number .. last_number)
end

print(numbers)
