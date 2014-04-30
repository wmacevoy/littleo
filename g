#!/bin/bash
for f in "$@"
do
    base=${f%.asy}
    base=${base%.pdf}
    if make ${base}.pdf
    then
	evince ${base}.pdf &
    fi
done
