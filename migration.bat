@echo off
:: Prompt the user for the full path of the project folder
set /p projectFolder=Enter the full path of your project folder (e.g., C:\Path\To\Your\Extension): 

:: Prompt the user for the path where WarlockExtensionCompiler is located
set /p warlockPath=Enter the path where WarlockExtensionCompiler is located (e.g., C:\Path\To\WarlockExtensionCompiler): 

:: Define the source path inside the project folder (src subdirectory)
set sourcePath=%projectFolder%\src

:: Define the destination path inside the WarlockExtensionCompiler folder
set destinationPath=%warlockPath%\appinventor\components\src

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
    
    echo Migration completed successfully!
) else (
    echo ERROR: Source folder not found. Please check the project folder path.
)

:: Pause to display the result
pause
