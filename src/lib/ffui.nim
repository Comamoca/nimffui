import os
import strutils
import sequtils
import fuzzysort
import illwill

proc exitProc() {.noconv.} =
  illwillDeinit()
  showCursor()

illwillInit(fullscreen=true)
setControlCHook(exitProc)
hideCursor()

proc ffui*(choices: openArray[string]): string =
  var choices = choices.mapIt(it)
  var sortedChoices = choices.toSeq.mapIt(it)

  var tb = newTerminalBuffer(terminalWidth(), terminalHeight())
  var maxBottom = tb.height - 1
  var cursorPos = maxBottom - 2
  var search_query: string
  var input: string
  var select: int

  while true:
    var tb = newTerminalBuffer(terminalWidth(), terminalHeight())
    select = maxBottom - cursorPos - 2

    var key = getKey()
    case key

    of Key.CtrlP:
      cursorPos = cursorPos - 1

    of Key.CtrlN:
      cursorPos = cursorPos + 1

    of Key.Escape, Key.Q, Key.CtrlC: exitProc()

    of Key.Backspace:
      if search_query.len == 0:
        continue

      var last = search_query.len - 1
      search_query.delete(last..last)

    of Key.CtrlU: search_query.delete(0..search_query.len - 1)

    of Key.Enter:
      # show select choice, then exit.
      illwillDeinit()
      showCursor()
      return sortedChoices[select]

    of Key.None: discard
    else:
      # Input serarch query
      if contains($key, "Shift"):
        input = replace($key, "Shift", "")

      if not contains($key, "Ctrl"):
        input = toLower($key)

      search_query = search_query & input

    if cursorPos >= maxBottom - 2 :
      cursorPos = maxBottom - 2

    if cursorPos <= maxBottom - (sortedChoices.len) - 1:
      cursorPos = maxBottom - (sortedChoices.len)  - 1

    # DEBUG
    # tb.write(1, 2, $cursorPos)
    # tb.write(1, 3, $(maxBottom - cursorPos - 1))
    # tb.write(1, 6, $tb.width)
    # tb.write(1, 4, sortedChoices[select])

    if select >= sortedChoices.len - 1:
      select = sortedChoices.len - 1

    # show cursor.
    tb.write(1, (cursorPos), fgRed, "> ", fgNone)

    sortedChoices = sortByFuzzy(search_query, choices)

    for idx, c in sortedChoices:
      # hightlight select value.
      if idx == select:
        tb.write(3, (maxBottom - 2) - idx, bgBlack, c, bgNone)
      else:
        tb.write(3, (maxBottom - 2) - idx, c)

    tb.write(3, (maxBottom), search_query)

    tb.write(1, maxBottom, fgBlue, "> ", fgNone)

    # number of match choices.
    tb.write(3, maxBottom - 1, $sortedChoices.len)
    # slash
    tb.write(4, maxBottom - 1, "/")
    # number of total choices.
    tb.write(5, maxBottom - 1, $choices.len)

    # draw border
    tb.drawHorizLine(7, tb.width, maxBottom - 1, false)

    tb.resetAttributes()
    tb.display()

    sleep(20)
