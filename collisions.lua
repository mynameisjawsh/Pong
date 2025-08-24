function checkCeiling(a, b)
  if a.y < b.y then
    return true
  else
    return false
  end
end


function checkFloor(a, b)
  if a.y + a.height > b.height then
    return true
  else
    return false
  end
end
