# -- Unreal Engine Debugger Script for Cheat Engine --
This project provides a Lua script for dynamically scanning, dissecting, and extracting player data from a game's memory using Cheat Engine. It supports games built with both 

## Features

- **Process Attachment Check**: Ensures that Cheat Engine is attached to the target process before scanning memory.
- **Dynamic Game Configuration**: Easily switch between multiple games using a configuration file (`config.lua`) with game-specific memory offsets and patterns.
- **Unreal Engine Version Detection**: Automatically detects whether the game uses UE4 or UE5 based on memory pattern scanning.
- **Heuristic Memory Scan**: Scans the game's memory for player coordinates (X, Y, Z).
- **Memory Dissection**: Extracts player data such as position, health, velocity, inventory, status effects, equipment, cooldowns, mana, and stamina.
- **Batched Memory Scanning**: Efficiently scans large memory spaces using batch processing for better performance.
- **Error Handling and Safe Reads**: Safely reads memory addresses and handles invalid or inaccessible memory locations.
- **Logging**: Extracted player data is logged to a file (`player_data_log.txt`) for later review.

## Prerequisites

1. **Cheat Engine**: Download and install Cheat Engine from [https://www.cheatengine.org/](https://www.cheatengine.org/).
2. **Lua Environment**: This script is intended to be run within Cheat Engine's Lua scripting environment.

## Setup Instructions

### Step 1: Clone the Repository and Install Cheat Engine

1. Clone this repository to your local machine by downloading or pulling it from your GitHub repository.

2. Install Cheat Engine:

   - Download Cheat Engine from the [official website](https://www.cheatengine.org/).
   - Install it on your system by following the provided installation instructions.

### Step 2: Configure Your Games

To configure the script for specific games, modify the `config.lua` file available in your repository. This file contains game-specific memory offsets and Unreal Engine detection patterns.

### Step 3: Run the Script in Cheat Engine

1. **Open Cheat Engine** and attach it to the game's process:
   - Click on the **Select a process to open** button (computer icon in the top-left).
   - Choose the correct game process from the list.
   
2. Open the Lua script:
   - Click on **Table** > **Show Cheat Table Lua Script**.
   - Copy and paste the Lua script (`main.lua`) into the Lua script window.

3. Execute the script:
   - Click on **Execute Script** to run the script.

### Step 4: Using the Script

1. **Select the Game Configuration**: The script will prompt you to enter the game ID (e.g., `game_1` or `game_2`) from the `config.lua` file.
   
2. **Enter Player Coordinates**: Input the player's X, Y, and Z coordinates when prompted.

3. **Results**: The script will scan memory for the coordinates and display the extracted player data, including:
   - Position (X, Y, Z)
   - Health
   - Velocity
   - Inventory
   - Status effects
   - Equipment
   - Cooldowns
   - Mana
   - Stamina

   Results will be displayed in the Cheat Engine console and logged to `player_data_log.txt`.

## Example Output

```plaintext
Detected Unreal Engine version: 25
Scanning for player coordinates: X=120.0, Y=250.0, Z=15.0
Found X Coordinate at address: 0x12345678
Found Y Coordinate at address: 0x123456AC
Found Z Coordinate at address: 0x123456B0
Dissected structure at address: 0x12345678
Position: X=120.0
Health: 100.0
Inventory Item ID: 103
