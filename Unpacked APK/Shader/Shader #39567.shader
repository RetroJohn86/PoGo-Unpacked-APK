//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_DistortIntensity ("Distortion Intensity", Float) = 1
_DistortFrequency ("Distortion Frequency", Float) = 1
_Speed ("Speed", Float) = 1
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Stencil {
   Ref 2
   Comp Equal
   Pass IncrSat
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 27636
}
}
}