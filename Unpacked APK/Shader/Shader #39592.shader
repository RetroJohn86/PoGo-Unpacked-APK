//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" }
  ZWrite Off
  Cull Off
  GpuProgramID 32539
}
}
}