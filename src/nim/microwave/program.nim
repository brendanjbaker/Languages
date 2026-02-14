import std/[os, strutils, strformat]

proc isNumeric(s: string): bool =
  for c in s:
    if not c.isDigit:
      return false
  true

when isMainModule:
  let args = commandLineParams()

  if args.len != 1:
    quit(1)

  let input = args[0]

  if input.len == 0 or input.len > 4:
    quit(2)

  if not isNumeric(input):
    quit(2)

  let inputFixed = input.align(4, '0')   # pad left to 4 with '0'

  var minutes = parseInt(inputFixed[0..1])
  var seconds = parseInt(inputFixed[2..3])

  if seconds >= 60:
    if minutes < 99:
      inc minutes
      seconds = seconds mod 60

  echo &"{minutes:02}:{seconds:02}"
  quit(0)
