#!/bin/bash

for setup_script in ~/.bash/bash_*; do
    . $setup_script
done

set -o vi
