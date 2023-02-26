
QBCore                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()
	while QBCore = nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function()
    
    Citizen.Wait(5000)
	PlayerData = QBCore.Functions.GetPlayerData()

    while true do
        Citizen.Wait(1000)
            if IsPedInAnyVehicle(PlayerPedId()) then
                SetUserRadioControlEnabled(false)
                if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
                end
        end
    end
end)