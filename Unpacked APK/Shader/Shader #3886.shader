//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 6102
}
}
}