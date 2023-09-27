//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base Shape (RGB) Alpha (A)", 2D) = "white" { }
_ColorRamp ("Color Ramp", 2D) = "white" { }
_GlossTex ("Gloss Tex", 2D) = "white" { }
_LightPos ("Light Position", Vector) = (0,0.5,1,0)
_AlphaCutoff ("Alpha Cutoff", Float) = 0
_Amount_Wrap ("Lambert Wrap Amount", Range(0, 1)) = 0
_SpecularIntensity ("Specular Intensity", Range(0, 10)) = 0
_Dither ("Dither", Range(0, 2)) = 0
_DitherSize ("Dither Size", Range(0, 50)) = 0
_DitherStart ("Full Dither Distance", Float) = 10
_DitherEnd ("No Dither Distance", Float) = 3
[Header(Rim Light)] _Amount_RimLt ("RimLight Amount", Range(0, 0.5)) = 1
_RimLt_Strength ("RimLight Strength", Range(0, 1)) = 1
_RimLt_Color ("RimLight Color", Color) = (1,1,1,1)
[Header(Color Tinting)] _TintColor ("Tint", Color) = (1,1,1,1)
_TintStrength ("Tint Strength", Range(0, 1)) = 1
_AddColor ("Additive", Color) = (0,0,0,0)
_AddStrength ("Add Strength", Range(0, 1)) = 1
_Saturation ("Saturation", Range(0, 1)) = 1
[Header(Top Down Gradient)] _ColorTop ("Color Top", Color) = (0,0,0,0)
_ColorBottom ("Color Bottom", Color) = (0,0,0,0)
_ColorBottomLevel ("Color Bottom Level", Float) = 0
_ColorBottomMaskFade ("Color Bottom Mask Fade", Float) = 0
_ColorOverlayStrength ("Color Overlay Strength", Range(0, 1)) = 0
[Header(Translucency)] _LightColor ("Light Color", Color) = (1,1,1,0.5)
_TransScattering ("Translucency Scattering", Float) = 0
_TransDirect ("Translucency Direct", Range(0, 1)) = 0
_TransAmbient ("Translucency Ambient", Range(0, 1)) = 0
_Translucency ("Translucency", Range(0, 1)) = 0
[Header(Wind)] _WindNoiseTexture ("Wind Noise Texture", 2D) = "white" { }
_WindSpeed ("Wind Speed", Range(0, 1)) = 0.5
_WindIntensity ("Wind Intensity", Range(0, 2)) = 0.5
_WindDirection ("Wind Direction", Vector) = (1,0,1,1)
_WindYOffset ("Wind Y Offset", Float) = 0
_WindUV1 ("Leaf UV Wiggle Strength", Float) = 0
[Header(STENCIL_ID_TO_CONTROL_SORTING_SPECIAL_FX)] _Stencil ("Stencil ID", Float) = 0
[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Compare Function", Float) = 0
[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp ("Stencil Operation", Float) = 0
[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Culling", Float) = 2
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  Cull Off
  Stencil {
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 52251
}
}
}