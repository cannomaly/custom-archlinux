-- Automated Debugger Script for Cheat Engine Lua with Interactive Input for Coordinates

-- Function to check if we are attached to a process
function checkProcessAttached()
    local processID = getOpenedProcessID() -- Gets the ID of the currently attached process
    if processID == 0 then
        print("Error: No process attached. Please attach Cheat Engine to a process.")
        return false
    else
        print("Process ID: " .. processID .. " is attached.")
        return true
    end
end

-- Recursive function to prompt for player coordinates (X, Y, Z)
function promptForCoordinates()
    local playerX = tonumber(inputQuery("Enter the Player X coordinate", "Enter X:", "0"))
    if playerX == nil then
        print("Invalid X coordinate. Please enter a valid number.")
        return promptForCoordinates()  -- Retry if input is invalid
    end

    local playerY = tonumber(inputQuery("Enter the Player Y coordinate (optional)", "Enter Y:", "0"))
    if playerY == nil then
        print("Invalid Y coordinate. Please enter a valid number.")
        return promptForCoordinates()  -- Retry if input is invalid
    end

    local playerZ = tonumber(inputQuery("Enter the Player Z coordinate (optional)", "Enter Z:", "0"))
    if playerZ == nil then
        print("Invalid Z coordinate. Please enter a valid number.")
        return promptForCoordinates()  -- Retry if input is invalid
    end

    return playerX, playerY, playerZ
end

-- Helper function to scan for a specific coordinate and report result
function scanCoordinate(value, axis)
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
function heuristicScanForCoordinates(x, y, z)
    -- We are scanning for position coordinates, assuming they are stored as floats
    print("Starting heuristic scan for coordinates: X=" .. x .. ", Y=" .. y .. ", Z=" .. z)

    -- Scan for X, Y, and Z coordinates
    local xAddr = scanCoordinate(x, "X")
    local yAddr = scanCoordinate(y, "Y")
    local zAddr = scanCoordinate(z, "Z")

    return xAddr, yAddr, zAddr
end

-- Function to scan memory for a specific value
function scanMemoryForValue(value, valueType)
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
