//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_NoiseTex ("Noise (RGB)", 2D) = "white" { }
_RampTex ("Ramp (RGB)", 2D) = "white" { }
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_Color ("Color", Color) = (1,1,1,1)
_TintColor ("Tint Color", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
  ColorMask RGB 0
  Cull Off
  GpuProgramID 41299
}
}
}