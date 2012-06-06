#!/bin/sh
# Print a fortune cookie for interactive shells:

# A Balanced Selection
FORTUNE_FILE="25% dhammapada \
	      5%  misc \
	      5%  truths \
              5% eightfold \
              30% 8_verses_for_training_the_mind \
              30% 37_practises_of_bodhisattvas"

# Random pick from a concatenation
#FORTUNE_FILE="dharma"

case $- in
*i* )  # We're interactive
  echo
  fortune ${FORTUNE_FILE}
  echo
  ;;
esac

unset FORTUNE_FILE
