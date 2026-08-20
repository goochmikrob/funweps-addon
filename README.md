## Fun Weapons
Fun Weapons for Garry's Mod is a modular SWEP library with ready-to-use crazy weapons. Extendable, lightweight, and easy to mod!

### Built-in 'Fun' weapons list:
Prop Thrower: Simple prop thrower (R to copy model, M1 to shoot with it. Wouldn't copy if the model is too large)<br/>
<sup>Associated ConVar:  `funweapons_propthrower_maxsize` (Checks if ```ENTITY:BoundingRadius()``` is less or equal of the value)</sup>

### ConVars:
`funweapons_propthrower_maxsize`: Sets the maximum value of BoundingRadius for entities to be copied in PropThrower<br/>

### Simple funlib Usage:
`lua/weapons/your_weapon.lua`:
```lua

-- funweps = require(...
-- We don't need it cause funweps is a global table that can be called everywhere once it's initialized

local WEP = funweps.CreateWep("funnything",{
  Category = "#spawnmenu.category.other",
  Author = "Me",
  UseHands = true,
  WorldModel = ="models/weapons/w_shotgun.mdl",
  ViewModel = "models/weapons/c_shotgun.mdl"
})

function WEP:PrimaryAttack()

  if CLIENT then

    local pos = LocalPlayer():GetEyeTrace().HitPos
    funweps.Explosion( pos )
  
  end

  self:SetNextPrimaryFire( CurTime()+1 )

end
```
