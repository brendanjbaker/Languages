#!/usr/bin/env bash

# The Nospace language adds some extensions to the Whitespace language, however, all valid
# Whitespace programs are also valid Nospace programs (once you simply convert spaces/tabs/newlines
# to their corresponding zero-width characters).
#
# Equivalent characters:
#
# Space --> Zero-width space (ZWSP)
# Tab --> Zero-width non-joiner (ZWNJ)
# Newline --> Zero-width joiner (ZWJ)

export LC_ALL=en_US.UTF-8

declare space=' '
declare tab=$'\t'
declare newline=$'\\n'

declare zwsp=$'\u200B'
declare zwnj=$'\u200C'
declare zwj=$'\u200D'

sed \
	-z \
	-e "s/${space}/${zwsp}/g" \
	-e "s/${tab}/${zwnj}/g" \
	-e "s/${newline}/${zwj}/g"
