//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_Color ("Background Color", Color) = (1,1,1,1)
_MainTex ("Main Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 20623
}
}
}