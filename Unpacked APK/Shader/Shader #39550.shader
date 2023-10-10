//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_Color ("Tint Color", Color) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
_RampTex ("Ramp", 2D) = "white" { }
_ScanFrequency ("Scan Line Frequency", Float) = 1
_ScanSpeed ("Scan Line Speed", Float) = 1
_ScanMin ("Scan Strength (Minimum)", Float) = 0.7
_ScanMax ("Scan Strength (Maximum)", Float) = 1.25
_ScanColor ("Scan Color", Color) = (0.2,0.2,0.2,0.7)
_RandomOffset ("Random Offset (set by code per instance)", Vector) = (0,0,0,0)
_FlickerOffsetTime ("Flicker Offset Time", Float) = 1
_FlickerSpeed ("Flicker Speed", Float) = 10
_PhaseSpeed ("Phase Speed", Float) = 0.03
_PhaseEndBias ("Phase End Bias", Float) = 4
_PhaseInBias ("Phase In Bias", Range(0, 1)) = 0.5
_UseRampTex ("Use Ramp Tex", Float) = 0
}
SubShader {
 Pass {
  Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 11461
}
}
}