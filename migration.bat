@echo off
:: Prompt the user for the full path of the project folder
set /p projectFolder=Enter the full path of your project folder (e.g., C:\Path\To\Your\Extension): 

:: Prompt the user for the path where WarlockExtensionCompiler is located
set /p warlockPath=Enter the path where WarlockExtensionCompiler is located (e.g., C:\Path\To\WarlockExtensionCompiler): 

:: Prompt the user for the full path of the picture file
set /p picturePath=Enter the full path of the picture file (e.g., C:\Path\To\Your\Picture.png): 

:: Define the source path inside the project folder (src subdirectory)
set sourcePath=%projectFolder%\src

:: Define the destination paths inside the WarlockExtensionCompiler folder
set destinationPath=%warlockPath%\appinventor\components\src
set aiwebresPath=%warlockPath%\aiwebres

:: Check if the src folder exists in the project folder
if exist "%sourcePath%" (
    echo Source folder found: %sourcePath%
    
    :: Check if the destination path exists; if not, create it
    if not exist "%destinationPath%" (
        echo Destination path not found. Creating: %destinationPath%
        mkdir "%destinationPath%"
    )
    
    :: Use FOR loop to find and move the folders inside src
    for /d %%F in ("%sourcePath%\*") do (
        echo Moving folder %%F to %destinationPath%
        move "%%F" "%destinationPath%"
    )
    
    echo Source folders moved successfully!
) else (
    echo ERROR: Source folder not found. Please check the project folder path.
)

:: Check if the aiwebres folder exists; if not, create it
if not exist "%aiwebresPath%" (
    echo aiwebres folder not found. Creating: %aiwebresPath%
    mkdir "%aiwebresPath%"
)

:: Check if the picture file exists
if exist "%picturePath%" (
    echo Moving picture file to aiwebres folder...
    move "%picturePath%" "%aiwebresPath%"
    echo Picture file moved successfully!
) else (
    echo ERROR: Picture file not found. Please check the file path.
)

:: Pause to display the result
pause
