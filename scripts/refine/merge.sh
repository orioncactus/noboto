#!/bin/zsh
set -e

script_dir="$(cd "$(dirname "$0")" && pwd)"
temp_path="$script_dir/temp"

weights=("Thin" "Light" "Regular" "Medium" "Bold" "Black")
extensions=("ttf" "otf")

missing_files=false

for weight in "${weights[@]}"; do
    for ext in "${extensions[@]}"; do
        base_font="$temp_path/Noboto-$weight.$ext"
        hangeul_font="$temp_path/NobotoHangeul-$weight.$ext"
        
        if [[ ! -f "$base_font" ]]; then
            echo "Error: Missing file $base_font"
            missing_files=true
        fi
        
        if [[ ! -f "$hangeul_font" ]]; then
            echo "Error: Missing file $hangeul_font"
            missing_files=true
        fi
    done
done

if $missing_files; then
    echo "Error: Some font files are missing. Please check the error messages above."
    exit 1
fi

for weight in "${weights[@]}"; do
    for ext in "${extensions[@]}"; do
        base_font="$temp_path/Noboto-$weight.$ext"
        hangeul_font="$temp_path/NobotoHangeul-$weight.$ext"
        
        pyftsubset "$hangeul_font" \
            --gids="2-11224" \
            --layout-features='*' --glyph-names --symbol-cmap --legacy-cmap \
            --recommended-glyphs \
            --name-IDs='*' --name-legacy --name-languages='*'
        
        subset_file="$temp_path/NobotoHangeul-$weight.subset.$ext"
        
        rm "$hangeul_font"
        mv "$subset_file" "$hangeul_font"
        
        fonttools merge "$base_font" "$hangeul_font"
        
        rm "$base_font" "$hangeul_font"
        
        if [[ "$ext" == "otf" ]]; then
            mv "merged.ttf" "$base_font"
        else
            mv "merged.ttf" "$base_font"
        fi
    done
done
