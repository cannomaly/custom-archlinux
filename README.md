### UE_Debugger.Lua instructions.

This Lua script is designed to run within Cheat Engine. It scans memory for specific player coordinates (X, Y, Z), assuming they are stored as floating-point values in the target process (e.g., a game or application). It uses Cheat Engine's memory scanning API to find the memory addresses associated with these coordinates.

Key Features:
Process Attachment Check (checkProcessAttached):

The script verifies whether Cheat Engine is attached to a process. If no process is attached, it prints an error message and returns false. If a process is attached, it confirms the process ID.
Coordinate Input (promptForCoordinates):

The script prompts the user to enter the player's X, Y, and Z coordinates via Cheat Engine’s inputQuery function. It ensures valid input, and if invalid input (non-numeric values) is provided, it prompts again recursively.
Memory Scanning (scanMemoryForValue and scanCoordinate):

The script performs a heuristic scan for the player coordinates. It looks for the exact floating-point value entered by the user in the process's memory.
The scanCoordinate function is used to find a specific coordinate (X, Y, or Z) and prints whether the value was found.
If successful, it returns the memory address where the coordinate is stored.
Heuristic Scan for Coordinates (heuristicScanForCoordinates):

This function ties everything together, scanning memory for the X, Y, and Z coordinates and returning their memory addresses (or nil if they are not found).
How to Use This Script:
Install Cheat Engine:

If you haven't already, download and install Cheat Engine from Cheat Engine's official website.
Launch Cheat Engine:

Open Cheat Engine on your computer.
Attach Cheat Engine to the Target Process:

Start the game or application you want to scan.
In Cheat Engine, click on the computer icon in the top-left corner.
Find and select the game/application's process from the Process List.
Click Open to attach Cheat Engine to the process.
Open the Lua Script Window:

In Cheat Engine, click on the Table menu at the top.
Select Show Cheat Table Lua Script from the dropdown menu. This opens the Lua script editor.
Paste the Lua Script:

Copy the Lua script provided above and paste it into the Lua script window.
Run the Script:

After pasting the script, click the Execute Script button located at the bottom of the Lua script window.
Input Coordinates:

The script will prompt you to enter the player's X, Y, and Z coordinates. Enter the values you believe represent the player’s position in the game. The script will validate your input and ask for valid numbers if necessary.
Heuristic Memory Scan:

Once you’ve entered the coordinates, the script will perform a memory scan to find the exact floating-point values corresponding to the X, Y, and Z positions in the attached process.
If successful, the script will print the memory addresses for the coordinates found in Cheat Engine’s Lua Console.
Troubleshooting:

If the script doesn’t find the coordinates, it might be because the values have changed or are not stored as floating-point numbers in the memory. You can try scanning with different coordinate values or tweak Cheat Engine’s settings to better suit the target process.

