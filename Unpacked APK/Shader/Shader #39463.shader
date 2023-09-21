//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Darken ("Darken", Range(0, 1)) = 0.4
_RimColor ("Rim Color", Color) = (1,1,1,1)
_RimWidth ("Rim Width", Float) = 40
_RimBias ("Rim Bias", Float) = 0.3
}
SubShader {
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 34749
}
}
}