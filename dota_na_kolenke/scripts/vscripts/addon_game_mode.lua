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


roshan_custom1 = false
roshan_custom2 = false
roshan_custom3 = false
roshan_custom4 = false
tron_custom1 = true
tron_custom2 = true
tron_custom3 = true
tron_custom4 = true

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
	GameRules:GetGameModeEntity():SetFreeCourierModeEnabled(true)
	self:StartModifierCheckLoop('modifier_item_roshanq')


	
end



function Wave_test()
	
	local tower1_custom1_1 = Entities:FindByName(nil ,'tower1_custom1_1')
	local tower2_custom1_1 = Entities:FindByName(nil ,'tower2_custom1_1')
	local tower1_custom2_1 = Entities:FindByName(nil ,'tower1_custom2_1')
	local tower2_custom2_1 = Entities:FindByName(nil ,'tower2_custom2_1')
	local tower1_custom3_1 = Entities:FindByName(nil ,'tower1_custom3_1')
	local tower2_custom3_1 = Entities:FindByName(nil ,'tower2_custom3_1')
	local tower1_custom4_1 = Entities:FindByName(nil ,'tower1_custom4_1')
	local tower2_custom4_1 = Entities:FindByName(nil ,'tower2_custom4_1')
	
	for i=1, 4 do

		local unit_t1 = CreateUnitByName('npc_dota_creep_badguys_melee',tower1_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
		local unit3_t1 = CreateUnitByName('npc_dota_creep_badguys_melee',tower1_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
		local unit5_t1 = CreateUnitByName('npc_dota_creep_goodguys_melee',tower1_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
		local unit7_t1 = CreateUnitByName('npc_dota_creep_badguys_melee',tower1_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
        	local unit_t2 = CreateUnitByName('npc_dota_creep_badguys_melee',tower2_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
		local unit3_t2 = CreateUnitByName('npc_dota_creep_badguys_melee',tower2_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
		local unit5_t2 = CreateUnitByName('npc_dota_creep_goodguys_melee',tower2_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
		local unit7_t2 = CreateUnitByName('npc_dota_creep_badguys_melee',tower2_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
		unit_t1:SetInitialGoalEntity(tower1_custom1_1)
		unit3_t1:SetInitialGoalEntity(tower1_custom4_1)
		unit5_t1:SetInitialGoalEntity(tower1_custom3_1)
		unit7_t1:SetInitialGoalEntity(tower1_custom2_1)
        	unit_t2:SetInitialGoalEntity(tower2_custom1_1)
		unit3_t2:SetInitialGoalEntity(tower2_custom4_1)
		unit5_t2:SetInitialGoalEntity(tower2_custom3_1)
		unit7_t2:SetInitialGoalEntity(tower2_custom2_1)

	end

	local unit2_t1 = CreateUnitByName('npc_dota_creep_goodguys_ranged',tower1_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	local unit4_t1 = CreateUnitByName('npc_dota_creep_badguys_ranged',tower1_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	local unit6_t1 = CreateUnitByName('npc_dota_creep_goodguys_ranged',tower1_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	local unit8_t1 = CreateUnitByName('npc_dota_creep_badguys_ranged',tower1_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
    	local unit2_t2 = CreateUnitByName('npc_dota_creep_goodguys_ranged',tower2_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	local unit4_t2 = CreateUnitByName('npc_dota_creep_badguys_ranged',tower2_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	local unit6_t2 = CreateUnitByName('npc_dota_creep_goodguys_ranged',tower2_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	local unit8_t2 = CreateUnitByName('npc_dota_creep_badguys_ranged',tower2_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
	unit2_t1:SetInitialGoalEntity(tower1_custom1_1)
	unit4_t1:SetInitialGoalEntity(tower1_custom4_1)
	unit6_t1:SetInitialGoalEntity(tower1_custom3_1)
	unit8_t1:SetInitialGoalEntity(tower1_custom2_1)
    	unit2_t2:SetInitialGoalEntity(tower2_custom1_1)
	unit4_t2:SetInitialGoalEntity(tower2_custom4_1)
	unit6_t2:SetInitialGoalEntity(tower2_custom3_1)
	unit8_t2:SetInitialGoalEntity(tower2_custom2_1)		
	
	Timers:CreateTimer(30, function()
		for i=1, 4 do
	            if tron_custom1 == true then
			local unit_t1 = CreateUnitByName('npc_dota_creep_goodguys_melee',tower1_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	                local unit_t2 = CreateUnitByName('npc_dota_creep_goodguys_melee',tower2_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	                unit_t1:SetInitialGoalEntity(tower1_custom1_1)
	                unit_t2:SetInitialGoalEntity(tower2_custom1_1)
	            end
	            if tron_custom4 == true then
			local unit3_t1 = CreateUnitByName('npc_dota_creep_badguys_melee',tower1_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	                local unit3_t2 = CreateUnitByName('npc_dota_creep_badguys_melee',tower2_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	                unit3_t1:SetInitialGoalEntity(tower1_custom4_1)
	                unit3_t2:SetInitialGoalEntity(tower2_custom4_1)
	            end
	            if tron_custom3 == true then
				    local unit5_t1 = CreateUnitByName('npc_dota_creep_goodguys_melee',tower1_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	                local unit5_t2 = CreateUnitByName('npc_dota_creep_goodguys_melee',tower2_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	                unit5_t1:SetInitialGoalEntity(tower1_custom3_1)
	                unit5_t2:SetInitialGoalEntity(tower2_custom3_1)
	            end
	            if tron_custom2 == true then
				    local unit7_t1 = CreateUnitByName('npc_dota_creep_badguys_melee',tower1_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
	                local unit7_t2 = CreateUnitByName('npc_dota_creep_badguys_melee',tower2_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
	                unit7_t1:SetInitialGoalEntity(tower1_custom2_1)
	                unit7_t2:SetInitialGoalEntity(tower2_custom2_1)
	            end
			
		end
	        if tron_custom1 == true then
	            local unit2_t1 = CreateUnitByName('npc_dota_creep_goodguys_ranged',tower1_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	            local unit2_t2 = CreateUnitByName('npc_dota_creep_goodguys_ranged',tower2_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	            unit2_t1:SetInitialGoalEntity(tower1_custom1_1)
	            unit2_t2:SetInitialGoalEntity(tower2_custom1_1)
	            if roshan_custom1 == true then
	                local roshan1_t1 = CreateUnitByName('npc_dota_roshanq',tower1_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	                local roshan1_t2 = CreateUnitByName('npc_dota_roshanq',tower2_custom1_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_1)
	                roshan1_t1:SetInitialGoalEntity(tower1_custom1_1)
	                roshan1_t2:SetInitialGoalEntity(tower2_custom1_1)
	            end
	        end
	        if tron_custom4 == true then
	            local unit4_t1 = CreateUnitByName('npc_dota_creep_badguys_ranged',tower1_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	            local unit4_t2 = CreateUnitByName('npc_dota_creep_badguys_ranged',tower2_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	            unit4_t1:SetInitialGoalEntity(tower1_custom4_1)
	            unit4_t2:SetInitialGoalEntity(tower2_custom4_1)
	            if roshan_custom4 == true then
	                local roshan4_t1 = CreateUnitByName('npc_dota_roshanq',tower1_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	                local roshan4_t2 = CreateUnitByName('npc_dota_roshanq',tower2_custom4_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_4)
	                roshan4_t1:SetInitialGoalEntity(tower1_custom4_1)
	                roshan4_t2:SetInitialGoalEntity(tower2_custom4_1)
	            end
	        end
	        if tron_custom3 == true then
	            local unit6_t1 = CreateUnitByName('npc_dota_creep_goodguys_ranged',tower1_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	            local unit6_t2 = CreateUnitByName('npc_dota_creep_goodguys_ranged',tower2_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	            unit6_t1:SetInitialGoalEntity(tower1_custom3_1)
	            unit6_t2:SetInitialGoalEntity(tower2_custom3_1)
	            if roshan_custom3 == true then
	                local roshan3_t1 = CreateUnitByName('npc_dota_roshanq',tower1_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	                local roshan3_t2 = CreateUnitByName('npc_dota_roshanq',tower2_custom3_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_3)
	                roshan3_t1:SetInitialGoalEntity(tower1_custom3_1)
	                roshan3_t2:SetInitialGoalEntity(tower2_custom3_1)
	            end
	        end
	        if tron_custom2 == true then
	            local unit8_t1 = CreateUnitByName('npc_dota_creep_badguys_ranged',tower1_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
	            local unit8_t2 = CreateUnitByName('npc_dota_creep_badguys_ranged',tower2_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
	            unit8_t1:SetInitialGoalEntity(tower1_custom2_1)
	            unit8_t2:SetInitialGoalEntity(tower2_custom2_1)
	            if roshan_custom2 == true then
	                local roshan2_t1 = CreateUnitByName('npc_dota_roshanq',tower1_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
	                local roshan2_t2 = CreateUnitByName('npc_dota_roshanq',tower2_custom2_1:GetAbsOrigin(),true,nil,nil,DOTA_TEAM_CUSTOM_2)
	                roshan2_t1:SetInitialGoalEntity(tower1_custom2_1)
	                roshan2_t2:SetInitialGoalEntity(tower2_custom2_1)
	            end
	        end
		return 60
	end)
end



function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1

end

function CAddonTemplateGameMode:StartModifierCheckLoop(modifier_name)
	Timers:CreateTimer(function()
		for player_id = 0, DOTA_MAX_PLAYERS - 1 do
			if PlayerResource:IsValidPlayerID(player_id) then
				local hero = PlayerResource:GetSelectedHeroEntity(player_id)
				if hero and hero:IsAlive() then
					if hero:HasModifier(modifier_name) then
						local team = hero:GetTeam()
						if team == DOTA_TEAM_CUSTOM_1 then
							roshan_custom1 = true
						elseif team == DOTA_TEAM_CUSTOM_2 then
							roshan_custom2 = true
						elseif team == DOTA_TEAM_CUSTOM_3 then
							roshan_custom3 = true
						elseif team == DOTA_TEAM_CUSTOM_4 then
							roshan_custom4 = true
						end
					end
				end
			end
		end
		return 1.0
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
        	tron_custom1 = false
		roshan_custom1 = false
		KillAndDisableRespawn(DOTA_TEAM_CUSTOM_1)  
	elseif building:GetName() == "dota_custom2_fort" then
        	tron_custom2 = false
		roshan_custom2 = false
		KillAndDisableRespawn(DOTA_TEAM_CUSTOM_2)
	elseif building:GetName() == "dota_custom3_fort" then
        	tron_custom3 = false
		roshan_custom3 = false
		KillAndDisableRespawn(DOTA_TEAM_CUSTOM_3)  
	elseif building:GetName() == "dota_custom4_fort" then
        	tron_custom4 = false
		roshan_custom4 = false
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
            if name == "dota_custom1_fort" then
                tron_custom1 = false
		roshan_custom1 = false
            elseif name == "dota_custom2_fort" then
                tron_custom2 = false
		roshan_custom2 = false
            elseif name == "dota_custom3_fort" then
                tron_custom3 = false
                roshan_custom3 = false
            elseif name == "dota_custom4_fort" then
                tron_custom4 = false
                roshan_custom4 = false
            end
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
