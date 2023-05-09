//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_ShadowColor ("Shadow Color", Color) = (0,0,0,0)
_LightVector ("Light Vector", Vector) = (0,-1,0,1)
_SpecIntensity ("Specular Intensity", Float) = 1
_SpecFalloff ("Specular Falloff", Float) = 1
_Transparency ("Transparency Multiplier", Float) = 0
}
SubShader {
 Pass {
  Tags { "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  GpuProgramID 55680
}
}
}