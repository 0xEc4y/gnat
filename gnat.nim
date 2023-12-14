import os, strformat


# Displays the file buffer which was handled by the checkFileExists() function
proc displayContents(buffer: string) =
  # Currently only writes out file contents

  for i in 0 ..< buffer.len:
    stdout.write buffer[i]


# Opens passed file and takes in all contents as string. Will pass to helper function to handle output.
proc checkFileExists(fileName: string): seq[string] =  # Intended to return nothing, set to return sequence of strings to understand "discard" logic.
  if fileExists(fileName) == false:
    echo &"\n\nFile does not exist.. Quitting.\n\n"
    quit()

  try:
    let buffer = readFile(fileName)
    displayContents(buffer)

  except IOError:
    echo &"\n\nIOError: Failed to open file.\n\n"
    quit()
  except OSError:
    echo &"\n\nOSError: Failed to open file.\n\n"
    quit()


# Equivlant to "if __name__ == '__main__'"
when isMainModule:
  let args = commandLineParams()
  setControlCHook(proc() {.noconv.} = quit())   # Quit when CTRL+C is pressed

  if args.len == 0:
    echo &"\n\nReturning standard input. (CTRL+C to quit).\n"
    while true:
      let word = readLine(stdin)
      stdout.write word
      echo "\n"
  elif args.len == 1:
    discard checkFileExists(paramStr(1)) #  call function and discard required returned value
  elif args.len >= 2:
    echo &"\n\ninvalid number of arguments, please run and only pass one argument (the file to be read).\n\n"
    quit()
