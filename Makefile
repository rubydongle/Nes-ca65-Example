CC := cc65
AS := ca65
LD := ld65

all: example.nes

example.nes : example.o example.cfg
	$(info build example.nes)
	$(LD) -o example.nes -C example.cfg example.o -m example.map.txt -Ln example.labels.txt --dbgfile example.nes.dbg
	@echo build example.nes done

example.o : example.s
	$(info build example.o)
	$(AS) example.s -g -o example.o
	@echo $$?

clean:
	rm -f *.deb *.o example.nes example.map.txt example.labels.txt example.nes.ram.nl example.nes.0.nl example.nes.1.nl example.nes.dbg
