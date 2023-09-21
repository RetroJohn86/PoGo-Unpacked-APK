//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_Color ("Tint Color", Color) = (1,1,1,1)
_CircleSize ("Circle Size", Range(0, 1)) = 0.2
_CircleColor ("Circle Color", Color) = (0,0,0,1)
_LineWidth ("Line Width", Range(0, 1)) = 0.2
_LineLength ("Line Length", Range(0, 1)) = 0.5
_LineColor ("Line Color", Color) = (1,1,1,1)
_MaxNumber ("Maximum Indicator number", Float) = 4
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
  GpuProgramID 56681
}
}
}