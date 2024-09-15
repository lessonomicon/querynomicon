# Common Make definitions for examples

## ---: ---

## commands: show available commands (*)
commands:
	@grep -h -E '^##' ${MAKEFILE_LIST} \
	| sed -e 's/## //g' \
	| column -t -s ':'

## clean: clean up
clean:
	@find . -type f -name '*~' -exec rm {} \;
	@find . -type d -name __pycache__ | xargs rm -r
	@find . -type d -name .pytest_cache | xargs rm -r
	@find . -type d -name .ruff_cache | xargs rm -r

SQLITE := sqlite3

# Get the path to this file from wherever it is included.
# See https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
ROOT := $(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))

MODE := ${ROOT}/misc/mode.txt
MEMORY := ${SQLITE} :memory:

DB := ${ROOT}/db
ASSAYS := ${SQLITE} ${DB}/assays.db
CONTACTS := ${SQLITE} ${DB}/contact_tracing.db
LAB_LOG := ${SQLITE} ${DB}/lab_log.db
PENGUINS := ${SQLITE} ${DB}/penguins.db

ASSAYS_TMP := ${SQLITE} /tmp/assays.db
CONTACTS_TMP := ${SQLITE} /tmp/contact_tracing.db
PENGUINS_TMP := ${SQLITE} /tmp/penguins.db

%.assays.out: %.assays.sql
	cat ${MODE} $< | ${ASSAYS} > $@

%.contacts.out: %.contacts.sql
	cat ${MODE} $< | ${CONTACTS} > $@

%.lab_log.out: %.lab_log.sql
	cat ${MODE} $< | ${LAB_LOG} > $@

%.memory.out: %.memory.sql
	cat ${MODE} $< | ${MEMORY} > $@

%.penguins.out: %.penguins.sql
	cat ${MODE} $< | ${PENGUINS} > $@
