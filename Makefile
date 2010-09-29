CWD := $(shell pwd)
fortunes := \
	dhammapada \
	truths \
	eightfold

.dat-files: dharma $(fortunes)
	for file in $(fortunes) dharma ; do strfile -r $$file ; done && \
	touch $(CWD)/$@

dharma: $(fortunes)
	cp /dev/null $@ && \
	for file in $(fortunes); do cat $$file >> dharma ; done

install: .dat-files dharma $(fortunes)
	$(foreach f,$(fortunes) dharma, \
	install -D $(f) $(DESTDIR)//usr/share/games/fortunes/$(f); \
	install -D $(f).dat $(DESTDIR)//usr/share/games/fortunes/$(f).dat; \
	)

all: .dat-files

clean:
	rm -rf *.dat dharma
