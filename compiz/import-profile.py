#!/usr/bin/env python2

# Usage example: python2 apply.py unity.profile

import sys
import os.path

try:
    import compizconfig
except ImportError:
    sys.stderr.write("Error : python-compizconfig is missing.\n")
    sys.exit(-1)

def main():
    fpath = sys.argv[-1]

    if not fpath.endswith('.profile'):
        sys.stderr.write("Expected .profile file")
    if not (fpath and os.path.exists(fpath)):
        sys.stderr.write("{} : Not exists! \n".format(fpath))
        sys.exit(1)

    sys.stderr.write("Importing {} ...\n".format(fpath))

    context = compizconfig.Context()
    ret = context.Import(fpath)
    if not ret:
        sys.stderr.write("Something is wrong. \n")
        sys.exit(1)

if __name__ == '__main__':
    main()

