//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_RibbonColorStart ("Ribbon Color Start", Color) = (1,1,1,1)
_RibbonColorEnd ("Ribbon Color End", Color) = (1,1,1,1)
_HighliteColor ("Highlite Color", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 21625
}
}
}