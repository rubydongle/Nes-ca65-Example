rm example.o example.nes example.map.txt example.labels.txt example.nes.ram.nl example.nes.0.nl example.nes.1.nl example.nes.dbg

echo Compiling...
ca65 example.s -g -o example.o

echo Linking...
ld65 -o example.nes -C example.cfg example.o -m example.map.txt -Ln example.labels.txt --dbgfile example.nes.dbg

echo Generating FCEUX debug symbols...
python3 example_fceux_symbols.py
