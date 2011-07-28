#!/bin/csh
# Print a fortune cookie for login shells:

# A Balanced Selection
setenv FORTUNE_FILE "50% dhammapada \
	                   5%  truths \
                     5% eightfold \
                     20% 8_verses_for_training_the_mind \
                     20% 37_practises_of_bodhisattvas"

# Random pick from a concatenation
#setenv FORTUNE_FILE "dharma"

if ( { tty --silent } ) then >& /dev/null
  echo "" ; fortune $FORTUNE_FILE ; echo ""
endif

unsetenv FORTUNE_FILE

