#!/bin/bash

export PYTHONPATH=/usr/local/bin/python
MINICONDA_INSTALLER_SCRIPT=Miniconda3-py37_4.12.0-Linux-x86_64.sh
MINICONDA_PREFIX=/usr/local
wget https://repo.continuum.io/miniconda/$MINICONDA_INSTALLER_SCRIPT
chmod +x $MINICONDA_INSTALLER_SCRIPT
./$MINICONDA_INSTALLER_SCRIPT -b -f -p $MINICONDA_PREFIX
conda install --channel defaults conda python=3.7 --yes
conda update --channel defaults --all --yes

PYTHON_SCRIPT="
import sys
_ = (
  sys.path
  .append('/usr/local/lib/python3.7/site-packages')
)
"

echo "$PYTHON_SCRIPT" | python

conda install -c conda-forge tensorflow=1.15 --yes
