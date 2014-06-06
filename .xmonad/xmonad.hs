import XMonad
import XMonad.Actions.WindowGo
import XMonad.Layout.Magnifier
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
    spawn "feh --bg-scale ~/wallpaper/milky-way-above-the-mountains-nature-hd-wallpaper-1920x1080-6948.jpg"
    spawn "xcompmgr &"
    xmonad $ defaultConfig
        {
          modMask         = myModMask
        , layoutHook      = myLayoutHook
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
myLayoutHook  = avoidStruts $ layoutHook defaultConfig
myManageHook  = manageDocks <+> manageHook defaultConfig

-- myLogHook h   = dynamicLogWithPP xmobarPP {
--                  ppOutput = hPutStrLn h
--                }
-- for keyboard shortcut
modm          = mod4Mask
