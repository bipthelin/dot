-------------------------------------------------------------------------------
-- Xmonad config
-------------------------------------------------------------------------------

--_* Imports ==========================================================
import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers (doCenterFloat, doFullFloat,
                                             isDialog, isFullscreen)
import           XMonad.Hooks.SetWMName
import           XMonad.Util.EZConfig       (additionalKeys)
import           XMonad.Util.Run            (spawnPipe)

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
    , terminal           = "alacritty"
    , borderWidth        = 2
    , handleEventHook    = mconcat
      [ docksEventHook
      , handleEventHook def ]
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
    ]

--_* Editor ===========================================================
-- Local Variables:
-- vim: sw=2 ts=2 et
-- End:
