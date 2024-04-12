import genny
import libffui

exportProcs:
  ffui

writeFiles("bindings/generated", "ffui")
include generated/internal
