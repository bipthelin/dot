-------------------------------------------------------------------------------
-- Xmonad config
-------------------------------------------------------------------------------

--_* Imports ==========================================================
import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Util.EZConfig     (additionalKeys)
import           XMonad.Util.Run          (spawnPipe)

import           System.IO

--_* Code =============================================================
--_ * API -------------------------------------------------------------
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , handleEventHook = mconcat
    [ docksEventHook
    , handleEventHook defaultConfig ]
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "green" "" . shorten 50
      }
    , modMask = mod4Mask     -- Rebind Mod to the Cmd key
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "slock")
    ]

--_* Editor ===========================================================
-- Local Variables:
-- vim: sw=2 ts=2 et
-- End:
