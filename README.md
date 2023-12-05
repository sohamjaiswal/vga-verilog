# VGA-Verilog
## Pre-Setup 
This project has been tested on python 3.11.5 and icarus verilog. I recommend using pyenv to install python and icarus verilog according to system specifications. Outputs can be analyzed via provided python wave renderer or through utility like gtkwave.

## Steps
1. `pip install poetry`
2. `poetry install`
3. `poetry shell`
4. run image converter
5. `iverilog -o <file_name>.vvp <file_name_tb.v>`
6. `vvp <file_name>.vvp`
7. `gtkwave <dumpfile>.vcd`