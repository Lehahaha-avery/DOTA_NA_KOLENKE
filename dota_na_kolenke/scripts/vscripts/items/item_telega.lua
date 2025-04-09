LinkLuaModifier("modifier_item_telega" , "items/item_telega", LUA_MODIFIER_MOTION_NONE)


item_telega = class({})


function item_telega:OnSpellStart()
	local caster = self:GetCaster()
    caster:AddNewModifier(caster, self, "modifier_item_telega", {})
	
	Timers:CreateTimer(0, function()
            caster:RemoveItem(self)
    end)


end


modifier_item_telega = class({})


function modifier_item_telega:IsPermanent() return true end
function modifier_item_telega:RemoveOnDeath() return false end
function modifier_item_telega:IsHidden() return true end

