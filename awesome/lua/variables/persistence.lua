local debounce_state_timer = nil
local state_path = gears.filesystem.get_dir("cache") .. "my_state.lua"
local M = fn.load_file(state_path)

if type(M) ~= "table" then
    M = {}
end

M.set = function(key, value)
    if type(key) == "table" then
        for k, v in pairs(key) do
            M[k] = v
        end
    elseif key then
        M[key] = value
    end

    if debounce_state_timer then
        debounce_state_timer:stop()
    end

    debounce_state_timer = gears.timer.start_new(5, function()
        M.write()
        debounce_state_timer = nil
        return false -- Return false so timer executes once
    end)
end

M.write = function()
    local file = io.open(state_path, "w")

    if file then
        file:write("return {\n")

        for k, v in pairs(M) do
            local t = type(v)
            if t == "function" then
                -- Don't write these
            elseif t == "string" then
                file:write(string.format("    [%q] = %q,\n", k, v))
            else
                file:write(string.format("    [%q] = %s,\n", k, tostring(v)))
            end
        end

        file:write("}\n")
        file:close()
        return true
    end

    return false
end

return M
