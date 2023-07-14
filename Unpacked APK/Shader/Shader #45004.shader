//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_SDFTex ("SDFTex", 2D) = "white" { }
_SDFChannels ("SDF Channel Use", Vector) = (1,1,1,1)
_CrackTex ("Crack Text", 2D) = "White" { }
_PrimaryColor ("Primary Color", Color) = (0.38,0.38,0.41,1)
_SecondaryColor ("Secondary Color", Color) = (0.54,0.47,0.67,1)
_OutlineColor ("Outline Color", Color) = (0.59,0.49,0.79,1)
_ClippingValue ("Clipping Value", Range(0, 1)) = 0.5
_OutlineDistance ("Outline Distance", Range(0, 0.3)) = 0
_EdgeFalloff ("Edge Softness", Range(1, 11)) = 7.7
_ShadowColor ("Shadow Color", Color) = (0,0,0,1)
_ShadowPosition ("Shadow Position", Range(0, 1)) = 0
_ShadowFalloff ("Shadow Falloff", Range(1, 11)) = 2
_HotspotPosition ("Hotspot Position", Range(0, 1)) = 0
_HotspotFalloff ("Hotspot Falloff", Range(1, 11)) = 1
_HotspotAmount ("Hotspot Amount", Range(0, 1)) = 1
_CrackColor ("Crack Color", Color) = (0.5,0.5,0.5,1)
_CrackClip ("Crack Clip", Range(0, 1)) = 0.5
_CrackFalloff ("Crack Softness", Range(1, 11)) = 7.7
_CrackProgress ("Crack Progress", Range(0, 3)) = 0
_CrackGlowFalloff ("Crack Glow Falloff", Range(0, 11)) = 5
_CrackGlowColor ("Crack Glow Color", Color) = (0,0,0,1)
_CrackGlowBalance ("Crack Glow Balance", Range(0, 1)) = 0
_CrackGlowScalar ("Crack Glow Scalar", Range(0, 5)) = 1
_ScrollScalar ("Glow Speed Scalar", Range(0, 1)) = 0.2
_Ramp2D ("BRDF Ramp", 2D) = "grey" { }
_cAmbn ("Ambient", Color) = (0,0,0,0.5)
_cKey ("Key (.a=0.5)", Color) = (1,1,1,0.5)
_cRimt ("RimTop   (.a=0.5)", Color) = (1,1,0,0.5)
_cRimb ("RimBottom(.a=0.5)", Color) = (0,0,1,0.5)
_Amount_RimLt ("RimLight Mult", Range(0, 2)) = 0.3
}
SubShader {
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 26571
}
}
}