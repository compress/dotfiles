import XMonad
import XMonad.Actions.WindowGo
-- import XMonad.Layout
-- import XMonad.Layout.DragPane          -- see only two window
-- import XMonad.Layout.Gaps
-- import XMonad.Layout.IM
-- import XMonad.Layout.Magnifier         -- this makes window bigger
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
-- import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Spacing           -- this makes smart space around windowsimport XMonad.Layout.NoBorders
-- import XMonad.Layout.Tabbed
-- import XMonad.Layout.ThreeColumns
-- import XMonad.Layout.ToggleLayouts
-- import XMonad.Layout.MultiToggle
-- import XMonad.Layout.MultiToggle.Instances
-- import XMonad.Layout.Named
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Actions.GridSelect
import XMonad.Util.Run                  -- spawnPipe, hPutStrLn
import XMonad.Actions.WindowGo
import XMonad.Util.EZConfig

main = do
    xmproc <- spawnPipe "xmobar"
    spawn "xmodmap $HOME/.Xmodmap"
    spawn "feh --bg-scale ~/wallpaper/applestore.jpg"
    spawn "xcompmgr &"
    xmonad $ defaultConfig
        {
          modMask         = myModMask
        , layoutHook      = {-toggleLayouts (noBorders Full) $ -} avoidStruts $ myLayoutHook
        , manageHook      = myManageHook
--      , logHook         = myLogHook myStatusBar
        , logHook         = dynamicLogWithPP $ xmobarPP
                                { ppOutput = hPutStrLn xmproc
                                , ppTitle = xmobarColor "green" "" . shorten 50
                                }
        , borderWidth     = myBorderWidth
        , terminal        = myTerminal
--      , logHook         = fadeInactiveLogHook 0xdddddddd
        }
        `additionalKeys`
        [ ((modm, xK_e), runOrRaise "emacs" (className =? "Emacs"))
        , ((modm, xK_v), runOrRaise "gvim" (className =? "Gvim"))
        , ((modm, xK_r), runOrRaise "firefox" (className =? "Firefox"))
--      , ((modm, xK_f), sendMessage (Toggle FULL)) --full screen
        ]

myTerminal    = "xfce4-terminal"
-- xmodmapで設定しているからmod4Maskでよい
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 3
-- myLayoutHook  = (spacing 18 $ ResizableTall 1 (3/100) (3/5) [])
--                 |||  (spacing 2 $ (dragPane Horizontal (1/10) (1/2)))
--                 |||  (dragPane Vertical   (1/10) (1/2))
myLayoutHook  = layoutHook defaultConfig
myManageHook  = manageDocks <+> manageHook defaultConfig

-- myLogHook h   = dynamicLogWithPP xmobarPP {
--                  ppOutput = hPutStrLn h
--                }
-- for keyboard shortcut
modm          = mod4Mask
