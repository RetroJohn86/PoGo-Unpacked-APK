//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_Color ("Color", Color) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 8259
}
}
}