#!/bin/sh
# Print a fortune cookie for interactive shells:

case $- in
*i* )  # We're interactive
  echo
  fortune dharma
  echo
  ;;
esac

