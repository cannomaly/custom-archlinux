# -- Unreal Engine Debugger Script for Cheat Engine --

This Lua script is designed to work within **Cheat Engine**. It performs heuristic memory scanning to locate the memory addresses of player coordinates (X, Y, Z) in a target process (such as a game or application) and applies **structure dissection** to analyze object properties such as position and health.

## Features

- **Process Attachment Check**: Ensures that Cheat Engine is attached to a target process before scanning memory.
- **User Input for Coordinates**: Prompts the user for player X, Y, and Z coordinates.
- **Heuristic Memory Scan**: Performs an exact memory scan for the floating-point coordinates provided by the user.
- **Structure Dissection**: Automatically dissects the memory structure at given addresses to extract the player's position (X, Y, Z) and health.
- **Console Output**: Displays the results of the scan, including the memory addresses where the coordinates were found and the dissected values.

## Usage

### Prerequisites
- Download and install **Cheat Engine**: [Cheat Engine Official Website](https://cheatengine.org/)
- A running process (e.g., a game) whose memory can be scanned by Cheat Engine.

### How to Use

1. **Launch Cheat Engine**:
   - Open **Cheat Engine** on your computer.

2. **Attach Cheat Engine to a Process**:
   - Click the **computer icon** in the top-left corner.
   - Find and select the process (e.g., your game) from the list.
   - Click **Open** to attach Cheat Engine to the process.

3. **Open the Lua Script Window**:
   - In the top menu, click **Table** → **Show Cheat Table Lua Script**.

4. **Paste the Lua Script**:
   - Copy the Lua script from this repository and paste it into the Lua script window in Cheat Engine.

5. **Run the Script**:
   - After pasting the script, click the **Execute Script** button at the bottom of the Lua window.

6. **Input Player Coordinates**:
   - The script will prompt you for the player's X, Y, and Z coordinates. Enter the coordinates based on the values you believe correspond to the player's position in the game.

7. **Heuristic Memory Scan**:
   - Once the coordinates are entered, the script will perform a memory scan to locate the addresses of the X, Y, and Z coordinates in memory.
   - The memory addresses, if found, will be displayed in Cheat Engine’s Lua console.

8. **Structure Dissection**:
   - The script will dissect the memory at specified addresses (sample addresses are provided in the script), printing the dissected structure information (position and health) for each entity.

### Example Output:

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

Entity at Address: 0x10001000
Position X: 110.0
Position Y: 60.0
Position Z: 210.0
Health: 90.0
