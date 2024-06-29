ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()

    local marker = lib.requestStreamedTextureDict("marker", 10)

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k, v in pairs(Config.wash) do

             DrawMarker(9, v.position.x, v.position.y, v.position.z, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 255, false, false, 0, true, marker, "marker", false)

            if Vdist2(playerCoords, v.position.x, v.position.y, v.position.z) < 2.0 then
                ESX.ShowHelpNotification('Premi ~INPUT_CONTEXT~ per lavare il veicolo')

                if IsControlJustReleased(0, 38) then
                    if IsPedInAnyVehicle(playerPed, false) then
                        local vehicle = GetVehiclePedIsIn(playerPed, false)
                        FreezeEntityPosition(vehicle, true)
                        TaskLeaveAnyVehicle(playerPed, 0, 0)
                        Citizen.Wait(100)
                        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                        Citizen.Wait(4000)
                        FreezeEntityPosition(vehicle, false)
                        ClearPedTasks(playerPed)
                        SetVehicleDirtLevel(vehicle, 0.0)
                        ESX.ShowNotification('Veicolo lavato correttamente', 'success')
                    else
                        ESX.ShowNotification('Devi essere in un veicolo per lavarlo', 'error')
                    end
                end
            end
        end
    end
end)

for k, v in pairs(Config.wash) do
    local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
    SetBlipSprite(blip, v.blip)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, v.blipScale)
    SetBlipColour(blip, v.blipColor)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(v.blipText)
    EndTextCommandSetBlipName(blip)
end