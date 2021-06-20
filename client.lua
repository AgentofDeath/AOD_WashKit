ESX	= nil
local cleaningcar = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('AOD:CleanThisBitch') --need to register our event to use when the item is used
AddEventHandler('AOD:CleanThisBitch', function() --same think but here comes the bulk of what we want
	local playerPed = PlayerPedId() --get the player
	local coords = GetEntityCoords(playerPed) --get the players position, this way we can figure out where the player is in relation to the car
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then --first way to check for vehicle compared to our coords
		local vehicle --declare our variable we are searching for

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false) --if they're inside the car (sometimes necessary for onesync related things not working correctly)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)-- last check.  At this point we either found a car or we are sure as fuck not near one
		end
		if DoesEntityExist(vehicle) then --theres a car here
				cleaningcar = true --we are doing it
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true) -- start scenario
				Citizen.CreateThread(function()
					exports['progressBars']:startUI((20000), "Cleaning Car")-- export for the progress bar to show up
					Citizen.Wait(20000) -- a pause or wait to match the same as the export for the progress bar

					SetVehicleDirtLevel(vehicle, 0) -- make the car clean when its all done
					ClearPedTasksImmediately(playerPed) --cancel everything you were doing
					
					exports['mythic_notify']:DoLongHudText('inform', 'You washed your car! Nice job kid') --notify the player that cleaning is done. such wow
					cleaningcar = false --we aint doing it anymore
				end)
			    end
			end
		end)




Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)    
		if cleaningcar then
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 32, true) -- W
			DisableControlAction(0, 34, true) -- A
			DisableControlAction(0, 31, true) -- S
			DisableControlAction(0, 30, true) -- D
			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?
			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job
			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen
			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle
			DisableControlAction(2, 36, true) -- Disable going stealth
            		DisableControlAction(0, 200, true)  -- ESC
            		DisableControlAction(0, 322, true)  -- ESC
            		DisableControlAction(0, 191, true)  
			DisableControlAction(0, 201, true) 
            		DisableControlAction(0, 215, true)  
			DisableControlAction(0, 18, true) 
            		DisableControlAction(0, 176, true)  
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle 
			DisableControlAction(0, 73,  true)  -- x
			DisableControlAction(0, 105, true)  -- x
			DisableControlAction(0, 120, true)  -- x
			DisableControlAction(0, 154, true)  -- x
			DisableControlAction(0, 186, true)  -- x
			DisableControlAction(0, 252, true)  -- x
			DisableControlAction(0, 323, true)  -- x
			DisableControlAction(0, 337, true)  -- x
			DisableControlAction(0, 354, true)  -- x
			DisableControlAction(0, 357, true)  -- x
			DisableControlAction(0, 166, true)  -- F5
			DisableControlAction(0, 318, true)  -- F5 
			DisableControlAction(0, 327, true)  -- F5 
            		DisableControlAction(0, 243, true)  -- 
		else
			Citizen.Wait(500)
		end
	end
end)
