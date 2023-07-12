//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_POITex ("POI Photo Texture", 2D) = "white" { }
_POIAdditive ("POI Additive Texture", 2D) = "black" { }
_AvatarTex ("Avatar Photo Texture", 2D) = "white" { }
_AvatarLerp ("Avatar Photo Lerp", Range(0, 1)) = 0
_AvatarOffset ("Avatar Photo Offset and Scale", Vector) = (0,0,1,1)
_AvatarOffsetNoiseSpeed ("Avatar Photo Offset Noise Speed", Float) = 0.1
_AvatarOffsetNoiseScale ("Avatar Photo Offset Noise Scale", Float) = 0.2
_AvatarMask ("Avatar Photo Mask", 2D) = "white" { }
_WarpTex ("Warp Texture", 2D) = "bump" { }
_WarpStrength ("Warp Strength", Float) = 1
_WarpSpeedX ("Warp X Pan Speed", Float) = 0
_WarpSpeedY ("Warp Y Pan Speed", Float) = 0
}
SubShader {
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 20800
}
}
}