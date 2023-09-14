//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_GlowTex ("Glow Texture", 2D) = "black" { }
_TintColor ("Tint", Color) = (1,1,1,1)
_AddColor ("Additive", Color) = (0,0,0,0)
_SunsetColor ("Sunset Tint", Color) = (1,1,1,1)
_DayColor ("Day Color", Color) = (1,1,1,1)
_NightColor ("Night Color", Color) = (0,0,0,1)
_Saturation ("Saturation", Range(0, 1)) = 1
_SunsetTransitionAngle ("Sunset Transition Start Angle", Range(0, 90)) = 1
_TransitionAngle ("String Lights Transition Start Angle", Range(0, 90)) = 1
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Geometry" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 58349
}
}
}