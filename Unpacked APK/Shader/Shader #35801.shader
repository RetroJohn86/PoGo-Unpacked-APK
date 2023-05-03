//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB)", 2D) = "clear" { }
_Color ("Tint", Color) = (1,1,1,1)
_CenterColor ("Center Color", Color) = (1,1,1,1)
_IconTint ("Icon Color", Color) = (1,0,0,1)
_BarFillColor ("Bar Fill Color", Color) = (0.5,0,1,1)
_BarBaseColor ("Bar Base Color", Color) = (0,0,0,1)
_Progress ("Progress", Range(0, 1)) = 0.2
_Width ("Outline Width", Range(0, 1)) = 0.2
_Radius ("Outer Radius", Range(0, 1)) = 1
_TexScale ("Texture Scale", Float) = 1
[Toggle] _Clockwise ("Clockwise Fill", Float) = 1
[Toggle] _BottomFill ("Fill From Bottom", Float) = 1
[Space] _StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
}
SubShader {
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
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
  GpuProgramID 9607
}
}
}