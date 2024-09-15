# Runnable tasks.

include common.mk

all: commands

HTML_IGNORES = 'Attribute "file"'

## lint: check code and project
lint:
	@ruff check --exclude docs .
	@mccole lint
	@html5validator --root docs --blacklist templates --ignore ${HTML_IGNORES} \
	&& echo "HTML checks passed."

## render: convert to HTML
render:
	mccole render ${CSS}
	@touch docs/.nojekyll

## profile: render with profiling
profile:
	mccole profile ${CSS}
	@touch docs/.nojekyll

## serve: serve generated HTML
serve:
	@python -m http.server -d docs $(PORT)

## stats: basic site statistics
stats:
	@mccole stats

## databases: make required files
databases : \
	${DB}/assays.db \
	${DB}/contact_tracing.db \
	${DB}/lab_log.db \
	${DB}/penguins.db

${DB}/assays.db: bin/create_assays_db.py
	python $< $@

${DB}/contact_tracing.db: bin/create_contacts.py
	python $< $@

${DB}/lab_log.db: bin/create_lab_log.py
	python $< $@

${DB}/penguins.db : bin/create_penguins.py misc/penguins.csv
	python $< $@ misc/penguins.csv

## psql_db: create PostgreSQL penguins database
psql_db: bin/create_penguins_psql.py
	python $< penguins misc/penguins.csv

## release: create a release
release:
	@rm -rf sql-tutorial.zip
	@zip -r sql-tutorial.zip \
	db \
	misc/penguins.csv \
	src \
	-x \*~
