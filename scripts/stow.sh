#!/bin/zsh

# dirs that should not be stowed
excluded_dirs=("nix" "scripts")

should_exclude() {
	current_dir=$1
	for ex in "${excluded_dirs[@]}"; do
		if [[ "$current_dir" == "$ex" ]]; then
			return 0
		fi
	done
	return 1
}

dry_run=1

while getopts x val
do
	case $val in
  x) dry_run=0;;
  ?) printf "Invalid value provided"
   	  exit 2;;
  esac
done

for dir in ./*; do
	# remove "./" from the beginning of the filename
	bar=${dir:2}

	# if file is not a directory, skip it
	if [ ! -d "$bar" ]; then
		continue
	fi

  # if directory should be excluded, skip it
	if should_exclude "$bar" ; then
		echo "$bar - excluded"
		continue
	fi

	if [ "$dry_run" -eq 1 ]; then
		echo "$bar - stowed"
		continue
	fi

	# create
	stow "$bar" --no-folding
done
