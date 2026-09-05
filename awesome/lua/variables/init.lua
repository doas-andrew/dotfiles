local M = require("lua.variables.configuration")
M.state = require("lua.variables.persistence")

M.terminal = M.terminal or os.getenv("TERMINAL") or "xterm"
M.editor = M.editor or os.getenv("EDITOR") or "nano"

fn.default(M.state, "screen_temperature", M.max_screen_temp)
fn.default(M.state, "layout", M.layouts[1])

return M
