//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_RampTex ("Ramp", 2D) = "white" { }
_MaskTex ("Mask", 2D) = "white" { }
_TintColorOne ("Red Channel Tint", Color) = (0.5,0.5,0.5,0.5)
_TintColorTwo ("Green Channel Tint", Color) = (0.5,0.5,0.5,0.5)
_TintColorThree ("Blue Channel Tint", Color) = (0.5,0.5,0.5,0.5)
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 8258
}
}
}