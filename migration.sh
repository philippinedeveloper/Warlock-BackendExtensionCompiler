#!/bin/bash

# Prompt the user for the full path of the project folder
read -p "Enter the full path of your project folder (e.g., /path/to/your/extension): " projectFolder

# Prompt the user for the path where WarlockExtensionCompiler is located
read -p "Enter the path where WarlockExtensionCompiler is located (e.g., /path/to/WarlockExtensionCompiler): " warlockPath

# Prompt the user for the full path of the picture file
read -p "Enter the full path of the picture file (e.g., /path/to/your/extension/assets/icon.png): " picturePath

# Define the source path inside the project folder (src subdirectory)
sourcePath="$projectFolder/src"

# Define the destination paths inside the WarlockExtensionCompiler folder
destinationPath="$warlockPath/appinventor/components/src"
aiwebresPath="$warlockPath/appinventor/components/src/aiwebres"

# Check if the src folder exists in the project folder
if [ -d "$sourcePath" ]; then
    echo "Source folder found: $sourcePath"
    
    # Check if the destination path exists; if not, create it
    if [ ! -d "$destinationPath" ]; then
        echo "Destination path not found. Creating: $destinationPath"
        mkdir -p "$destinationPath"
    fi
    
    # Move the folders inside src to the destination
    for folder in "$sourcePath"/*/; do
        echo "Moving folder $folder to $destinationPath"
        mv "$folder" "$destinationPath"
    done

    # Move the Java files inside src to the destination
    for javaFile in "$sourcePath"/*.java; do
        if [ -f "$javaFile" ]; then
            echo "Moving Java file $javaFile to $destinationPath"
            mv "$javaFile" "$destinationPath"
        fi
    done
    
    echo "Source folders and Java files moved successfully!"
else
    echo "ERROR: Source folder not found. Please check the project folder path."
fi

# Check if the aiwebres folder exists; if not, create it
if [ ! -d "$aiwebresPath" ]; then
    echo "aiwebres folder not found. Creating: $aiwebresPath"
    mkdir -p "$aiwebresPath"
fi

# Check if the picture file exists and move it to aiwebres
if [ -f "$picturePath" ]; then
    echo "Moving picture file to aiwebres folder..."
    mv "$picturePath" "$aiwebresPath"
    echo "Picture file moved successfully!"
else
    echo "ERROR: Picture file not found. Please check the file path."
fi

# End of script
