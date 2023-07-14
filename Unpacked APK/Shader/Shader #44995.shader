//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_ColorA ("Color A", Color) = (1,1,1,1)
_ColorB ("Color B", Color) = (1,1,1,1)
_GradientScale ("Gradient Scale", Float) = 2
_Radius ("Outer Radius", Float) = 1
_Thickness ("Thickneses", Float) = 0.1
_ScanlineFrequency ("Scanline Frequency", Float) = 1000
_ScanlineIntensity ("Scanline Intensity", Float) = 0.4
_ScanlineGlowFrequency ("Scanline Glow Frequency", Float) = 5
_ScanlineGlowSpeed ("Scanline Glow Speed", Float) = 5
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
}
SubShader {
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 40081
}
}
}