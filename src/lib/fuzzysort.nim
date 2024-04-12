import fuzzy
import algorithm
import sequtils

proc sortByFuzzy*(query: string, choices: openArray[string]): seq[string] =
  var scores = choices.mapIt(int(fuzzyMatchSmart(query, it) * 10))
  var searchScores = zip(choices, scores)
  
  proc fuzzyCmp(a, b: (string, int)): int =
    cmp(b[1], a[1])
  
  searchScores.sorted(fuzzyCmp).filterIt(it[1] != 0).mapIt(it[0])
