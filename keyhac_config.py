import pyauto
from keyhac import *


def configure(keymap):
    keymap_global = keymap.defineWindowKeymap()

    # Emacs Like
    keymap_global["RC-P"] = "Up"
    keymap_global["RC-N"] = "Down"
    keymap_global["RC-F"] = "Right"
    keymap_global["RC-B"] = "Left"
    keymap_global["RC-LS-P"] = "LS-Up"
    keymap_global["RC-LS-N"] = "LS-Down"
    keymap_global["RC-LS-F"] = "LS-Right"
    keymap_global["RC-LS-B"] = "LS-Left"

    keymap_global["RC-H"] = "Back"
    keymap_global["RC-D"] = "Delete"
    keymap_global["RC-A"] = "Home"
    keymap_global["RC-M"] = "Enter"

    # Vim like
    keymap_global["LW-K"] = "LW-Up"
    keymap_global["LW-B"] = "LW-Left"
    keymap_global["LW-J"] = "LW-Down"

    keymap_global["RC-K"] = "Up"
    keymap_global["RC-J"] = "Down"
    keymap_global["RC-L"] = "Right"
    keymap_global["RC-LS-K"] = "LS-Up"
    keymap_global["RC-LS-J"] = "LS-Down"
    keymap_global["RC-LS-L"] = "LS-Right"

    keymap_global["RC-I"] = "Enter"
    keymap_global["RC-O"] = "End", "Enter"
    

    # 単純なキー入れ替え
    keymap.replaceKey( "29", 235 ) # 無変換キーに仮想コード235を割り当て
    keymap.replaceKey( "28", 236 ) # 変換キーに仮想コード236を割り当て
    
    # ユーザモディファイアの設定
    keymap.defineModifier( 235, "User0" )
    keymap.defineModifier( 236, "User1" )

    def ime_on():
        keymap.getWindow().setImeStatus(1)

    def ime_off():
        keymap.getWindow().setImeStatus(0)

    keymap_global[ "U0-I" ] = "LButton"
    keymap_global[ "U1-I" ] = "LButton"
    keymap_global[ "U0-O" ] = "RButton"
    keymap_global[ "U1-O" ] = "RButton"

    keymap_global[ "U0-J" ] = keymap.MouseMoveCommand(0, 20)
    keymap_global[ "U0-K" ] = keymap.MouseMoveCommand(0, -20)
    keymap_global[ "U0-L" ] = keymap.MouseMoveCommand(20, 0)
    keymap_global[ "U0-H" ] = keymap.MouseMoveCommand(-20, 0)
    keymap_global[ "U0-B" ] = keymap.MouseMoveCommand(-20, 0)

    keymap_global[ "U1-J" ] = keymap.MouseMoveCommand(0, 10)
    keymap_global[ "U1-K" ] = keymap.MouseMoveCommand(0, -10)
    keymap_global[ "U1-L" ] = keymap.MouseMoveCommand(10, 0)
    keymap_global[ "U1-H" ] = keymap.MouseMoveCommand(-10, 0)
    keymap_global[ "U1-B" ] = keymap.MouseMoveCommand(-10, 0)

    keymap_global[ "O-235" ] = ime_off
    keymap_global[ "O-236" ] = ime_on
