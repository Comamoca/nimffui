version       = "0.1.0"
author        = "Comamoca"
description   = "Simple fuzzyfinder UI library."
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
installExt    = @["nim"]
bin           = @["ffui"]

requires "nim >= 2.0.2"

requires "illwill"
requires "fuzzy"
