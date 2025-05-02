#!/bin/bash
#
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

WRKSPC=$SCRATCH
# everything will be installed in $WRKSPC

ENV_NAME="my-venv"
# this is the name of your python venv, change if needed

cd $WRKSPC
echo -e "${RED}Creating Python Environment in $WRKSPC:${GREEN}"
module load python 
python -m venv $WRKSPC/$ENV_NAME 
module unload python

echo -e "${RED}Installing Dependencies:${GREEN}"
#Step 1 - activate your venv
source $WRKSPC/$ENV_NAME/bin/activate


#Step 2 - install torch
pip install --upgrade pip
pip install torch
pip install torch_geometric
pip install numpy
pip install axonn
pip install ogb


echo -e "${RED}Your Python Environment is ready. To activate it run the following commands in the SAME order:${NC}"
echo -e "${GREEN}source $WRKSPC/$ENV_NAME/bin/activate${NC}"
echo ""
echo -e "${NC}"
