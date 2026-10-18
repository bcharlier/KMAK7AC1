-- Les blocs `.correction` ne sont conservés que si params.correction est vrai.
local show = false

function Meta(meta)
  local p = meta.params
  if p and p.correction ~= nil then
    show = pandoc.utils.stringify(p.correction) == "true"
  end
end

function Div(el)
  if el.classes:includes("correction") and not show then
    return {}
  end
end

return {{ Meta = Meta }, { Div = Div }}
