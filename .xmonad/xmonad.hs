-------------------------------------------------------------------------------
-- Xmonad config
-------------------------------------------------------------------------------

--_* Imports ==========================================================
import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers   (doCenterFloat, doFullFloat,
                                               isDialog, isFullscreen)
import           XMonad.Hooks.SetWMName
import           XMonad.Util.EZConfig         (additionalKeys, additionalKeysP)
import           XMonad.Util.Run              (spawnPipe)

import           Graphics.X11.ExtraTypes.XF86
import           System.IO

--_* Types ============================================================
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#93c91d"

--_* Code =============================================================
--_ * API -------------------------------------------------------------
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ def
    { manageHook         = ( isFullscreen --> doFullFloat ) <+> manageDocks <+> manageHook def
    , layoutHook         = avoidStruts  $  layoutHook def
    , startupHook        = setWMName "LG3D" <+> spawn "autorandr --change"
    , modMask            = mod4Mask     -- Rebind Mod to the Cmd key
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , terminal           = "kitty"
    , borderWidth        = 2
    , handleEventHook    = mconcat
      [ docksEventHook
      , handleEventHook def ]
    , logHook            = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle  = xmobarColor "green" "" . shorten 50
      }
    } `additionalKeysP`
    [ ("M-S-z",                   spawn "slock")
    , ("<XF86AudioRaiseVolume>",  spawn "pactl set-sink-volume @DEFAULT_SINK@ +1.5%")
    , ("<XF86AudioLowerVolume>",  spawn "pactl set-sink-volume @DEFAULT_SINK@  -1.5%")
    , ("<XF86AudioMute>",         spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ("<XF86MonBrightnessUp>",   spawn "lux -a 5%")
    , ("<XF86MonBrightnessDown>", spawn "lux -s 5%")
    ]

--_* Editor ===========================================================
-- Local Variables:
-- vim: sw=2 ts=2 et
-- End:
