-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

require("vicious")
require("revelation")
require("scratch")

-- require("mpd") ; mpc = mpd.new({ hostname="localhost" })

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/uwe/.config/awesome/zenburn/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
browser = "chromium"
colorlight = "#4b7885"
colordark = "#223b56"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
-- tag_names = { "☭", "⌥", "✇", "⌤", "☼", "⌘" }
-- tag_names = { "☠", "⌥", "✇", "⌤", "⍜", "✣", "⌨", "⌘", "☕" }
tag_names = { 
              "dev",
              "www",
              "im",
              "media",
              "mail",
              "news",
              "plan",
              "term",
              "term"
            }
tag_layouts = { 
              awful.layout.suit.tile,
              awful.layout.suit.tile,
              awful.layout.suit.tile,
              awful.layout.suit.tile,
              awful.layout.suit.tile,
              awful.layout.suit.tile,
              awful.layout.suit.tile,
              awful.layout.suit.fair,
              awful.layout.suit.fair
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tag_names, s, tag_layouts)
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

applicationmenu = {
  { "Twitter", function () awful.util.spawn("hotot-gtk3") end },
  { "RSS", function () awful.util.spawn("liferea") end },
--  { "Gmail", function () awful.util.spawn(browser .. " --app=https://mail.google.com") end },
--  { "Gmail MI", function () awful.util.spawn(browser .. " --app=http://mail.major-impact.com") end },
  { "Mail", function () awful.util.spawn("thunderbird") end },
  { "Google Calendar", function () awful.util.spawn(browser .. " --app=https://calendar.google.com") end },
  { "RDP", function () awful.util.spawn("remmina") end },
  { "Campfire", function () awful.util.spawn("snakefire") end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "applications", applicationmenu },
                                    { "terminal", terminal },
                                  },
                          width = 150
                        })

