//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
[Header(Colors_____________)] [Space] _MainTex ("Albedo (RGB)", 2D) = "white" { }
_CracksTex ("Albedo (RGB)", 2D) = "white" { }
_AlphaTex ("Transparency", 2D) = "white" { }
_ColorIntensity ("Color Intensity", Float) = 0.5
[Space] [Header(Grid_____________)] [Space] _GridTex ("Albedo (RGB)", 2D) = "white" { }
_Intensity ("Intensity", Float) = 0.5
[Space] [Header(FX_____________)] [Space] _cOverride ("Color override (rgb = color, a = blend)", Color) = (1,1,1,0)
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 23215
}
}
}