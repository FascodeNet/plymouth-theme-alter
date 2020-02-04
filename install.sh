#!/bin/bash

# CHECK PERMISSION AND DIRECTORY
if [ ! $UID -eq 0 ]; then
	echo "Permission denied."
	exit 1
elif [ ! -d /usr/share/plymouth/themes ]; then
	echo "Please setup plymouth."
	exit 1
fi

if [ ! $1 ]; then
	echo "Please choose theme at least one."
	echo "Example: ~# install.sh alter-logo"
	exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for ((i=1; i <= $#; i++)); do
	case ${!i} in

		# INSTALL alter-logo
		"alter-logo" ) \
		rm -rf /usr/share/plymouth/themes/alter-logo ; \
		mkdir /usr/share/plymouth/themes/alter-logo && \
		cp $SCRIPT_DIR/alter-logo/intro/* /usr/share/plymouth/themes/alter-logo/ && \
		cp $SCRIPT_DIR/alter-logo/loop/* /usr/share/plymouth/themes/alter-logo/ && \
		cp $SCRIPT_DIR/alter-logo/misc/* /usr/share/plymouth/themes/alter-logo/ && \
		echo "installing alter-logo ......" && plymouth-set-default-theme -R alter-logo >/dev/null 2>&1 && \
		echo "INSTALL alter-logo DONE !!!!" || echo "ERROR HAS OCCURRED !!" ;;

		# INSTALL alter-pp
		"alter-pp" ) \
		rm -rf /usr/share/plymouth/themes/alter-pp ; \
		mkdir /usr/share/plymouth/themes/alter-pp && \
		cp $SCRIPT_DIR/alter-pp/intro/* /usr/share/plymouth/themes/alter-pp/ && \
		cp $SCRIPT_DIR/alter-pp/loop/* /usr/share/plymouth/themes/alter-pp/ && \
		cp $SCRIPT_DIR/alter-pp/misc/* /usr/share/plymouth/themes/alter-pp/ && \
		echo "installing alter-pp ......" && plymouth-set-default-theme -R alter-pp >/dev/null 2>&1 && \
		echo "INSTALL alter-pp DONE !!!!" || echo "ERROR HAS OCCURRED !!" ;;


	esac
done

exit
