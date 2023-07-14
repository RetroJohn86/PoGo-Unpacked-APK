//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
_OutlineColor ("Outline Color", Color) = (1,1,1,1)
_GradientColor1 ("Gradient Color 1", Color) = (1,1,1,1)
_GradientColor2 ("Gradient Color 2", Color) = (1,1,1,1)
_GradientScale ("Gradient Scale", Float) = 2
_GradientOffset ("Gradient Offset", Float) = 0.5
_ShadowColor ("Shadow Color", Color) = (1,1,1,1)
_ShadowDistance ("Shadow Distance", Float) = 0.01
_InnerThreshold ("Inner Threshold", Float) = 0.59
_CenterThreshold ("Center Threshold", Float) = 0.5
_OuterThreshold ("Outer Threshold", Float) = 0.3
_StripeColor ("Stripe Color", Color) = (1,1,1,1)
_StripeOffset ("Stripe Offset", Float) = 0
_StripeWidth ("Stripe Width", Float) = 0.5
_Blur ("Blur", Range(0.001, 1)) = 0
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
  GpuProgramID 18769
}
}
}