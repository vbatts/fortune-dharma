fortunes := \
	dhammapada \
	dharma \
	truths \
	eightfold

dat-files:
	strfile -r dhammapada && \
	strfile -r dharma
#	$(foreach $(fortune))

all: dat-files

clean:
	rm *.dat
