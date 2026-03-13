RISCV_PREFIX = riscv64-unknown-elf

CC      = $(RISCV_PREFIX)-gcc
OBJCOPY = $(RISCV_PREFIX)-objcopy

ASM_DIR = sw/asm
ELF_DIR = sw/elf
BIN_DIR = sw/bin
DAT_DIR = rtl/single_cycle/memory

PROGRAM = test

ELF = $(ELF_DIR)/$(PROGRAM).elf
BIN = $(BIN_DIR)/$(PROGRAM).bin
DAT = $(DAT_DIR)/$(PROGRAM).dat

CFLAGS = -march=rv32i -mabi=ilp32 -nostdlib -nostartfiles -Wl,-Ttext=0x0

all: $(DAT)

############################################################
# Build ELF from assembly
############################################################

$(ELF): $(ASM_DIR)/$(PROGRAM).s
	mkdir -p $(ELF_DIR)
	$(CC) $(CFLAGS) $< -o $@

############################################################
# Convert ELF → raw binary
############################################################

$(BIN): $(ELF)
	mkdir -p $(BIN_DIR)
	$(OBJCOPY) -O binary $< $@

############################################################
# Convert binary → DAT (one 32-bit instruction per line)
############################################################

$(DAT): $(BIN)
	mkdir -p $(DAT_DIR)
	od -An -tx4 -w4 -v $< | sed 's/^ *//' > $@

############################################################
# Cleanup
############################################################

clean:
	rm -rf $(ELF_DIR)
	rm -rf $(BIN_DIR)
	rm -f rtl/single_cycle/memory/*.dat