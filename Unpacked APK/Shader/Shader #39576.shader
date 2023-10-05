//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Color ("Main Tint", Color) = (1,1,1,1)
[Header(Fade Properties)] _Scroll ("Scroll", Float) = 0
_ScrollStart ("Scroll Start", Float) = 2
_ScrollScale ("Scroll Scale", Float) = 4
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 31038
}
}
}