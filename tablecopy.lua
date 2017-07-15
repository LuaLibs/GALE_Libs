--[[
  tablecopy.lua
  
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

function tablecopy(atable,pointersonly)
     local ret = {}
     for k,v in pairs(atable) do
         if type(v)=='table' and (not pointersonly) then 
            ret[k] = tablecopy(v)
         else   
            ret[k]=v
         end
     end
     return ret
end     


--[[ This basically copies content of a table into a new table.
     Tables inside the table will be recreated in stead of just
     making a new pointer. This will allow you to create all data 
     anew. If you put in "true" as the second argument this function
     itself will create a new table, but the tables inside the table
     will remain at the same pointer
     
     You follow?
     
]]       