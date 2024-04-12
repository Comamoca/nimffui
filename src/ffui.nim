import lib/ffui

when isMainModule:
  var choices = ["arisu", "miria", "kaoru", "haru", "nina"]
  var selectItem = ffui(choices)

  echo selectItem
