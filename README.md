
# gnat

gnat (pronounced "NAT") is a cat remake written in Nim.

This was created to learn more about file I/O, [Nim](https://nim-lang.org), and string processing.

If you have any suggestions on improvement, PRs and PM/Email are strongly welcome!   : )


## Current Features

- Read contents of file and display in standard output.
- Return stdin if no input file was passed
- Handling **CTRL+C**
- Handling any **IO-Error** or **OS-Error**
- Parse command line paramaters.
## Planned

- Allow for concatenation of files.
- Add help menu.
- Add **Options** (Numbered output, Limit output amount, Suppress empty output lines).
- Optimize.


## Installation & Usage

Ensure you have [git](https://github.com/git-guides/install-git) and [nim](https://nim-lang.org/install.html) installed.

[Clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) to your local machine.


(c)ompile and (-r)un the source file:
```nim
    nim c -r gnat.nim
```
Run the executable with the file you want to read:
```bash
  ./gnat example.txt
  ./gnat ~/path/to/MY_FAVORITE_FILE.txt
```
## License - [GPL v3](https://www.gnu.org/licenses/quick-guide-gplv3.html)
