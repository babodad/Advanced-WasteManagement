AWM = {}
AWM.EverythingBurns = settings.startup["AWM-EverythingBurns"].value

require("prototypes.entity")
require("prototypes.item")
require("prototypes.recipe")
require("prototypes.technology")

data:extend(
{
  {
    type = "fuel-category",
    name = "incineration"
  }
})
