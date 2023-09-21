//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_RampColor1 ("Ramp 1", Color) = (1,1,1,1)
_RampColor2 ("Ramp 2", Color) = (1,1,1,1)
_RampColor3 ("Ramp 3", Color) = (1,1,1,1)
_RampColor4 ("Ramp 4", Color) = (1,1,1,1)
_GlowColor ("Glow Color", Color) = (1,1,1,1)
_Stop1 ("Stop 1", Range(0, 1)) = 0
_Stop2 ("Stop 2", Range(0, 1)) = 0.3
_Stop3 ("Stop 3", Range(0, 1)) = 0.6
_Stop4 ("Stop 4", Range(0, 1)) = 1
_GlassColor ("Glass Mode", Float) = 0
_GlassTint ("Glass Tint", Range(0, 1)) = 1
_GlowIntensity ("Glow Intensity", Float) = 1
_GlowColorIntensity ("Glow Color Intensity", Float) = 0.5
_BrightnessCurve ("Brightness Curve", Float) = 0.15
_ColorMask ("Color Mask", Float) = 15
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
}
SubShader {
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
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
  GpuProgramID 12954
}
}
}