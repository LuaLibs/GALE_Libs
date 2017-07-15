--[[
  SerializeIntoSysVar.lua
  
  version: 17.07.15
  Copyright (C) 2017 Jeroen P. Broks
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
function StoreVar(slot,v)
    Var.D("$STOREDVARIABLE$"..upper(slot).."$",serialize('local ret',v).."\nreturn ret")
end

function RetrieveVar(slot)
    local script = CVVN("$STOREDVARIABLES$"..upper(slot).."$")
    if not script then return nil end
    local suc,ret = pcal(loadstring(script))
    if not suc then 
       CSay("WARNING! Retrieving a variable from slot '"..slot.."' went wrong",255,180,0)
       CSay("    "..ret,180,0,250)
       return nil
    end
    return ret
end    
           
