//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_ColorMask ("Color Mask", Float) = 15
_Height ("Height", Float) = 100
[Header(PROPERTIES)] _Color ("Tint", Color) = (1,1,1,1)
_Width ("Line Width", Range(0, 0.5)) = 0.2
_DotHeight ("Dot Height in Pixel", Float) = 30
_Ratio ("Dot Ratio", Range(0, 1)) = 0.3
_Feather ("Feather", Float) = 0.1
[Enum(UnityEngine.Rendering.CompareFunction)] unity_GUIZTestMode ("ZTest", Float) = 4
[Header(STENCIL PROPERTIES)] _Stencil ("Stencil ID [0;255]", Float) = 0
_ReadMask ("Stencil Read Mask [0;255]", Float) = 255
_WriteMask ("Stencil Write Mask [0;255]", Float) = 255
[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Comparison", Float) = 8
[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp ("Stencil Operation", Float) = 0
[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("Stencil Fail", Float) = 0
[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("Stencil ZFail", Float) = 0
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
  GpuProgramID 21425
}
}
}