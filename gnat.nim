import os, strformat


# Displays the file buffer which was handled by the openFilePrintContents() function
proc displayContents(buffer: string) =
  # Currently writes out file contents

  for i in 0 ..< buffer.len:
    stdout.write buffer[i]


# Opens passed file and takes in all contents as string. Will pass to helper function to handle printing.
proc openFilePrintContents(fileName: string): seq[string] =
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
  setControlCHook(proc() {.noconv.} = quit())


  if args.len == 0:
    echo &"\n\ndid not recieve a file for input.\n\n"
    quit()
  elif args.len == 1:
    discard openFilePrintContents(paramStr(1)) #  call function and discard required returned value
  elif args.len >= 2:
    echo &"\n\ninvalid number of arguments, please run and only pass one argument (the file to be read).\n\n"
    quit()