launcher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
--
-- {{{ Widgets configuration
--

-- Create a systray
systray = widget({ type = "systray" })

-- {{{ Reusable separator
separator = widget({ type = "imagebox" })
separator.image = image(beautiful.widget_sep)
-- }}}

-- {{{ Battery state
baticon = widget({ type = "imagebox" })
baticon.image = image(beautiful.widget_bat)
-- Initialize widget
batwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(batwidget, vicious.widgets.bat, "$1$2%", 61, "BAT0")
-- }}}

-- {{{ Another battery widget
mybattmon = widget({ type = "textbox", name = "mybattmon" })
function battery_status ()
  local output={} --output buffer
  local fd=io.popen("acpitool -b", "r") --list present batteries
  local line=fd:read()
  while line do --there might be several batteries.
    local battery_num = string.match(line, "Battery \#(%d+)")
    local battery_load = string.match(line, " (%d*\.%d+)%%")
    local time_rem = string.match(line, "(%d+\:%d+)\:%d+")
    local discharging
    if string.match(line, "Discharging")=="Discharging" then --discharging: always red
      discharging="<span color=\"#CC7777\">"
    elseif tonumber(battery_load)>85 then --almost charged
      discharging="<span color=\"#77CC77\">"
    else --charging
      discharging="<span color=\"#CCCC77\">"
    end
    if battery_num and battery_load and time_rem then
      table.insert(output,discharging..battery_load.."%, "..time_rem.."</span>")
    elseif battery_num and battery_load then --remaining time unavailable
      table.insert(output,discharging..battery_load.."%</span>")
    end --even more data unavailable: we might be getting an unexpected output format, so let's just skip this line.
    line=fd:read() --read next line
  end
  return table.concat(output," • ") --FIXME: better separation for several batteries. maybe a pipe?
end
mybattmon.text = " " .. battery_status() .. " "
my_battmon_timer=timer({timeout=30})
my_battmon_timer:add_signal("timeout", function()
  --mytextbox.text = " " .. os.date() .. " "
  mybattmon.text = " " .. battery_status() .. " "
end)
my_battmon_timer:start()
-- }}}

-- {{{ CPU temperature
tempicon = widget({ type = "imagebox" })
tempicon.image = image(beautiful.widget_cpu)
-- Initialize widget
tempwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(tempwidget, vicious.widgets.thermal, " - $1°C", 5, { "coretemp.0", "core" })
-- }}}

-- {{{ CPU usage
-- Initialize widget
cpuwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, "$1%", 5)
-- }}}

-- {{{ Date and time
dateicon = widget({ type = "imagebox" })
dateicon.image = image(beautiful.widget_date)
-- Initialize widget
datewidget = widget({ type = "textbox" })
-- Register widget
vicious.register(datewidget, vicious.widgets.date, "%d.%m.%Y %H:%M:%S", 1)
-- }}}

-- {{{ MPD
--require("mpc")
--local mpc = mpc()
--local mpcwidget = widget({ type = "textbox" })
--local mpcicon = widget({ type = "imagebox" })
--mpcicon.image = image(beautiful.widget_music)
--
--mpc.attach(mpcwidget)
--
-- Register Buttons in both widget
--mpcicon:buttons( mpcwidget:buttons(awful.util.table.join(
--awful.button({ }, 1, function () mpc:toggle_play() mpc:update()      end), -- left click
--awful.button({ }, 2, function () awful.util.spawn("sonata")         end), -- middle click
--awful.button({ }, 3, function () awful.util.spawn("urxvtc -e ncmpcpp")end), -- right click
--awful.button({ }, 4, function () mpc:volume_up(5) mpc:update()            end), -- scroll up
--awful.button({ }, 5, function () mpc:volume_down(5) mpc:update()           end)  -- scroll down
--)))
-- }}}

-- Create a wibox for each screen and add it
wibox = {}
promptbox = {}
layoutbox = {}
taglist = {}
taglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
tasklist = {}
tasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    promptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    layoutbox[s] = awful.widget.layoutbox(s)
    layoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    taglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, taglist.buttons)

    -- Create a tasklist widget
    tasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, tasklist.buttons)

    -- Create the wibox
    wibox[s] = awful.wibox({ position = "top", screen = s,
      fg = beautiful.fg_normal, height = 17,
      bg = beautiful.bg_normal, border_color = beautiful.border_focus,
      border_width = beautiful.border_width
    })
    -- Add widgets to the wibox - order matters
    wibox[s].widgets = {
        {
            launcher,
            taglist[s],
            layoutbox[s],
            separator,
            promptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        s== 1 and systray or nil,
        separator, datewidget, dateicon,
        separator, tempwidget, cpuwidget, tempicon,
--        separator, batwidget, baticon,
        separator, mybattmon, baticon,
--        separator, mpcwidget, mpcicon,
        separator, layoutbox[s],
        separator, tasklist[s],
        separator, layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "e", revelation.revelation),
    awful.key({                   }, "#128", revelation.revelation),
    awful.key({ modkey,           }, "t", function () scratch.drop(terminal, "top", "center", 1, 0.7, true) end),
    
    awful.key({ modkey,           }, "c", function () awful.util.spawn(browser) end),
    awful.key({ modkey,           }, "v", function () awful.util.spawn("gvim") end),
    awful.key({ modkey,           }, "b", function () awful.util.spawn("thunar") end),
    awful.key({ modkey,           }, "y", function () awful.util.spawn("emacs") end),

    --awful.key({                   }, "#122", function () awful.util.spawn("amixer -D hw:0 set Master 5%-") end),
    --awful.key({                   }, "#123", function () awful.util.spawn("amixer -D hw:0 set Master 5%+") end),
    --awful.key({                   }, "#121", function () awful.util.spawn("amixer set Master toggle") end),
    --awful.key({                   }, "XF86MonBrightnessDown", function () awful.util.spawn("brightness_minus") end),
    --awful.key({                   }, "XF86MonBrightnessUp", function () awful.util.spawn("brightness_plus") end),
    --awful.key({                   }, "#171", function () mpc:previous() mpc:update() end),
    --awful.key({                   }, "#172", function () mpc:toggle_play() mpc:update() end),
    --awful.key({                   }, "#173", function () mpc:next() mpc:update() end),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ modkey, "Control" }, "l", function () awful.util.spawn("i3lock -d") end),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt menus
    awful.key({ modkey, "Shift"   }, "e", function ()
        awful.prompt.run({ prompt = "Run: " }, promptbox[mouse.screen].widget,
            function (...) promptbox[mouse.screen].text = exec(unpack(arg), false) end,
            awful.completion.shell, awful.util.getdir("cache") .. "/history")
    end),

    awful.key({ modkey },            "r",     function () promptbox[mouse.screen]:run() end),
    --awful.key({ modkey },            "r",     function ()
    --  awful.util.spawn("dmenu_run -i -p 'Run:' -fn 'Inconsolata-10' -nb '" .. 
    --    beautiful.bg_normal .. "' -nf '" .. beautiful.fg_normal .. 
    --      "' -sb '" .. beautiful.bg_focus .. 
    --      "' -sf '" .. beautiful.fg_focus .. "'") 
    --  end),


    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  promptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "Pidgin" },
      properties = { tag = tags[screen.count()][3] } },
    { rule = { class = "Thunderbird" },
      properties = { tag = tags[screen.count()][5] } },
    { rule = { class = "Hotot-gtk3" },
      properties = { tag = tags[screen.count()][6] } },
    { rule = { class = "Liferea" },
      properties = { tag = tags[screen.count()][6] } },
    { rule = { class = "Skype" },
      properties = { tag = tags[screen.count()][3] } },
    { rule = { class = "Gimp" },
      properties = { floating = true } },
      -- Make Gloobus behave as expected
    { rule = { class = "Gloobus-preview-configuration" },
      properties = { floating = true } },
    { rule = { class = "Gloobus-preview" },
      properties = { floating = true, border_width = 0 } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}


-- disable startup-notification globally
local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end
