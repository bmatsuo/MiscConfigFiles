ALL_DEPS=bash vim

all:
	@echo
	@echo type \"make install\" to install config files for:
	@echo "    ${ALL_DEPS}"
	@echo type any "make <program>" to install individual program configs.
	@echo

install: ${ALL_DEPS}

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
