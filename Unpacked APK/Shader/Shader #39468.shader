//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_DissolveAmount ("Dissolve Amount", Range(-0.1, 1)) = 0
_Color ("Color", Color) = (0,0,0,0)
_RimColor ("Rim Color", Color) = (0,0,0,0)
_RimWidth ("Rim Width", Float) = 0
_RimPower ("Rim Power", Float) = 0
_WaveSpeed ("Wave Speed", Float) = 0
_WaveWidth ("Wave Width", Float) = 0
_HexColor ("Hex Color", Color) = (0,0,0,0)
_HexBrightnessStart ("Hex Brightness Start", Float) = 0
_HexBrightnessEnd ("Hex Brightness End", Float) = 0
_OutlineColor ("Outline Color", Color) = (1,1,1,1)
_OutlineWaveWidth ("Outline Wave Width", Float) = 0
_OutlineSpeed ("Outline Speed", Float) = 0
_NormalTex ("Normal Texture", 2D) = "white" { }
_LightVector ("Light Vector", Vector) = (0,0,0,1)
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 44413
}
}
}