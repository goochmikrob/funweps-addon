--[[
- 
-   FunWeapons library
-   These functions can be called everywhere later
-
--]]

funweps = funweps or {}

local primary_default = {
        ['Ammo'] = "Pistol",
        ClipSize = 20,
        DefaultClip = 20,
        Automatic = false
}


--- Creates weapon based on SWEP base (just not to rewrite same thing over and over)
--@param string name    Name
--@param table swepdata     The SWEP table structure
function funweps.CreateWep(name, swepdata)

    local base = "weapon_base"
    local swep = {}

    if not istable( swepdata ) then error("Swepdata passed as "..type(swepdata).." but expected table!",1)

    -- SHARED
    swep.Base = base
    swep.ClassName = swepdata.ClassName or "funweapon_"..name
    swep.Spawnable = swepdata.Spawnable or true
    swep.AdminOnly = swepdata.AdminOnly or false
    swep.WorldModel = swepdata.WorldModel or "models/weapons/w_pistol.mdl"
    swep.ViewModel = swepdata.ViewModel or "models/weapons/v_pistol.mdl"
    swep.Primary = swepdata.Primary or primary_default
    swep.Secondary = swepdata.Secondary or {}
    swep.Weight = swepdata.Weight or 5

    -- SERVER
    swep.DisableDuplicator = swepdata.DisableDuplicator or false

    -- CLIENT
    swep.Category = swepdata.Category or "#spawnmenu.category.other"
    swep.UseHands = swepdata.UseHands or false
    swep.IconOverride = swepdata.IconOverride or ""
    swep.Author = swepdata.Author or "funweapons"
    swep.Contact = swepdata.Contact or ""
    swep.Purpose = swepdata.Purpose or ""
    swep.Instructions = swepdata.Instructions or ""
    swep.PrintName = swepdata.PrintName or "Fun Weapon"
    swep.BobScale = swepdata.BobScale or 1
    swep.SwayScale = swepdata.SwayScale or 1
    swep.BounceWeaponIcon = swepdata.BounceWeaponIcon or true 
    swep.DrawAmmo = swepdata.DrawAmmo or true 
    swep.DrawCrosshair = swepdata.DrawCrosshair or true 

    weapons.Register(swep, swep.ClassName)
    
    return swep

end


--- Simply creates an explosion effect in pos
--@param vector pos Effect Origin
function funweps.Explosion(pos)

    if not isvector( pos ) then return end

    local effectdata = {}
    effectdata:SetOrigin( pos )

    util.Effect("Explosion",effectdata)

end


--- Checks if it's allowed to copy the model for PropThrower.
--@param entity ent The entity is being checked
hook.Add("FWP_PT_CanCopyModel","FunWeapons",function( ent )

    local convar = GetConVar("funweapons_propthrower_maxsize")

    if not convar then return false end

    local rbounds = ent:BoundingRadius()
    local rbounds_max = convar:GetFloat()

    if rbounds < rbounds_max then
        return false
    else
        return true 
    end

end)
