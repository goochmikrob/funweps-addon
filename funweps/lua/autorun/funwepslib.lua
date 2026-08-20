--[[
- 
-   FunWeapons library
-   These functions can be called everywhere later
-
--]]

funweps = funweps or {}

function funweps.Error = error
local DEFAULT_PRIMARY = {
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

    if not istable( swepdata ) then funweps.Error("Swepdata passed as "..type(swepdata).." but expected table!")

    -- SHARED
    swep.Base = base
    swep.ClassName = "funweapon_"..name
    swep.Spawnable = swepdata.Spawnable or true
    swep.AdminOnly = swepdata.AdminOnly or false
    swep.WorldModel = swepdata.WorldModel or "models/weapons/w_pistol.mdl"
    swep.ViewModel = swepdata.ViewModel or "models/weapons/v_pistol.mdl"
    swep.Primary = swepdata.Primary or DEFAULT_PRIMARY
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