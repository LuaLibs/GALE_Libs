--[[
  Coords2Rotation.lua
  Coordinates to rotation degrees
  version: 16.09.19
  Copyright (C) 2016 Jeroen P. Broks
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]

----------------------------------------------------------
-- Coords to Rotation                                   --
-- This is a routine originally written in BlitzMax     --
-- For the TARI engine, which is now cancelled          --
-- Left to die, to never live again! (LAURA II is       --
-- MUCH better. That's why). However this routine       --
-- inside it was already planned (and cancelled) for    --
-- BOTH Dyrt and Star Story, and NOW I shall use it     --
----------------------------------------------------------


--[[ Original BlitzMax Code

Function GameFindRot(RPX#,RPY#,RCX#,RCY#,W)
Local Overstaande# 
Local Aanliggende# 
Local Tanges#
Select W
  Case 1  'North-East
      overstaande = RPY-RCY
      aanliggende = RCX-RPX
      Tanges = Overstaande/Aanliggende
      SetRotation 90-ATan(Tanges)
  Case 2  'North-West
      Overstaande = RPY-RCY
      aanliggende = RpX-RCX
      Tanges = overstaande/aanliggende
      SetRotation (-90)+ATan(Tanges)
  Case 3  'South-East 
      Overstaande = RCY-RPY
      Aanliggende = RCX-RPX
      Tanges = Overstaande/Aanliggende
      'DrawText Int(ATan(Tanges)),100,100
      SetRotation 90+ATan(Tanges)
  Case 4  'North-West
      Overstaande = RpY-RcY
      aanliggende = RpX-RCX
      Tanges = overstaande/aanliggende
      SetRotation (-90)+ATan(Tanges)
  Default
      SetRotation Rand(0,360)
  End Select

End Function
]]


function CoordsToAngle(RPX,RPY,RCX,RCY)
     local Overstaande 
     local Aanliggende 
     local Tanges
     local ATan = math.atan -- Arc Tangent (Yeah, I'm lazy)
     local angle,altangle
     if RPX==RCX and RPY>RCY then -- North
         angle = 0
     elseif RPX==RCX and RPY<RCY then -- South
         angle = 180
     elseif RPX>RCX and RPY==RCY then -- West
         angle = -90
     elseif RPX<RCX and RPY==RCY then -- East
         angle = 90
     elseif RPY>RCY and RPX<RCX then -- North-East
        Overstaande = RPY-RCY
        Aanliggende = RCX-RPX
        Tanges = Overstaande/Aanliggende
        angle = 90-ATan(Tanges)
        altangle = 45
     elseif RPY>RCY and RCX<RPX then -- North-West
        Overstaande = RPY-RCY
        Aanliggende = RPX-RCX
        Tanges = Overstaande/Aanliggende
        angle =  (-90)+ATan(Tanges)
        altangle = -45
     elseif RPY<RCY and RCX>RPX then -- South-East 
        Overstaande = RCY-RPY
        Aanliggende = RCX-RPX
        Tanges = Overstaande/Aanliggende
        angle =  90+ATan(Tanges)
        altangle = 135
     elseif RPY<RCY and RCX<RPX then -- South-West
         Overstaande = RPY-RCY
         Aanliggende = RPX-RCX
         Tanges = Overstaande/Aanliggende
         angle = (-90)+ATan(Tanges)
         altangle = -135
     else
         angle = rand(0,360)
     end
     altangle = altangle or angle
     return math.deg(angle),altangle              
end
