return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "v0.15.0-5-g7b56b9c",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 8,
  height = 6,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "tileset.png",
      imagewidth = 224,
      imageheight = 224,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 49,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Calque de Tile 1",
      x = 0,
      y = 0,
      width = 8,
      height = 6,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        45, 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
        0 , 45, 45, 45, 45, 45, 45, 45,
        0 , 45, 45, 45, 0 , 45, 45, 45,
        0 , 45, 45, 0 , 45, 45, 45, 45,
        0 , 45, 45, 45, 45, 45, 45, 45,
        0 , 0 , 0 , 45, 0 , 0 , 0 , 0
      }
    }
  }
}
