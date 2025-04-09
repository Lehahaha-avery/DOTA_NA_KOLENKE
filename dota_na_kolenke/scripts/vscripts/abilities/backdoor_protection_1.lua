LinkLuaModifier("modifier_backdoor_protection_1" , "abilities/backdoor_protection_1", LUA_MODIFIER_MOTION_NONE)


backdoor_protection_1 = class({})


function backdoor_protection_1:GetIntrinsicModifierName()
	return"modifier_backdoor_protection"
end


modifier_backdoor_protection_1 = class({})


function modifier_backdoor_protection_1:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
		
	}
end




function modifier_backdoor_protection_1:GetModifierIncomingDamage_Percentage()
    return -70
end


function modifier_backdoor_protection:GetModifierConstantHealthRegen()
    return 20 -- небольшая регенерация
end