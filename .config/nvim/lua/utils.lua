local utils = {}

function utils.is_cargo_available()
    local handle = io.popen("which cargo 2>/dev/null")
    local result = handle:read("*a")
    handle:close()

    return result and result ~= ""
end

return utils
