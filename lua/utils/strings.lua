local ustr = {}

function ustr.StartsWith(str, start)
   return str:sub(1, #start) == start
end

return ustr
