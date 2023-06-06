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
_ScanFrequency ("Scan Line Frequency", Float) = 1.5
_ScanSpeed ("Scan Line Speed", Float) = 100
_ScanMin ("Scan Strength (Minimum)", Float) = 0.5
_ScanMax ("Scan Strength (Maximum)", Float) = 1
_ScanColor ("Scan Color", Color) = (0.29411766,0.6509804,0.7137255,0.3647059)
_RandomOffset ("Random Offset (set by code per instance)", Vector) = (1,2,1,0)
_FlickerOffsetTime ("Flicker Offset Time", Float) = 20
_FlickerSpeed ("Flicker Speed", Float) = 1
_PhaseSpeed ("Phase Speed", Float) = 1
_PhaseEndBias ("Phase End Bias", Float) = 1
_PhaseInBias ("Phase In Bias", Range(0, 1)) = 0.1
_UseRampTex ("Use Ramp Tex", Float) = 0
}
SubShader {
 Pass {
  Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  GpuProgramID 4773
}
}
}