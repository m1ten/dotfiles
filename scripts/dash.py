import argparse
import platform
import venv
import subprocess
import sys

parser = argparse.ArgumentParser()
parser.add_argument('-nc', '--noconfirm',
                    help='yes to everything, don\'t confirm', action='store_true')
parser.add_argument('-v', '--verbose', help='print logs', action='store_true')
args = parser.parse_args()

op_sys = platform.system()
folder = 'Scripts' if op_sys == 'Windows' else 'bin'

# Setup venv and install dependencies

env = True if 'dashenv' in sys.prefix else False

if not env:
    venv.create('dashenv')

    venv_exe = f'dashenv/{folder}/python'

    # print([f'{venv_exe}', f'{__file__}'])

    popen = subprocess.Popen([f'{venv_exe}', f'{__file__}'])

    sys.exit(popen.wait())

subprocess.run([f'dashenv/{folder}/python', '-m', 'ensurepip'])

dependencies = {'distro'}

for dependency in dependencies:
    subprocess.run([f'dashenv/{folder}/python', '-m',
                   'pip', 'install', f'{dependency}'])
    if dependency == 'distro':
        import distro

distro_name = distro.name() if op_sys == 'Linux' else False

# Maybe Useful?

# shutil.copy('activate_this.py', f'dashenv/{folder}/')
# exec(open(f'dashenv/{folder}/activate_this.py').read(), {'__file__': f'dashenv/{folder}/activate_this.py'})

# add to path: dashenv/lib/python3.9/site-packages
