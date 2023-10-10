//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_EdgeWidth ("Edge Width", Float) = 0.05
_EdgeFeather ("Edge Feather", Float) = 0.05
_EdgeColor ("Edge Color", Color) = (0.7,0.7,0.7,1)
_TopLeftColor ("Top Left Color", Color) = (0.2,0.83,0.2,1)
_TopRightColor ("Top Right Color", Color) = (0.2,0.83,0.2,1)
_BottomLeftColor ("Bottom Left Color", Color) = (1,1,1,1)
_BottomRightColor ("Bottom Right Color", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
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
  GpuProgramID 60115
}
}
}