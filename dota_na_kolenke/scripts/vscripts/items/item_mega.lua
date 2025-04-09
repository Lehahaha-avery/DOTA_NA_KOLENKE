LinkLuaModifier("modifier_item_mega" , "items/item_mega", LUA_MODIFIER_MOTION_NONE)


item_mega = class({})


function item_mega:OnSpellStart()
	local caster = self:GetCaster()
    caster:AddNewModifier(caster, self, "modifier_item_mega", {})
	
	Timers:CreateTimer(0, function()
            caster:RemoveItem(self)
    end)


end


modifier_item_mega = class({})


function modifier_item_mega:IsPermanent() return true end
function modifier_item_mega:RemoveOnDeath() return false end
function modifier_item_mega:IsHidden() return true end

