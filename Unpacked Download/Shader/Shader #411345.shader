//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Albedo (RGB)", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_Mask ("Mask", 2D) = "white" { }
_Speed ("Speed", Range(0, 5)) = 1
_Frequency ("Frequency", Range(0, 1)) = 1
_Amplitude ("Amplitude", Range(0, 1)) = 0.1
}
SubShader {
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 34628
}
}
}