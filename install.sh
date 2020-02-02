#!/bin/bash

# CHECK PERMISSION AND DIRECTORY
if [ ! $UID -eq 0 ]; then
	echo "Permission denied."
	exit 1
elif [ ! -d /usr/share/plymouth/themes ]; then
	echo "Please setup plymouth."
	exit 1
fi

for ((i=1; i <= $#; i++)); do
	case ${!i} in

		# INSTALL alter-logo
		"alter-logo" ) \
		rm -rf /usr/share/plymouth/themes/alter-logo ; \
		mkdir /usr/share/plymouth/themes/alter-logo && \
		cp $SCRIPT_DIR/alter-logo/intro/* /usr/share/plymouth/themes/alter-logo/ && \
		cp $SCRIPT_DIR/alter-logo/loop/* /usr/share/plymouth/themes/alter-logo/ && \
		cp $SCRIPT_DIR/alter-logo/misc/* /usr/share/plymouth/themes/alter-logo/ && \
		plymouth-set-default-theme -R alter-logo >/dev/null 2>&1 && \
		echo "INSTALL alter-logo DONE !!!!" || echo "ERROR HAS OCCURRED !!" ;;

	esac
done

exit