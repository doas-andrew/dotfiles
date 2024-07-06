local M = require("lua.config")

M.terminal = M.terminal or os.getenv("TERMINAL") or "xterm"
M.editor = M.editor or os.getenv("EDITOR") or "nano"

return M
