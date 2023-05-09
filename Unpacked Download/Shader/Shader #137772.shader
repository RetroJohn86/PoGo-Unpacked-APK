//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
[Header(Blend Mode)] [Spacing(10)] [Enum(UnityEngine.Rendering.BlendMode)] _Blend ("Blend Mode 1", Float) = 2
[Enum(UnityEngine.Rendering.BlendMode)] _Blend2 ("Blend Mode 2", Float) = 0
[Space] [Header(Main Texture)] [Spacing(10)] _MainTex ("Main Texture", 2D) = "white" { }
_MainScale ("Main Texture Scale", Vector) = (1,1,1,1)
_TintColor ("Tint Color", Color) = (1,1,1,1)
_PanSpeedX ("Warp X Pan Speed", Float) = 0
_PanSpeedY ("Warp Y Pan Speed", Float) = 0
[Space] [Header(Alpha Mask Texture)] [Spacing(10)] _AlphaTex ("Mask Texture", 2D) = "white" { }
_MaskScale ("Texture Scale", Vector) = (1,1,1,1)
[Space] [Header(Warp Distortion Texture)] [Spacing(10)] _WarpTex ("Warp Texture", 2D) = "bump" { }
_WarpStrength ("Warp Strength", Float) = 1
_WarpScale ("Warp Texture Scale", Vector) = (1,1,1,1)
[Space] [Header(Properties)] [Spacing(10)] _AddPower ("Additive Power", Float) = 1
_RotateSpeed ("Rotate Speed", Float) = 1
_PivotOffset ("Rotation Pivot Offset", Vector) = (0,0,0,1)
_ScaleUVAmount ("UV Scale Amount", Float) = 0
[Space] _Stencil ("Stencil ID", Float) = 0
[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Compare Function", Float) = 5
[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp ("Stencil Operation", Float) = 2
[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("Z Test", Float) = 4
[Toggle(SCREENSPACE_ON)] _ScreenSpaceOn ("Screenspace On", Float) = 0
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero Zero, Zero Zero
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Lighting On
  GpuProgramID 16055
}
}
}