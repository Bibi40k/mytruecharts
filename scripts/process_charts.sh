#!/bin/bash

# Directories where the charts are located
STABLE_DIR="charts/stable"

# Iterate over each subdirectory (each app)
for chart_dir in "$STABLE_DIR"/*; do
    if [ -d "$chart_dir" ]; then
        # Extract the chart name from the directory path
        chart_name=$(basename "$chart_dir")

        echo "Processing chart: $chart_name"

        # Change to the chart directory
        cd "$chart_dir" || continue

        # Update Helm dependencies
        echo "Updating dependencies for $chart_name..."
        helm dependency update

        # Return to the base directory
        cd - > /dev/null

        # Package the Helm chart
        echo "Packaging chart: $chart_name..."
        helm package "$chart_dir"
    fi
done

# Confirm the process is completed
echo "All charts have been processed."
