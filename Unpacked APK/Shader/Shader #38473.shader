//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_FrameMaskTex ("Frame Texture Mask", 2D) = "white" { }
_HeaderColor ("Header Color", Color) = (1,1,1,1)
_HeaderOpacity ("Header Opacity", Range(0, 1)) = 1
_LightGradientAngleX ("Light Gradient Angle x", Float) = 0
_LightGradientAngleY ("Light Gradient Angle y", Float) = 0
_DarkGradientAngleX ("Dark Gradient Angle x", Float) = 0
_DarkGradientAngleY ("Dark Gradient Angle y", Float) = 0
_BlurOffsets ("Texel Blur Offsets", Vector) = (0.0035,0.0035,0.0035,0.0035)
_Kernel ("Kernel Blur", Float) = 0.15
_BlurOutlineColor ("Blur Color", Color) = (1,1,1,1)
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
  GpuProgramID 37613
}
}
}