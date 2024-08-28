#!/bin/bash

# Generate the index.yaml file with the correct raw GitHub URLs
helm repo index charts/ --url https://raw.githubusercontent.com/Bibi40k/mytruecharts/master/charts/

# Confirm that the command was executed successfully
if [ $? -eq 0 ]; then
    echo "index.yaml has been successfully generated."
else
    echo "Failed to generate index.yaml."
fi
