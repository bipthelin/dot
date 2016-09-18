-------------------------------------------------------------------------------
-- Xmonad config
-------------------------------------------------------------------------------

--_* Imports ==========================================================
import           XMonad
import           XMonad.Actions.Volume
import           XMonad.Config.Gnome      (gnomeConfig)
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.SetWMName
import           XMonad.Util.EZConfig     (additionalKeys)
import           XMonad.Util.Run          (spawnPipe)

import           System.IO

--_* Types ============================================================
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#93c91d"

--_* Code =============================================================
--_ * API -------------------------------------------------------------
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    { manageHook         = manageDocks <+> manageHook defaultConfig
    , layoutHook         = avoidStruts  $  layoutHook defaultConfig
    , startupHook        = setWMName "LG3D"
    , modMask            = mod4Mask     -- Rebind Mod to the Cmd key
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , borderWidth        = 2
    , handleEventHook    = mconcat
      [ docksEventHook
      , handleEventHook defaultConfig ]
    , logHook            = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle  = xmobarColor "green" "" . shorten 50
      }
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "slock")
    , ((0, 0x1008ff02), spawn "xcalib -c")
    , ((0, 0x1008ff03), spawn "xcalib -co 90 -a")
    , ((0, 0x1008ff05), spawn "kbdlight up")
    , ((0, 0x1008ff06), spawn "kbdlight down")
    , ((0, 0x1008ff12), toggleMuteChannels ["Master", "Headphone", "Speaker", "Bass Speaker"] >> return ())
    , ((0, 0x1008ff13), raiseVolume 4 >> return ())
    , ((0, 0x1008ff11), lowerVolume 4 >> return ())
    ]

--_* Editor ===========================================================
-- Local Variables:
-- vim: sw=2 ts=2 et
-- End:
