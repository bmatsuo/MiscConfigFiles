ALL_DEPS=bash vim

all:
	@echo
	@echo type \"make install\" to install config files for:
	@echo "    ${ALL_DEPS}"
	@echo type any "make <program>" to install individual program configs.
	@echo

install: ${ALL_DEPS}

revert: vim_revert bash_revert

# Create a generic command to install files.
INSTALL_BIN=install
INSTALL_OPTS=-b -C
INSTALL=${INSTALL_BIN} ${INSTALL_OPTS}
# Then 
# 	${INSTALL} <file> [<file2>, <file3, ...>] <destination>

vim_check:
	[ -e vimrc ]

vim: vim_check
	${INSTALL} vimrc ~/.vimrc

vim_revert:
	if [ -e ~/.vimrc~ ]; then mv ~/.vimrc~ ~/.vimrc; fi

bash_check:
	[ -e bashrc ]
	[ -d bash/ ]
	[ -e bash/bash_alias ]
	[ -e bash/bash_env ]
	[ -e bash/bash_func ]
	[ -e bash/bash_vars ]

bash: bash_check
	${INSTALL} bashrc ~/.bashrc
	if [ ! -d ~/.bash ]; then mkdir ~/.bash; fi
	${INSTALL} bash/* ~/.bash

bash_revert:
	if [ -e ~/.bashrc~ ]; then mv ~/.bashrc~ ~/.bashrc; fi
	if [ -e ~/.bash/bash_alias~ ]; then mv ~/.bash/bash_alias~ ~/.bash/bash_alias; fi
	if [ -e ~/.bash/bash_env~ ]; then mv ~/.bash/bash_env~ ~/.bash/bash_env; fi
	if [ -e ~/.bash/bash_func~ ]; then mv ~/.bash/bash_func~ ~/.bash/bash_func; fi
	if [ -e ~/.bash/bash_vars~ ]; then mv ~/.bash/bash_vars~ ~/.bash/bash_vars; fi
	@echo 
	@echo If you were not previously using the directory ~/.bash/,
	@echo then you should remove it with
	@echo "    " rm -r ~/.bash
	@echo
