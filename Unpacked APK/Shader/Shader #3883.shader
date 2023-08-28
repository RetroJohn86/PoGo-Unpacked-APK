//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Particle Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero SrcColor, Zero SrcColor
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 9742
}
}
}