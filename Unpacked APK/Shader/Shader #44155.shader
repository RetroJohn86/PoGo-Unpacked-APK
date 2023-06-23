//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "white" { }
_UVOffset ("UV Tiling / Offset", Vector) = (1,1,0,0)
_Color ("Tint", Color) = (1,1,1,1)
_PanningSpeed ("Panning Speed", Float) = 0
_PanningDirection ("Pan Direction (XY only)", Vector) = (0,0,0,0)
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
  GpuProgramID 49967
}
}
}