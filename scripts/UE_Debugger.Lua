-- Automated Debugger Script for Cheat Engine Lua with Interactive Input for Coordinates

-- Stub definitions for external IDEs
if not soExactValue then soExactValue = 0 end
if not getOpenedProcessID then function getOpenedProcessID() return 0 end end
if not createMemScan then function createMemScan() return {} end end
if not createFoundList then function createFoundList() return {} end end
if not vtFloat then vtFloat = 0 end
if not getAddress then function getAddress(addr) return addr end end
if not inputQuery then function inputQuery(_, _, default) return default end end

-- Function to scan memory for a specific value
local function scanMemoryForValue(value, valueType)
    local scan = createMemScan()
    local results = createFoundList(scan)

    scan.firstScan(
        soExactValue, -- Scan type
        valueType,    -- Value type (float in this case)
        nil, nil,     -- Start and end addresses (default to full memory)
        value,        -- The value we are searching for
        nil, nil,     -- No rounding, no extra conditions
        nil,          -- No extra options
        nil, nil,     -- No value between, no value range
        false, false, -- No hexadecimal, no pause
        false         -- Don't allow stack
    )

    scan.waitTillDone() -- Wait until the scan is finished

    results.initialize() -- Prepare the found list

    -- Retrieve all found addresses
    local addressList = {}
    for i = 0, results.Count - 1 do
        addressList[i] = results[i]
    end

    scan.delete() -- Clean up scan object
    results.deinitialize() -- Clean up found list

    return addressList
end

-- Function to check if we are attached to a process
local function checkProcessAttached()
    local processID = getOpenedProcessID() -- Gets the ID of the currently attached process
    if processID == 0 then
        print("Error: No process attached. Please attach Cheat Engine to a process.")
        return false
    else
        print("Process ID: " .. processID .. " is attached.")
        return true
    end
end

-- Function to prompt for player coordinates (X, Y, Z) with loop for better readability
local function promptForCoordinates()
    local playerX, playerY, playerZ
    repeat
        playerX = tonumber(inputQuery("Enter the Player X coordinate", "Enter X:", "0"))
        if playerX == nil then print("Invalid X coordinate. Please enter a valid number.") end
    until playerX ~= nil

    repeat
        playerY = tonumber(inputQuery("Enter the Player Y coordinate (optional)", "Enter Y:", "0"))
        if playerY == nil then print("Invalid Y coordinate. Please enter a valid number.") end
    until playerY ~= nil

    repeat
        playerZ = tonumber(inputQuery("Enter the Player Z coordinate (optional)", "Enter Z:", "0"))
        if playerZ == nil then print("Invalid Z coordinate. Please enter a valid number.") end
    until playerZ ~= nil

    return playerX, playerY, playerZ
end

-- Helper function to scan for a specific coordinate and report result
local function scanCoordinate(value, axis)
    local address = scanMemoryForValue(value, vtFloat)
    if address == nil or #address == 0 then
        print("Error: Could not find " .. axis .. " coordinate in memory.")
        return nil
    else
        print(axis .. " coordinate found at address: " .. address[0])
        return getAddress(address[0])
    end
end

-- Function to heuristically scan memory for floating-point coordinates
local function heuristicScanForCoordinates(x, y, z)
    -- We are scanning for position coordinates, assuming they are stored as floats
    print("Starting heuristic scan for coordinates: X=" .. x .. ", Y=" .. y .. ", Z=" .. z)

    -- Scan for X, Y, and Z coordinates
    local xAddr = scanCoordinate(x, "X")
    local yAddr = scanCoordinate(y, "Y")
    local zAddr = scanCoordinate(z, "Z")

    return xAddr, yAddr, zAddr
end

-- Function to read floating-point values at addresses
local function readEntityValues(address)
    local posX = readFloat(address)
    local posY = readFloat(address + 0x4)
    local posZ = readFloat(address + 0x8)
    local health = readFloat(address + 0xC)

    print("Entity at Address: " .. string.format("0x%X", address))
    print("Position X: " .. posX)
    print("Position Y: " .. posY)
    print("Position Z: " .. posZ)
    print("Health: " .. health)
end

-- Function to scan and read entities' data
local function scanAndDissect()
    local addresses = {0x10000000, 0x10001000, 0x10002000} -- Sample addresses (replace with actual addresses or scanning method)

    for i, addr in ipairs(addresses) do
        readEntityValues(addr)
    end
end

-- Call to scan and dissect entities
scanAndDissect()
