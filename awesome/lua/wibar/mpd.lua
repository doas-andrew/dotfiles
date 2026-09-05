if my.using_mpd then
    return function(s)
        local mpd_icon = wibox.widget.imagebox()
        s.my_mpd = lain.widget.mpd {
            settings = function()
                local left = ""
                local right = ""

                if mpd_now.state == "play" then
                    left = mpd_now.title
                    right = "  "..mpd_now.artist
                    mpd_icon:set_image(theme.play)
                elseif mpd_now.state == "pause" then
                    left = "Paused"
                    mpd_icon:set_image(theme.pause)
                else
                    --  fn.dump(mpd_now.state)
                    left = "mpd"
                    right = ({
                        stop = " idle",
                        ["N/A"] = " offline",
                    })[mpd_now.state]

                    mpd_icon:set_image(nil)
                    --  mpd_icon._private.image = nil
                    --  mpd_icon:emit_signal("widget::redraw_needed")
                    --  mpd_icon:emit_signal("widget::layout_changed")
                end

                widget:set_markup(markup(theme.fg_focus, left)..right)
            end
        }
        return wibox.widget {
            layout = wibox.layout.fixed.horizontal,
            mpd_icon, s.my_mpd,
        }
    end
else
    return function()
        return nil
    end
end
