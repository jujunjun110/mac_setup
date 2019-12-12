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
