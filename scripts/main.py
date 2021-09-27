#!/usr/bin/env python3

import os
import argparse
import platform
#import distro as distribution

if not os.environ['VIRTUAL_ENV']:
	pass

parser = argparse.ArgumentParser()
parser.add_argument("-nc", "--noconfirm",
                    help="yes to everything, don't confirm", action="store_true")
parser.add_argument("-v", "--verbose", help="print logs", action="store_true")
args = parser.parse_args()

os = platform.system()
#distro = distribution.name() if os == 'Linux' else False

# Dependencies