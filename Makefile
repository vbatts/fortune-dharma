CWD := $(shell pwd)
fortunedir := /usr/share/games/fortunes

fortunes := \
	dhammapada \
	truths \
	eightfold \
	8_verses_for_training_the_mind \
	37_practises_of_bodhisattvas

all: .dat-files

.dat-files: dharma
	for file in $(fortunes) dharma ; do strfile -r $$file ; done && \
	touch $(CWD)/$@

dharma: $(fortunes)
	cp /dev/null $@ && \
	for file in $(fortunes); do cat $$file >> dharma ; done

install: .dat-files
	$(foreach f,$(fortunes) dharma, \
	install -D $(f) $(DESTDIR)$(fortunedir)/$(f); \
	install -D $(f).dat $(DESTDIR)$(fortunedir)/$(f).dat;)
	$(foreach p,dharma-login-fortune.csh dharma-login-fortune.sh, install -D etc/$(p) $(DESTDIR)/etc/profile.d/$(p);)

clean:
	rm -rf *.dat dharma .dat-files
