//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
[Header(REFLECTION)] _ReflectTex ("Reflection Texture", 2D) = "white" { }
_ReflectStrength ("Reflection Strength", Range(0, 1)) = 0.5
_RefScale ("Reflection Scale", Range(0, 3)) = 1
[Header(PARALLAX)] _Parallax1 ("Parallax 1", Vector) = (1,1,2,2)
_Opacity ("Opacity", Range(0, 1)) = 1
_GradCenterWorld ("Gradient Center World Position", Vector) = (0,0,0,0)
_GradColorTop ("Top Gradient Color", Color) = (1,1,1,1)
_GradColorBottom ("Bottom Gradient Color", Color) = (0,0,0,1)
_GradScale ("Gradient Scale", Range(0.001, 1)) = 1
_GradVerticalOffset ("Gradient Offset", Range(-100, 100)) = 1
_SideBrightness ("Side Brightness", Range(0, 1)) = 0.5
_NoiseBrightness ("Noise Brightness", Range(0, 10)) = 1
_NoiseSpeed ("Noise Speed", Vector) = (1,1,0,0)
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 4000
}
}
}