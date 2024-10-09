local utils = {}

function utils.is_bin_available(bin)
    local handle = io.popen("which " .. bin .." 2>/dev/null")
    local result = handle:read("*a")
    handle:close()

    return result and result ~= ""
end

return utils
