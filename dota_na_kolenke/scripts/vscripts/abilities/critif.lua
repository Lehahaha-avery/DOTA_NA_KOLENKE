LinkLuaModifier("modifier_critif" , "abilities/critif", LUA_MODIFIER_MOTION_NONE)


critif = class({})

function critif:GetIntrinsicModifierName()
	return"modifier_critif"
end

modifier_critif = class({})

function modifier_critif:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE
	}
end

function modifier_critif:GetModifierPreAttack_CriticalStrike()
	if IsServer() then
        local crit_chance = ability:GetSpecialValueFor("crit_chance")
        local crit_multiplier = ability:GetSpecialValueFor("crit_bonus")

        if RollPseudoRandomPercentage(crit_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, parent) then
            return crit_multiplier
        end
    end
    return crit_multiplier
end