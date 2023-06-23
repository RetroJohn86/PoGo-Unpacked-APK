//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_MainColor ("Main Color", Color) = (1,1,1,1)
_ProgressColor ("Progress Color", Color) = (1,0,0,1)
_Progress ("Progress", Range(0, 1)) = 0.2
_DividerColor ("Divider Color", Color) = (0.5,0.5,0.5,1)
_Divisions ("Radial Divisions", Float) = 3
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineWidth ("Outline Width", Range(0, 1)) = 0.2
[Space] _Radius ("Circle Radius", Range(0, 1)) = 1
_DivisionThickness ("Division Thickness", Range(0, 1)) = 0.1
_OutlineAmount ("Master Outline Visibility", Range(0, 1)) = 1
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
  GpuProgramID 50790
}
}
}