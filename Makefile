ZASM = ./tools64/zasm
BIN2TAPE = ./tools64/bin2tape

ROM = bin/hilo.rom
RKM = bin/hilo.rkm

SRC = hilo.asm

all: $(ROM) $(RKM) 

$(RKM) : $(ROM)
	$(BIN2TAPE) -t rkm $< $@

$(ROM) : $(SRC)
	$(ZASM) -u --asm8080  $< $@

clean:
	rm -f $(ROM) $(RKM)
