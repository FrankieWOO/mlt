DEFAULT=$(subst .mk,,$(wildcard *.mk)) 
CLEAN  =$(DEFAULT:%=clean-%)

default: $(DEFAULT)
clean:   $(CLEAN)

include *.mk

