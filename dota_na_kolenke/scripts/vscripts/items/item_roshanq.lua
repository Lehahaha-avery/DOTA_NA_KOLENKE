LinkLuaModifier("modifier_item_roshanq" , "items/item_roshanq", LUA_MODIFIER_MOTION_NONE)


item_roshanq = class({})


function item_roshanq:OnSpellStart()
	local caster = self:GetCaster()
    caster:AddNewModifier(caster, self, "modifier_item_roshanq", {})
	
	Timers:CreateTimer(0, function()
            caster:RemoveItem(self)
    end)


end


modifier_item_roshanq = class({})


function modifier_item_roshanq:IsPermanent() return true end
function modifier_item_roshanq:RemoveOnDeath() return false end
function modifier_item_roshanq:IsHidden() return true end


