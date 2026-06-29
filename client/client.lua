local function getDisplayName(model)
    local text = GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(model)))
    if not text or text == '' or text == 'NULL' then
        return model
    end
    return text
end

local function fetchVehicleModels()
    local models = GetAllVehicleModels()

    -- Vehicle categories
    local vehicleCategories = {
        [0] = "Compacts",
        [1] = "Sedans",
        [2] = "SUVs",
        [3] = "Coupes",
        [4] = "Muscle",
        [5] = "Sports Classics",
        [6] = "Sports",
        [7] = "Super",
        [8] = "Motorcycles",
        [9] = "Off-road",
        [10] = "Industrial",
        [11] = "Utility",
        [12] = "Vans",
        [13] = "Cycles",
        [14] = "Boats",
        [15] = "Helicopters",
        [16] = "Planes",
        [17] = "Service",
        [18] = "Emergency",
        [19] = "Military",
        [20] = "Commercial",
        [21] = "Trains",
        [22] = "Open Wheel",
    }

    local categorizedVehicles = {}
    local addonCount = 0

    for _, model in ipairs(models) do
        local class = GetVehicleClassFromName(model) --[[ Grab all vehicle models in game, including add-on! ]]
        local className = vehicleCategories[class] or "Unknown"

        if not categorizedVehicles[className] then
            categorizedVehicles[className] = {}
        end

        local entry = { model = model, label = getDisplayName(model) }
        table.insert(categorizedVehicles[className], entry)

        --[[ Add-on vehicles: any model not in base game gets added into there own category! I know its been a year chill :P]]
        if not StockVehicles[string.lower(model)] then
            if not categorizedVehicles["Add-on"] then
                categorizedVehicles["Add-on"] = {}
            end
            table.insert(categorizedVehicles["Add-on"], entry)
            addonCount = addonCount + 1
        end
    end

    if Config.Debug then
        print(('Found ^2%d^7 add-on vehicles out of ^2%d^7 total models'):format(addonCount, #models))
    end

    SendNUIMessage({
        type = 'setVehicleModels',
        models = categorizedVehicles
    })
end

--[[ Speed omeegee ]]
local function applyMaxTuning(vehicle)
    SetVehicleModKit(vehicle, 0)
    for _, modType in ipairs({ 11, 12, 13, 15, 16 }) do
        local count = GetNumVehicleMods(vehicle, modType)
        if count > 0 then
            SetVehicleMod(vehicle, modType, count - 1, false)
        end
    end
    ToggleVehicleMod(vehicle, 18, true) --[[ turbo pshhhhhhhh ]]
end

--[[ Paint Jobs ]]
local function applyCustomColour(vehicle, primary, secondary)
    SetVehicleModKit(vehicle, 0)
    SetVehicleCustomPrimaryColour(vehicle, primary.r or 255, primary.g or 255, primary.b or 255)
    SetVehicleCustomSecondaryColour(vehicle, secondary.r or 0, secondary.g or 0, secondary.b or 0)
end

RegisterNUICallback('spawnVehicle', function(data, cb)
    local model = data.model
    local options = data.options or {}

    local loaded = lib.requestModel(model, 10000)
    if not loaded then
        cb('error')
        return
    end

    local ped = PlayerPedId()
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 2.0, 0.5)
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)

    if IsPedInAnyVehicle(ped, true) then
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
            DeleteVehicle(veh)
        end
    end

    if options.maxTuned then applyMaxTuning(vehicle) end
    if options.applyColor and options.primary and options.secondary then
        applyCustomColour(vehicle, options.primary, options.secondary)
    end

    if Config.Warp then SetPedIntoVehicle(ped, vehicle, -1) end

    if Config.Keys == 'qb' or Config.Keys == 'qbx' then
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
    elseif Config.Keys == 'standalone' then
        SetVehicleNeedsToBeHotwired(vehicle, false)
        SetVehicleDoorsLocked(vehicle, 1)
        SetVehicleEngineOn(vehicle, true, true, false)
    end

    local fuelSystems = {
        ['legacy'] = function(veh) exports['LegacyFuel']:SetFuel(veh, 100.0) end,
        ['cdn'] = function(veh) exports['cdn-fuel']:SetFuel(veh, 100.0) end,
        ['ox'] = function(veh) Entity(veh).state.fuel = 100.0 end,
        ['standalone'] = function(veh) SetVehicleFuelLevel(veh, 100.0) end
    }

    if fuelSystems[Config.Fuel] then
        fuelSystems[Config.Fuel](vehicle)
    else
        print('No valid fuel system')
    end

    SetModelAsNoLongerNeeded(model)
    if Config.Discord.Enabled then
        TriggerServerEvent('Rup-VehicleSpawner:DiscordLog', data)
    end
    cb('ok')
end)

-- Close UI
RegisterNUICallback('closeUI', function(_, cb)
    SetNuiFocus(false, false)
    cb({ status = 'closed' })
end)

-- Open UI
RegisterNetEvent('rup-VehicleSpawner:openUi', function()
    SetNuiFocus(true, true)
    fetchVehicleModels()
    SendNUIMessage({ action = "openUI" })
end)