//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_PowerUpColor ("Power Up Color", Color) = (1,1,1,1)
_Progress ("Progress", Range(0, 1)) = 0.5
_Progress2 ("Progress2", Range(0, 1)) = 0.75
_Radius ("Radius", Range(0, 1)) = 0.975
_DotRadius ("Dot Radius", Range(0, 0.1)) = 0.012
_PowerUpDotRadius ("Power Up Dot Radius", Range(0, 0.1)) = 0.009
_Width ("Width", Range(0, 0.1)) = 0.01
_Width2 ("Width Power Up", Range(0, 0.1)) = 0.015
_InnerWidthPowerUp ("Inner Width Power Up", Range(0, 0.1)) = 0.01
_BaseAlpha ("Backgound Alpha", Range(0, 1)) = 0.4
_Feather ("Feather", Range(0, 0.01)) = 0.004
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
  GpuProgramID 34580
}
}
}