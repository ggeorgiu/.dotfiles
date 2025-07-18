#!/bin/zsh

# check if it should be a dry run or not
dry_run=1
while getopts x val
do
	case $val in
  x) dry_run=0;;
  ?) printf "Invalid value provided"
   	  exit 2;;
  esac
done

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

for val in ./*; do
	# remove "./" from the beginning of the filename
	dir=${val:2}

	# if file is not a directory, skip it
	if [ ! -d "$dir" ]; then
		continue
	fi

  # if directory should be excluded, skip it
	if should_exclude "$dir" ; then
		printf "%-12s | %-8s |\n" "$val" "excluded"
		continue
	fi

	if [ "$dry_run" -eq 1 ]; then
		printf "%-12s | %-8s |\n" "$val"  "stowed"
		continue
	fi

	# create
	stow "$dir" --no-folding
done
