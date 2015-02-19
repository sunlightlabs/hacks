# Compiling Coffee through GNU Make


```make
COFFEE_SCRIPTS = script1.min.js script2.min.js

.SUFFIXES:
.SUFFIXES: .coffee .js .min.js

all: build

build: $(COFFEE_SCRIPTS)

clean:
    rm -fv $(COFFEE_SCRIPTS)

.coffee.js:
    coffee -c $<

.js.min.js:
    uglifyjs --no-copyright --output $@ $<

.PHONY: build clean
```

Add any output files into `COFFEE_SCRIPTS`, type `make`, and Make will build
any files that need to be built (it's smart about using timestamps to figure
out what to build)
