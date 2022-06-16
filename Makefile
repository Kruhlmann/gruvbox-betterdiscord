SRC=src
BUILD=build
SCSS_SRC=$(wildcard $(SRC)/*.scss)
CSS_SRC=$(patsubst $(SRC)/%.scss,$(BUILD)/%.css,$(SCSS_SRC))
OUT=gruvbox.theme.css
INSTALL_OUT=$(HOME)/.config/BetterDiscord/themes/$(OUT)

all: $(OUT)

install: $(HOME)/.config/BetterDiscord/themes/$(OUT)

upgrade:
	rm -f $(INSTALL_OUT)
	sleep 1
	$(MAKE) $(INSTALL_OUT)

$(OUT): $(CSS_SRC)
	cat $^ >$@

build/%.css: src/%.scss $(BUILD)
	mkdir -p build
	sass $< $@

$(BUILD):
	mkdir -p $@

$(INSTALL_OUT): $(OUT)
	install -D -m 444 $< $@
