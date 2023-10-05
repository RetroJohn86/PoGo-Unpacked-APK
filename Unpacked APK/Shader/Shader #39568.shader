//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
[Header(Main Icon Properties)] [Spacing(10)] _MainTex ("Icon Base", 2D) = "clear" { }
_Color ("Tint Color", Color) = (1,1,1,1)
_ProgressColor ("Progress Filled Color", Color) = (1,1,1,1)
_UnfilledColor ("Progress Empty Color", Color) = (0.2,0.2,0.2,1)
[Header(Scrolling Gradient Properties)] [Spacing(10)] _Gradient ("Gradient Texture", 2D) = "white" { }
_GradScale ("Gradient UV Scale", Vector) = (1,1,1,1)
_GradColor ("Gradient Tint", Color) = (1,1,1,1)
_HSpeed ("Horizontal Speed", Float) = 1
_VSpeed ("Vertical Speed", Float) = 1
[Header(Wave Properties)] [Spacing(10)] _Period ("Phase Period", Float) = 1
_Frequency ("Phase Frequency (Speed)", Float) = 1
_MaxAmp ("Max Amplitude", Range(0, 1.99)) = 1
_MinAmp ("Minimum Noise Power", Range(0.001, 1)) = 0.1
_Power ("Wave Shape Power", Float) = 10
[Header(Progress Bar Properties)] [Spacing(10)] _Progress ("Progress", Range(0, 1)) = 0.2
_StartPad ("Start Padding", Range(-1, 1)) = 0
_EndPad ("End Padding", Range(-1, 1)) = 0
[Toggle(TOP_FILL)] _TopFill ("Fill From Top", Float) = 0
[Space] _StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
[Toggle(USE_GRADIENT)] _UseGradient ("Use Gradient", Float) = 0
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
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
  GpuProgramID 21722
}
}
}