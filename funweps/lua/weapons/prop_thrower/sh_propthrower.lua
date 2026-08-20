AddCSLuaFile("autorun/funwepslib.lua")
include("autorun/funwepslib.lua")
-- For if not funweps table is initialized

local swep = funweps.CreateWep("fw_prop_thrower",{
  Category = "Fun Weapons",
  Author = "Me",
  UseHands = true,
  WorldModel = ="models/weapons/w_shotgun.mdl",
  ViewModel = "models/weapons/c_shotgun.mdl"
})

for key, value in pairs(swep) do

    SWEP[key] = value

end

SWEP.PropSelected = "models/props_borealis/bluebarrel001.mdl"

function SWEP:PrimaryAttack()
    if not self:CanPrimaryAttack() then return end

    self:TakePrimaryAmmo(1)
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
    self.Owner:SetAnimation(PLAYER_ATTACK1)
    self:EmitSound("Weapon_Shotgun.Single")
    self:SetNextPrimaryFire(CurTime() + 0.5)

    if CLIENT then return end

    local ply = self.Owner
    if not IsValid(ply) then return end

    local prop = ents.Create("prop_physics")
    if not IsValid(prop) then return end

    prop:SetModel( self.PropSelected )
    local spawnPos = ply:GetShootPos() + (ply:GetAimVector() * 50)
    prop:SetPos(spawnPos)
    prop:SetAngles(ply:GetAngles())
    prop:Spawn()

    if prop.CPPISetOwner then

        prop:CPPISetOwner(ply)

    else

        if prop.SetPhysicsAttacker then

            prop:SetPhysicsAttacker(ply,10)

        end

    end

    local phys = prop:GetPhysicsObject()

    if IsValid(phys) then

        local pushForce = ply:GetAimVector() * 1500
        phys:ApplyForceCenter(pushForce)

    end

end