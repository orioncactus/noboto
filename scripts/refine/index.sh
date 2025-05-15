#!/bin/zsh
set -e

script_dir="$(cd "$(dirname "$0")" && pwd)"
temp_path="$script_dir/temp"
package_path="$script_dir/../../packages"
noboto_path="$package_path/noboto/fonts"

echo "Merging Fonts..."
zsh "$script_dir/merge.sh"

echo "Converting fonts to ttx..."
for fonts_file in "$temp_path"/*.(ttf|otf); do
    ttx "$fonts_file"
    rm "$fonts_file"
done

echo "Adding Macintosh Name Table..."
python3 "$script_dir/namerecord.py"

echo "Fixing Font Creation Date..."
python3 "$script_dir/date.py"

echo "Fixing Unintended strings..."
python3 "$script_dir/validate.py"

echo "Converting fonts..."
for fonts_file in "$temp_path"/*.ttx; do
    ttx "$fonts_file"
    rm "$fonts_file"
done

echo "Moving files to appropriate directories..."
for fonts_file in "$temp_path"/*; do
    if [[ $fonts_file == *.otf ]]; then
        target_path="$noboto_path/otf"
    elif [[ $fonts_file == *.ttf ]]; then
        target_path="$noboto_path/ttf"
    fi

    mv "$fonts_file" "$target_path"
done

echo "Done!"
