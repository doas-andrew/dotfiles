local wezterm = require 'wezterm'
local act = wezterm.action
local acb = wezterm.action_callback
local M = {}

function M.basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

function M.in_editor(pane)
    local name = pane:get_foreground_process_name()
    return (
        name:match('/nvim$') or
        name:match('/hx$')
    ) ~= nil
end

function M.if_editor(left, right)
    return acb(function(win, pane)
        if M.in_editor(pane) then
            win:perform_action(left, pane)
        else
            win:perform_action(right, pane)
        end
    end)
end

function M.ignore_editor(table)
    return {
        key = table.key,
        mods = table.mods,
        action = M.if_editor(
            act.SendKey {
                key = table.key,
                mods = table.mods,
            },
            table.action
        )
    }
end

function M.editor_only(table)
    return {
        key = table.key,
        mods = table.mods,
        action = M.if_editor(
            table.action,
            act.SendKey {
                key = table.key,
                mods = table.mods,
            }
        )
    }
end

return M