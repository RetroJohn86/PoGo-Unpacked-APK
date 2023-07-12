//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Particle Texture", 2D) = "white" { }
_Overdrive ("Overdrive", Float) = 4
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend DstColor SrcColor, DstColor SrcColor
  ZWrite Off
  Cull Off
  GpuProgramID 15630
}
}
}