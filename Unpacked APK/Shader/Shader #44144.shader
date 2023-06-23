//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Color ("Main Color", Color) = (0,0,1,1)
_OffsetWidth ("Offset Width", Range(0, 0.5)) = 0.3
_OutlineColor ("Outline Color", Color) = (1,1,1,1)
_OutlineWidth ("Outline Width", Range(-10, 10)) = 0.1
_LineLength ("Line Length", Float) = 1
_GlowLength ("Glow Length", Float) = 0.1
_GlowPosition ("Glow Position", Range(0, 1)) = 0.5
_GlowColor ("Glow Color", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 37316
}
}
}