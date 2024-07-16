#!/bin/bash

# Check if the file exists
if [ ! -f "SRR_Acc_List.txt" ]; then
    echo "Error: SRR_Acc_List.txt not found!"
    exit 1
fi

# Read accession numbers from the file into an array
mapfile -t accession_values < "SRR_Acc_List.txt"

# Loop over each accession value and run fasterq-dump
for accession in "${accession_values[@]}"; do
    echo  
    echo "Processing accession: $accession"    
    time fasterq-dump --verbose -p --split-3 -e 10 -t /dev/shm "$accession" 
    echo "Estimated time to run accession $accession:"
    echo "###################################################"
    echo 
done

