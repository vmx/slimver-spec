BIN = ./node_modules/.bin

all: index.html css/*.css bundle.js

index.html:
	$(BIN)/blockdown src/template.html < README.md > index.html

css/*.css:
	@mkdir -p css
	$(BIN)/suitcss src/main.css css/main.css
	cp src/gh-fork-ribbon.css css/

bundle.js:
	$(BIN)/browserify -d index.js > bundle.js

clean:
	rm -rf index.html
	rm -rf css
	rm -rf bundle.js

dev: clean all
	beefy index.js:bundle.js
