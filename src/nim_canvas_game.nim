# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import nim_canvas_gamepkg/submodule
import nim_canvas_gamepkg/canvas_test

when isMainModule:
  echo(getWelcomeMessage())
