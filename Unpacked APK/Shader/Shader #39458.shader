//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 63269
}
}
}