#!/bin/bash

# Define the output file name
output_file="froggie_nft_metadata.txt"

# Generate the NFT metadata and write to the output file
echo "[" > "$output_file"  # Start the JSON array

for ((i=1; i<=420; i++)); do
  echo "  {" >> "$output_file"  # Start an NFT object
  echo "    \"id\": $i," >> "$output_file"

  # Generate random values for the attributes
  background=$(( ( RANDOM % 5 ) + 1 ))
  frog_color=$(( ( RANDOM % 8 ) + 1 ))
  item_1=$(( ( RANDOM % 20 ) + 1 ))
  include_item_2=$(( RANDOM % 2 ))

  # Write the attributes to the output file
  echo "    \"background\": \"color$background\"," >> "$output_file"
  echo "    \"frog_color\": \"color$frog_color\"," >> "$output_file"
  echo "    \"item_1\": \"item$item_1\"," >> "$output_file"

  # Include item_2 if applicable
  if [ $include_item_2 -eq 1 ]; then
    item_2=$(( ( RANDOM % 10 ) + 1 ))  # Assuming 10 different options for item_2
    echo "    \"item_2\": \"item$item_2\"," >> "$output_file"
  fi

  echo "  }," >> "$output_file"  # End the NFT object
done

# Remove the trailing comma from the last NFT object
sed -i '$ s/,$//' "$output_file"

echo "]" >> "$output_file"  # End the JSON array

echo "NFT metadata generated and written to $output_file."
