//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_GradientColor ("Gradient Color", Color) = (1,1,1,1)
_Cols ("Cols Count", Float) = 1
_Rows ("Rows Count", Float) = 1
_Frame ("Per Frame Length", Float) = 0.5
_BouncingSpeed ("Bouncing Speed", Float) = 1
_BouncingHeight ("Bouncing Height", Float) = 1
_GradientLevel ("Gradient Level", Float) = 0
_GradientFadeOpacity ("Gradient Fade Opacity", Range(0, 1)) = 0.5
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 5743
}
}
}