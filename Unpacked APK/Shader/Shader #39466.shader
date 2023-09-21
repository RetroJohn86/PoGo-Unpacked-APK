//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Luminance Map (RGB) Color (A) Opacity", 2D) = "white" { }
_RampTex ("Palette Map", 2D) = "white" { }
_MaskTex ("Palette Map Mask (RGB) - 1 to apply palette, 0 to not", 2D) = "white" { }
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 22532
}
}
}