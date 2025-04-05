require('timers')

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

function Activate()

	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()

end



function CAddonTemplateGameMode:InitGameMode()
	
	GameRules:SetTimeOfDay(0.25)
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_1, 1 ) 
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_2, 1 ) 
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_3, 1 ) 
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_4, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 0 ) 
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
	GameRules:SetShowcaseTime(5.0)
	GameRules:SetStrategyTime(25.0)
	GameRules:SetPreGameTime(10.0)
	GameRules:SetUseUniversalShopMode(true)
	self:StartModifierCheckLoop("modifier_item_roshanq")
end

function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1

end

function Wave_test()
	
	local point = Entities:FindByName(nil ,'point1')
	local point2 = Entities:FindByName(nil ,'point1_a')
	local point3 = Entities:FindByName(nil ,'point1_b')
	local point4 = Entities:FindByName(nil ,'point1_c')

	for i=1, 4 do

		local unit = CreateUnitByName('npc_dota_creep_badguys_melee',point:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
		local unit3 = CreateUnitByName('npc_dota_creep_badguys_melee',point4:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
		local unit5 = CreateUnitByName('npc_dota_creep_goodguys_melee',point3:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
		local unit7 = CreateUnitByName('npc_dota_creep_badguys_melee',point2:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
		unit:SetInitialGoalEntity(point)
		unit3:SetInitialGoalEntity(point4)
		unit5:SetInitialGoalEntity(point3)
		unit7:SetInitialGoalEntity(point2)

	end

	local unit2 = CreateUnitByName('npc_dota_creep_goodguys_ranged',point:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	local unit4 = CreateUnitByName('npc_dota_creep_badguys_ranged',point4:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	local unit6 = CreateUnitByName('npc_dota_creep_goodguys_ranged',point3:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	local unit8 = CreateUnitByName('npc_dota_creep_badguys_ranged',point2:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
	unit2:SetInitialGoalEntity(point)
	unit4:SetInitialGoalEntity(point4)
	unit6:SetInitialGoalEntity(point3)
	unit8:SetInitialGoalEntity(point2)	
	
	Timers:CreateTimer(60, function()
		for i=1, 4 do
			local unit = CreateUnitByName('npc_dota_creep_goodguys_melee',point:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
			local unit3 = CreateUnitByName('npc_dota_creep_badguys_melee',point4:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
			local unit5 = CreateUnitByName('npc_dota_creep_goodguys_melee',point3:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
			local unit7 = CreateUnitByName('npc_dota_creep_badguys_melee',point2:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
			unit:SetInitialGoalEntity(point)
			unit3:SetInitialGoalEntity(point4)
			unit5:SetInitialGoalEntity(point3)
			unit7:SetInitialGoalEntity(point2)
		end

		local unit2 = CreateUnitByName('npc_dota_creep_goodguys_ranged',point:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
		local unit4 = CreateUnitByName('npc_dota_creep_badguys_ranged',point4:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
		local unit6 = CreateUnitByName('npc_dota_creep_goodguys_ranged',point3:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
		local unit8 = CreateUnitByName('npc_dota_creep_badguys_ranged',point2:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
		unit2:SetInitialGoalEntity(point)
		unit4:SetInitialGoalEntity(point4)
		unit6:SetInitialGoalEntity(point3)
		unit8:SetInitialGoalEntity(point2)
		return 60
	end)
end

function OnGameRulesStateChange()
    local state = GameRules:State_Get()
    if state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
    	Wave_test()
    end
end

function OnBuildingDestroyed(event)
	local building = EntIndexToHScript(event.entindex_killed)

	if building:GetName() == "dota_custom1_fort" then
		KillAndDisableRespawn(DOTA_TEAM_CUSTOM_1)  
	elseif building:GetName() == "dota_custom2_fort" then
		KillAndDisableRespawn(DOTA_TEAM_CUSTOM_2)
	elseif building:GetName() == "dota_custom3_fort" then
		KillAndDisableRespawn(DOTA_TEAM_CUSTOM_3)  
	elseif building:GetName() == "dota_custom4_fort" then
		KillAndDisableRespawn(DOTA_TEAM_CUSTOM_4)  
	end
end

function KillAndDisableRespawn(team)
	for playerID = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
		if PlayerResource:IsValidPlayerID(playerID) and PlayerResource:GetTeam(playerID) == team then
			local hero = PlayerResource:GetSelectedHeroEntity(playerID)
			if hero then
				hero:ForceKill(false) 
				hero:SetTimeUntilRespawn(-1)  
				hero:SetBuybackCooldownTime(99999)  
                hero:SetBuybackGoldCost(99999)  
                hero:SetBuybackDisabledByReapersScythe(true) 
			end
		end
	end
end


ListenToGameEvent("entity_killed", OnBuildingDestroyed, nil)

ListenToGameEvent("game_rules_state_change", OnGameRulesStateChange, nil)

local destroyedThrones = {}

ListenToGameEvent("entity_killed", function(event)

    local killedEntity = EntIndexToHScript(event.entindex_killed)
    local custom1 = Entities:FindByName(nil, "dota_custom1_fort") 
    local custom2 = Entities:FindByName(nil, "dota_custom2_fort") 
    local custom3 = Entities:FindByName(nil, "dota_custom3_fort") 
    local custom4 = Entities:FindByName(nil, "dota_custom4_fort") 

    if killedEntity then
        local name = killedEntity:GetName()
        if name == "dota_custom1_fort" or name == "dota_custom2_fort" or name == "dota_custom3_fort" or name == "dota_custom4_fort" then
            destroyedThrones[name] = true
            local count = 0
            for _ in pairs(destroyedThrones) do
                count = count + 1
            end
            if count >= 3 then
                if custom1 and custom1:IsAlive() then
                    GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_1)
                elseif custom2 and custom2:IsAlive() then
                    GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_2)
                elseif custom3 and custom3:IsAlive() then
                    GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_3)
                elseif custom4 and custom4:IsAlive() then
                    GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_4)
                end
            end
        end
    end
end, nil)




--курьеры
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









function CAddonTemplateGameMode:StartModifierCheckLoop(modifier_name)
    Timers:CreateTimer(function()
        for player_id = 0, DOTA_MAX_PLAYERS - 1 do
            if PlayerResource:IsValidPlayerID(player_id) then
                local hero = PlayerResource:GetSelectedHeroEntity(player_id)
                if hero and hero:IsAlive() then
                    if hero:HasModifier(modifier_name) then
                    	local team = hero:GetTeam()
                end
            end
        end

        return 1.0 -- повторять каждую секунду (можно изменить интервал)
    end)
end


