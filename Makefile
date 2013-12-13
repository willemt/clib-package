
CC     ?= cc
SRC     = $(wildcard src/*.c)
SRC    += $(wildcard deps/*.c)
TESTS   = $(wildcard test/*.c)
CFLAGS  = -std=c99 -Wall -Isrc -Ideps
LDFLAGS = -lcurl

test: $(TESTS)

$(TESTS):
	@$(CC) $(CFLAGS) $(LDFLAGS) $@ $(SRC) -o $(basename $@)
	@./$(basename $@)

clean:
	$(foreach t, $(TESTS), rm -f $(basename $(t));)

.PHONY: test $(TESTS) clean