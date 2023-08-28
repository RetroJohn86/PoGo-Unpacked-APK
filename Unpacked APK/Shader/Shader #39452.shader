//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
[Header(ANIMATED HOTSPOT)] _HotspotColor ("Hotspot Color", Color) = (1,1,1,1)
_HotspotRadius ("Hotspot Radius", Range(0, 1)) = 0.1
_HotspotBloom ("Hotspot Bloom", Float) = 0.2
[Header(BAR COLORS)] _Background_Color ("Background Color (.a = alpha)", Color) = (0,0,0,0.25)
_Fill_Color ("Fill Color", Color) = (1,0.7,0,1)
[Header(GENERAL SETTINGS)] _OverallRadiusScalar ("Main Radius Scalar", Range(0, 1)) = 1
_BaseSpace ("Base Space", Range(0, 1)) = 0.2
[Header(Bar1  X.Radius(0TO1)  Y.Width(0TO1)  Z.SpacerSize)] _B1_DataRWS ("Bar 1 Layout", Vector) = (1,0.25,0.1,0)
[IntRange] _B1_Spacers ("Bar 1 Segments", Range(1, 100)) = 3
[Space] _B1_Background_Progress ("Bar Size", Range(0, 1)) = 0.75
_B1_Fill_Progress ("Fill Progress", Range(0, 1)) = 0.05
_B1_Overlay_Progress ("Overlay Progress", Range(0, 1)) = 0.25
[Header(Bar2  X.Radius(0TO1)  Y.Width(0TO1)  Z.SpacerSize)] _B2_DataRWS ("Bar 2 Layout", Vector) = (0.8,0.2,0.04,0)
[IntRange] _B2_Spacers ("Bar 2 Segments", Range(1, 500)) = 50
[Space] _B2_Fill_Progress ("Fill Progress", Range(0, 1)) = 0.8
_B2_Overlay_Progress ("Overlay Progress", Range(0, 1)) = 0.75
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilReadMask ("Stencil Read Mask", Float) = 255
_StencilWriteMask ("Stencil Write Mask", Float) = 255
}
SubShader {
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 25456
}
}
}