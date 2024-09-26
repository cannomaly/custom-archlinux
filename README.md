# -- Unreal Engine Debugger Script for Cheat Engine --

This Lua script is designed to be run within **Cheat Engine**. It performs heuristic memory scanning to locate player coordinates (X, Y, Z) in a target process (such as a game or application) and dissects structures, such as position and health, for multiple entities.

## Features

- **Process Attachment Check**: Ensures that Cheat Engine is attached to a target process before scanning memory.
- **User Input for Coordinates**: Prompts the user for player X, Y, and Z coordinates via dialog boxes.
- **Heuristic Memory Scan**: Scans the memory for floating-point values that match the player’s coordinates.
- **Structure Dissection**: Dissects the structure at specific memory addresses, extracting the player's position and health.
- **Console Output**: Displays the results of the memory scan and structure dissection, including memory addresses and dissected values (positions and health).

## Prerequisites

- **Cheat Engine**: [Download Cheat Engine](https://cheatengine.org/) and install it on your system.
- A running process (e.g., a game) whose memory can be scanned by Cheat Engine.

## How to Use

### Step 1: Attach Cheat Engine to a Process

1. Open the game or application whose memory you want to scan.
2. In Cheat Engine, click the **computer icon** in the top-left corner.
3. Select the appropriate process from the **Process List** and click **Open**.

### Step 2: Open the Lua Script Window

1. In Cheat Engine, click **Table** → **Show Cheat Table Lua Script**.
2. This will open the Lua scripting window.

### Step 3: Copy and Paste the Script

1. Copy the Lua script from this repository.
2. Paste the script into the Cheat Engine Lua script window.

### Step 4: Run the Script

1. Click the **Execute Script** button in the bottom-right corner of the Lua script window.
2. The script will start executing and will prompt you for the player's coordinates.

### Step 5: Input Player Coordinates

1. You will be prompted to input the player's **X**, **Y**, and **Z** coordinates.
2. Enter the coordinates when prompted. If invalid input is provided (non-numeric), the script will ask you to re-enter the value.

### Step 6: Pointer Scan and Dissection

1. The script will perform a **pointer scan** to dynamically find the memory addresses for the player's position (X, Y, Z) in the process.
2. If successful, the script will print the memory addresses and dissect the player's position and health values.

## Example Output:
```lua
Process ID: 12345 is attached.
Starting heuristic scan for coordinates: X=100, Y=50, Z=200
X coordinate found at address: 0xABCDEF00
Y coordinate found at address: 0xABCDEF04
Z coordinate found at address: 0xABCDEF08

Entity at Address: 0x10000000
Position X: 100.0
Position Y: 50.0
Position Z: 200.0
Health: 100.0

### Key Components:
 **Usage Instructions**: Detailed steps on how to use the Lua script within Cheat Engine, including how to attach to a process, input coordinates, and run a memory scan.
 **Example Output**: A sample of what the console output looks like when the script successfully locates player coordinates and performs structure dissection.
 **Notes and Troubleshooting**: Suggestions for handling possible errors or issues during the scanning process.
