//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TintColor ("Tint", Color) = (1,1,1,1)
_AddColor ("Additive", Color) = (0,0,0,0)
_SunsetColor ("Sunset Tint", Color) = (1,1,1,1)
_GroundUvDivider ("Ground UV Divider", Float) = 0.58
_GroundTint ("Ground Tint", Color) = (1,1,1,1)
_VertGroundTint ("Vertex Ground Tint", Color) = (1,1,1,1)
_GroundTintGradationPower ("Ground Tint Gradation Power", Float) = 1
_Saturation ("Saturation", Range(0, 1)) = 1
_SunsetTransitionAngle ("Sunset Transition Start Angle", Range(0, 90)) = 1
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Geometry+1" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 63072
}
}
}