PROG := fortune-dharma

BASE_PATH := $(firstword $(BASE_PATH) $(subst /$C-xx,,$(CURDIR)-xx))
P := $(BASE_PATH)/$(PROG)

ifdef fortunedir
fortunedir := $(fortunedir)
else
fortunedir := /usr/share/games/fortunes
endif

fortunes := \
	dhammapada \
	truths \
	eightfold \
	8_verses_for_training_the_mind \
	misc \
	37_practises_of_bodhisattvas
fortunes := $(addprefix fortunes/,$(fortunes))
fortunes_dat := $(addsuffix .dat,$(fortunes))
fortunes := $(addsuffix .txt,$(fortunes))

all: .dat-files.ts

fortunes/dharma.txt: $(fortunes)
	cat $^ > $@

.dat-files.ts: fortunes/dharma.dat $(fortunes_dat)
	@touch $(CURDIR)/$@

fortunes/%.dat: fortunes/%.txt
	strfile -r $< $@

install: .dat-files.ts
	$(foreach f,$(fortunes) fortunes/dharma.txt, \
	install -m 0644 -D $(f) $(DESTDIR)$(fortunedir)/$(basename $(notdir $(f))); \
	install -m 0644 -D $(basename $(f)).dat $(DESTDIR)$(fortunedir)/$(basename $(notdir $(f))).dat;)
	$(foreach p,dharma-login-fortune.csh dharma-login-fortune.sh, install -D etc/$(p) $(DESTDIR)/etc/profile.d/$(p);)

clean:
	rm -rf fortunes/*.dat fortunes/dharma.txt .*.ts
