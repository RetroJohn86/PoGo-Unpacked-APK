//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Rows ("Rows", Float) = 1
_BackgroundStart ("Background Start Distance", Float) = 1
_MidStart ("Mid Start Distance", Float) = 1
_MinFadeDistance ("Min FadeDistance", Float) = 1
_MaxFadeDistance ("Max FadeDistance", Float) = 1
_MinHeightFadeDistance ("Min Height FadeDistance", Float) = 1
_MaxHeightFadeDistance ("Max Height FadeDistance", Float) = 1
_FarHeightAdjustFactor ("Far Height Adjust Factor (0-1)", Float) = 1
_FogGradientSharpness ("Fog Gradient Sharpness", Float) = 0
_FogHeight ("Fog Height", Float) = 0
_LandformColor1 ("Landform Color 1", Color) = (1,1,1,1)
_LandformColor2 ("Landform Color 2", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 20373
}
}
}