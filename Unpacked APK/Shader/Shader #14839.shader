//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
[Toggle(ANIMATE_SELF)] _AnimateSelf ("Animate Self", Float) = 1
_AnimationProgress ("Animation Progress", Float) = 0
[Space] _ScrollSpeed ("Scroll Speed", Float) = 1
_BandColor ("Band Color", Color) = (1,0,0,1)
_BandNumber ("Band Number", Float) = 1
_BandPosition ("Band Gradient Position", Range(0, 1)) = 0
_BandFalloff ("Band Gradient Falloff", Range(0, 11)) = 0
_Boost ("Boost", Range(0, 1)) = 1
_BoostScalar ("Boost Scalar", Float) = 2
_centerGlowFalloff ("Center Glow Falloff", Range(0, 11)) = 1
}
SubShader {
 Pass {
  Tags { "IgnoreProjectors" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One One, One One
  ZWrite Off
  Cull Off
  GpuProgramID 33958
}
}
}