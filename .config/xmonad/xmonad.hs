-- \   \/  / _____   ____   ____ _____     __| _/   |  |__   ______
--  \     / /     \ /  _ \ /    \\__  \   / __ |    |  |  \ /  ___/
--  /     \|  Y Y  (  <_> )   |  \/ __ \_/ /_/ |    |   Y  \\___ \
-- /___/\  \__|_|  /\____/|___|  (____  /\____ | /\ |___|  /____  >
--       \_/     \/            \/     \/      \/ \/      \/     \/
-- Author  : Saif Shahriar
-- Web     : https://saifshahriar.github.io/
-- GitHub  : https://github.com/saifshahriar
-- Licence : MIT

---------------------------------
        {- Imports -}
---------------------------------
import Data.Monoid
-- import Hooks.ManageDocks
import System.Exit
import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import qualified Data.Map        as M
import qualified XMonad.StackSet as W

import Colors

---------------------------------
--        Variables            --
---------------------------------
myTerminal          = "st"      -- Use this as THE terminal for xmonad.
myFocusFollowsMouse :: Bool     -- Moving mouse on a unfocused window focuses it
myFocusFollowsMouse = True      -- without having to click.
myBorderWidth       = 2         -- Width of border in Pixel.
myModMask           = mod4Mask  -- Use <super> as the modifier key.
myMetaMask          = mod1Mask  -- mod4 -> <super> | mod1 -> <alt>
myWorkspaces = [ "dev", "www", "sys", "doc", "vbox", "chat", "mus", "vid", "gfx"]
                                -- Number of workspaces (virtual screens) and
                                -- their names. Any string may be used as a
myNormalBorderColor  = background
myFocusedBorderColor = foreground

---------------------------------
--        Keybindings          --
---------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    {- modifier             key         function -}
    -- Basic Programmes
    [ ((modm,               xK_Return      ), spawn $ XMonad.terminal conf)
    , ((modm,               xK_d           ), spawn "dmenu_run")
    -- Windows
    , ((modm,               xK_j           ), windows W.focusDown)
    , ((modm,               xK_k           ), windows W.focusUp)
    , ((myMetaMask,         xK_Tab         ), windows W.focusDown)
    , ((modm .|. shiftMask, xK_j           ), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k           ), windows W.swapUp)
    , ((modm .|. shiftMask, xK_Return      ), windows W.swapMaster) -- Swap any client with master
    , ((modm,               xK_h           ), sendMessage Shrink) -- Shrink/increase
    , ((modm,               xK_l           ), sendMessage Expand) -- master area
    , ((modm,               xK_bracketright), sendMessage (IncMasterN ( 1))) -- Increment/decrement the number of
    , ((modm,               xK_bracketleft ), sendMessage (IncMasterN (-1))) -- windows in the master area
    , ((modm,               xK_c           ), kill) -- Kill focused client
    -- Layouts
    , ((modm,               xK_Tab         ), sendMessage NextLayout) -- Toggle through layouts
    , ((modm,               xK_t           ), withFocused $ windows . W.sink) -- Push any window back to tiled mode
    , ((modm .|. shiftMask, xK_Tab         ), setLayout $ XMonad.layoutHook conf) -- Reset the layouts on the current
    -- WM Controls
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)  -- Toggle bar
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess)) -- Quit xmonad
    , ((modm .|. shiftMask, xK_r     ), spawn "xmonad --recompile; xmonad --restart") -- Restart xmonad
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -")) -- Run xmessage with a
                                                                               -- summary of the default keybindings (useful for beginners)
    ]
    ++
    -- Workspaces
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- If you have multimonitors
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [
        -- ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        -- | (key, sc) <- zip [xK_w, xK_e, xK_F12] [0..]
        -- , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
        ]

---------------------------------
--       Mouse Bindings        --
---------------------------------
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3/4/5/6/7, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button4), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button5), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

---------------------------------
--          Layout(s)          --
---------------------------------
myLayout = lessBorders OnlyScreenFloat $ tiled ||| Mirror tiled ||| Full
  where
     tiled   = Tall nmaster delta ratio
                                -- Default tiling algorithm partitions the screen into two panes
     nmaster = 1                -- Number of master window
     ratio   = 1/2              -- Master and slave pane ratio
     delta   = 3/100            -- Percent of screen to increment by when resizing panes
-- manageHook = composeAll
-- [ isFullscreen --> (doF W.focusDown <+> doFullFloat) ]

---------------------------------
--      Window Rules           --
---------------------------------
myManageHook = composeAll
    -- xprop(1):
    --     WM_CLASS(STRING) = instance, class
    --     WM_NAME(STRING) = title
    --
    -- `doFloat`: makes a window floating, appears at (x, y) = (0, 0)
    -- `doCenterFloat`: makes a window floating, appears at the center of the screen
    -- `doShift (myWorkspaces !! n)`: opens the programme at (n + 1)th workspace
    [ className =? "Bar"            --> doIgnore -- XMonad, please dont manager any bars
    , title =? "bar"                --> doIgnore
    , title =? "float"              --> doIgnore
    , className =? "Alafloat"       --> doCenterFloat
    , className =? "confirm"        --> doCenterFloat
    , className =? "dialog"         --> doCenterFloat
    , className =? "download"       --> doCenterFloat
    , className =? "error"          --> doCenterFloat
    , className =? "file_progress"  --> doCenterFloat
    , className =? "float-term"     --> doCenterFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    -- Browsers
    , className =? "Brave-browser"  --> doShift ( myWorkspaces !! 1 )
    , className =? "Netsurf-gtk3"   --> doShift ( myWorkspaces !! 1 )
    , className =? "Surf"           --> doShift ( myWorkspaces !! 1 )
    , className =? "firefox"        --> doShift ( myWorkspaces !! 1 )
    , className =? "Firefox"        --> doShift ( myWorkspaces !! 1 )
    , className =? "firefox"        --> doShift ( myWorkspaces !! 1 )
    -- Floating Apps
    , className =? "Lxappearance"   --> doCenterFloat
    , className =? "Nitrogen"       --> doCenterFloat
    , className =? "Pavucontrol"    --> doCenterFloat
    , (className =? "firefox" <&&> resource =? "Dialog") --> doCenterFloat  -- Float Firefox Dialog
    -- className =? "Sxiv", .instance = "float", .isfloating = 1)
    -- className =? "float-term",   .isfloating = 1)
    -- Spawn in Respective Workspaces
    , className =? "Gimp"           --> doShift ( myWorkspaces !! 8 )
    , className =? "TelegramDesktop"--> doShift ( myWorkspaces !! 5 )
    -- VMs
    , className =? "Virt-manager"       --> doShift ( myWorkspaces !! 4 )
    , className =? "VirtualBox Manager" --> doShift ( myWorkspaces !! 4 )
    ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = updatePointer (0.5, 0.5) (0, 0)

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    spawnOnce "setbg -R"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
    xmproc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobar.hs"
    xmonad defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
-- TODO: Fix this part
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]



-- vim: colorcolumn=33,80,120 ts=4 sw=4 et
