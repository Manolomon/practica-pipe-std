#!/usr/bin/python

import sys

with open(str(sys.argv[1]), 'r') as fp:
    contents = fp.read()
    for entry in contents.split('\n'):
        sys.stdout.write(str(entry))
        sys.stdout.write(" ")