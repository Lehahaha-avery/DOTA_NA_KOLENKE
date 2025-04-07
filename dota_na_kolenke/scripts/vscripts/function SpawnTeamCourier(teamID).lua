function SpawnTeamCourier(teamID)
    local hasPlayers = false

    for playerID = 0, 9 do
        if PlayerResource:IsValidPlayer(playerID) and PlayerResource:GetTeam(playerID) == teamID then
            hasPlayers = true
            break
        end
    end

    if not hasPlayers then return end -- 0 - 0

    local courier = CreateUnitByName("npc_dota_courier", Vector(0, 0, 0), true, nil, nil, teamID)
    
    for playerID = 0, 9 do
        if PlayerResource:IsValidPlayer(playerID) and PlayerResource:GetTeam(playerID) == teamID then
            courier:SetControllableByPlayer(playerID, true)
        end
    end
end

function SpawnCouriers()
    SpawnTeamCourier(DOTA_TEAM_CUSTOM_1) 
    SpawnTeamCourier(DOTA_TEAM_CUSTOM_2)  
    SpawnTeamCourier(DOTA_TEAM_CUSTOM_3) 
    SpawnTeamCourier(DOTA_TEAM_CUSTOM_4)
end

ListenToGameEvent("game_rules_state_change", function()
    if GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
        SpawnCouriers()
    end
end, nil)