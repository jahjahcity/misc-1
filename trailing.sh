find -name '*.php' -print0 | xargs -r0 sed -e 's/[[:blank:]]\+$//' -i
