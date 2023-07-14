//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_Color ("Tint Color", Color) = (1,1,1,1)
_CurrentPageCircleSize ("Current Page Circle Size", Range(0, 1)) = 0.8
_OtherPageCircleSize ("Other Page Circle Size", Range(0, 1)) = 0.2
_CurrentPageCircleColor ("Current Page Circle Color", Color) = (1,1,1,1)
_OtherPageCircleColor ("Other Page Circle Color", Color) = (1,1,1,1)
_CurrentIndicatorIndex ("Current Indicator Index", Float) = 0
_MaxIndicator ("Maximum Indicator number", Float) = 5
_Antialias ("Antialias Strength", Float) = 0.04
_MainTex ("Texture", 2D) = "white" { }
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Always
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
  GpuProgramID 54219
}
}
}