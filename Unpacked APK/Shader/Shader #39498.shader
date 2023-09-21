//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Main Texture", 2D) = "white" { }
_Color ("Tint Color", Color) = (1,1,1,1)
_IconTex ("Icon Texture", 2D) = "white" { }
_ImageScale ("Scale Texture Down By", Float) = 3
_OffSetUV_X ("OffSet Image X", Float) = 0
_InnerCircle ("Radius Ring Inside", Float) = 0.5
_OuterCircle ("Radius Ring Outside", Float) = 0.65
_OutestCircle ("Background Radius", Float) = 0.75
_Feather ("Feather", Float) = 0.005
_Background ("Background Color", Color) = (1,1,1,1)
_RingBackground ("Ring Background Color", Color) = (0.2,0.2,0.2,1)
_ScoreColor0 ("Score Color 0", Color) = (0.5,0.667,0.667,1)
_ScoreColor1 ("Score Color 1", Color) = (1,0.2,0,1)
_ScoreColor2 ("Score Color 2", Color) = (1,1,0,1)
_ScoreColor3 ("Score Color 3", Color) = (0,1,0,1)
_ScoreColor4 ("Score Color 4", Color) = (0,1,1,1)
_ScoreColor5 ("Score Color 5", Color) = (0.5,0.2,0,1)
_ScoreColor6 ("Score Color 6", Color) = (0.5,0.5,0,1)
_ScoreColor7 ("Score Color 7", Color) = (0,0.5,0,1)
_ScoreColor8 ("Score Color 8", Color) = (0,0.5,0.5,1)
_Scores0 ("Departed Players Scores (accumulative)", Float) = 0
_Scores ("Scores (accumulative)", Vector) = (0.1,0.2,0.3,0.4)
_Scores1 ("Scores 1 (accumulative)", Vector) = (0.5,0.6,0.7,0.8)
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
  GpuProgramID 48039
}
}
}