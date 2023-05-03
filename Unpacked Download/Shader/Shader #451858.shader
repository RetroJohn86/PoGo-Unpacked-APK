//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_matcapTex ("Matcap Texture", 2D) = "white" { }
_maskTex ("Mask Texture", 2D) = "white" { }
_IceColor ("Ice Color", Color) = (0.647167,0.8340114,0.9264706,1)
_HairColor ("Hair Color", Color) = (0.2760597,0.4809316,0.8161765,1)
_Boundary ("Boundary between Ice and Hair", Range(0, 1)) = 0.6
_lineDensity ("Hair Line Density", Range(0, 1)) = 0.5
[Space] [Header(LIGHTING_PARAMETER___________________________)] [Space] _shadeColor ("Shade Color", Color) = (0.6393718,0.6237024,0.7573529,1)
_rimColor ("Matcap Color", Color) = (0.365917,0.5091159,0.5294118,1)
_AOColor ("AO Color", Color) = (0.5,0.5,0.5,1)
_AOPower ("AO Power", Range(0.01, 5)) = 1
_innerShadeMultiply ("Brightness of Shade on Hair(multiply)", Range(0, 2)) = 1
}
SubShader {
 Pass {
  Name "FORWARD"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 23241
}
}
}