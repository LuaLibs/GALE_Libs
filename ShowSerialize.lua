-- Serializing
__showserialize_work = __showserialize_work or {
                ["nil"]        = function(vvalue) return "nil" end,
                ["number"]     = function(vvalue) return vvalue end,
                ["function"]   = function(vvalue) return "<< FUNCTION >>" end,
                ["string"]     = function(vvalue) return "\""..safestring(vvalue).."\"" end,
                ["boolean"]    = function(vvalue) return ({[true]="true",[false]="false"})[vvalue] end,
                ["table"]      = function(vvalue)
                                 local titype
                                 local tindex = {
                                                   ["number"]     = function(v) return v end,
                                                   ["boolean"]    = function(v) return ({[true]="true",[false]="false"})[v] end,
                                                   ["string"]     = function(v) return "\""..safestring(v).."\"" end
                                 }
                                 local wrongindex = function() Sys.Error("Type "..titype.." can not be used as a table index in serializing") end
                                 local ret = "{"
                                 local k,v
                                 local result
                                 local notfirst
                                 for k,v in pairs(vvalue) do
                                     if notfirst then ret = ret .. ",\n" else notfirst=true ret = ret .."\n" end
                                     titype = type(k)
                                     result = (tindex[titype] or wrongindex)(k)
                                     -- print(titype.."/"..k)
                                     ret = ret .. TRUE_showserialize("["..result.."]",v,(tabs or 0)+1,true)                                      
                                     end
                                 --if notfirst then    
                                 --  ret = ret .."\n"    
                                 --  for i=1,tabs or 0 do ret = ret .."     " end   
                                 --  for i=1,len(vname.." = ") do ret = ret .. " " end
                                 --  end 
                                 ret = ret .. "}"  
                                 return ret  
                                 end 
                                   
             }    
function TRUE_showserialize(vname,vvalue,tabs,noenter)
local ret = ""
--local work = __showserialize_work   
--[[
if type(vvalue=='string') then                   
  Console.Write('showserialize("'..vname..'","'..vvalue..'",'..(tabs or 0)..')')
elseif type(vvalue=='number' then
    Console.Write('showserialize("'..vname..'",'..vvalue..','..(tabs or 0)..')')
else
  Console.Write('showserialize("'..vname..'",<'..type(vvalue)..'>,'..(tabs or 0)..')')
endif 
]]  
local letsgo = __showserialize_work[type(vvalue)] or function(vvalue) Sys.Error("Unknown type. Cannot showserialize","Variable,"..vname..";Type Value,"..type(vvalue)) end
local i
for i=1,tabs or 0 do ret = ret .."       " end
ret = ret .. vname .." = "..letsgo(vvalue) 
if not noenter then ret = ret .."\n" end
return ret
end


function showserialize(vname,variableitself)
local ret = ""
local v = variableitself or _G[vname]
GALE_Assert(type(vname)=='string',"First variable must be the name to return in the showserializer string")
ret = TRUE_showserialize(vname,v)
JBCSYSTEM.Returner(ret)
return ret
end