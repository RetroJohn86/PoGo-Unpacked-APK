//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CrTestShader/UBER_ALPHA_OFFSET" {
Properties {
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_Ramp2D ("BRDF Ramp", 2D) = "grey" { }
[Toggle(NIANTIC_MATERIAL_B)] _MaterialB ("Material Block B", Float) = 0
[Toggle(NIANTIC_UV_ANIMATE)] _UVAnimated ("Face UV Animation", Float) = 0
[Toggle(NIANTIC_FX_MATCAP)] _IsMatCapUV ("Is MatCap (glass)", Float) = 0
_FaceTex ("Face Texture", 2D) = "clear" { }
_MatCap2D ("MatCap Texture", 2D) = "clear" { }
_AnimInput_MatCap ("AnimInput_MatCap", Range(0, 1)) = 0
_cMatCap_Tint ("MatCap_Tint (.a = additive boost)", Color) = (1,1,1,0)
_MatCap_Inverse ("MatCap_Inverse", Range(0, 1)) = 0
_MatCap_Inverse_Alpha ("MatCap_Inverse_Alpha", Range(0, 1)) = 0
_Amount_Blend ("BRDF Amount", Range(0, 2)) = 1
_Amount_Wrap ("Lambert Wrap", Range(0, 1)) = 0
_cDiff ("Diffuse", Color) = (1,1,1,0.5)
_DiffuseIntensity_A ("_DiffuseIntensity_A", Range(0, 1)) = 1
_DiffuseIntensity_B ("_DiffuseIntensity_B", Range(0, 1)) = 1
_cAmbn ("Ambient", Color) = (0,0,0,0.5)
_cKeyf ("Specular (.a=0.5)", Color) = (1,1,1,0.5)
_cRimt ("RimTop   (.a=0.5)", Color) = (1,1,0,0.5)
_cRimb ("RimBottom(.a=0.5)", Color) = (0.5,0.5,0.5,0.5)
_Amount_RimLt ("RimLight Mult", Range(0, 2)) = 1
[Space] [Header(AO_MODE______________________________)] [Space] [KeywordEnum(DEFAULT, HUE)] AO_MODE ("Toggle AO_MODE", Float) = 0
_vAmOc ("vAmbOcclusion", Color) = (0,0,0,1)
_vAmOcPower ("vAmbOcclusion Power", Range(0.1, 10)) = 1
_vAmTxPower ("vAmbTexture Power", Range(1, 10)) = 5
[KeywordEnum(NONE, VERTEX)] BRB_SPECULAR ("Toggle for Specular", Float) = 0
_EyeSpec ("Specular", Range(0, 1)) = 1
_EyeGloss ("Glossiness", Range(0.025, 100)) = 0.95
[Space] [Header(STENCIL_ID_SORTING___________________)] [Space] [Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Compare", Float) = 0
[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp ("Stencil Operation", Float) = 0
_Stencil ("Stencil ID", Float) = 0
[Header(ANIM_UV_A___________________________)] [Space] _uv0 ("_uv0_A", Vector) = (0,0,4,0)
_uv1 ("_uv1_A", Vector) = (0,0,4,2)
_uv2 ("_uv2_A", Vector) = (0,0,4,2)
[Header(ANIM_UV_B___________________________)] [Space] _uv0_B ("_uv0_B", Vector) = (0,0,4,0)
_uv1_B ("_uv1_B", Vector) = (0,0,4,2)
_uv2_B ("_uv2_B", Vector) = (0,0,4,2)
[Header(SORTING_AND_CULLING)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Culling", Float) = 2
[Toggle] _ZWrite ("Z Write", Float) = 0
[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("Z Test", Float) = 4
[Toggle(NIANTIC_FX_ALPHA_VERTEX)] _IsAlphaVertex ("Use VertexColor(Red) for Alpha", Float) = 0
[Toggle(NIANTIC_TEXTURE_ALPHA)] _IsTextureAlpha ("Use Texture Alpha : 1) face 2) maintex", Float) = 0
_Alpha_Intensity ("_Alpha_Intensity", Range(0, 10)) = 1
_Alpha_Min ("_Alpha_Min", Range(0, 1)) = 0
_Alpha_Max ("_Alpha_Max", Range(0, 1)) = 1
_Alpha_Pow ("_Alpha_Pow", Range(1, 8)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZTest Off
  ZWrite Off
  Cull Off
  Offset -1, -1
  Stencil {
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 38821
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    vs_TEXCOORD6.w = exp2(u_xlat0.x);
    vs_TEXCOORD6.xyz = unity_FogColor.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat10_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat10_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat10_2.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat10_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat10_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "BRB_CHAR_FX" "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _cKeyf.w + _cKeyf.w;
    u_xlat16_4.x = _cRimt.w + _cRimt.w;
    u_xlat16_1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cKeyf.xyz;
    u_xlat16_1.xyz = u_xlat16_2.zzz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat16_1.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _cRimb.xyz;
    u_xlat16_1.xyz = u_xlat16_2.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + _cAmbn.xyz;
    u_xlat16_12 = _cRimb.w + _cRimb.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_12) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_1.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Amount_Blend);
    u_xlat16_1.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = (-u_xlat16_2.xyz) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_12 = log2(vs_TEXCOORD5);
    u_xlat16_12 = u_xlat16_12 * _vAmOcPower;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_0.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_0.x = log2(_Alpha_Intensity);
    u_xlat16_0.x = u_xlat16_0.x * _Alpha_Pow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, _Alpha_Min);
    SV_Target0.w = min(u_xlat16_0.x, _Alpha_Max);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Ramp2D;
varying mediump float vs_TEXCOORD5;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat10_3 = texture2D(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat10_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat10_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat10_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat10_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "DIRECTIONAL" "NIANTIC_TEXTURE_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
uniform 	mediump vec4 _CharacterColor;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
mediump float u_xlat16_7;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.x = min(max(vs_TEXCOORD3.x, 0.0), 1.0);
#else
    vs_TEXCOORD3.x = clamp(vs_TEXCOORD3.x, 0.0, 1.0);
#endif
    u_xlat16_3 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat1;
    u_xlat1 = u_xlat1 * in_NORMAL0.yyyy;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * in_NORMAL0.zzzz + u_xlat1;
    u_xlat9 = dot(u_xlat1, u_xlat1);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.xy;
    u_xlat16_7 = u_xlat16_3 * 0.5 + 0.5;
    u_xlat1.x = u_xlat16_7 * 0.949999988;
    vs_TEXCOORD3.y = u_xlat1.x;
    u_xlat1.x = (-_Amount_Wrap) + 1.0;
    u_xlat1.x = u_xlat16_3 * _Amount_Wrap + u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.x;
    vs_TEXCOORD4.yzw = in_COLOR0.xyz;
    vs_TEXCOORD5 = in_COLOR0.w;
    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].z * u_xlat0.x + u_xlat4;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[3].z * u_xlat0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(1.0);
    u_xlat0.z = float(1.0);
    u_xlat0 = u_xlat0 * _CharacterColor;
    vs_TEXCOORD6 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Alpha_Intensity;
uniform 	mediump float _Alpha_Min;
uniform 	mediump float _Alpha_Max;
uniform 	mediump float _Alpha_Pow;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump float _DiffuseIntensity_A;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp2D;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_19) + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _vAmTxPower;
    u_xlat16_1.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_2.xyz = vec3(u_xlat16_19) + (-_vAmOc.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + _vAmOc.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_1.xyz = _vAmOc.www * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    u_xlat16_19 = _cKeyf.w + _cKeyf.w;
    u_xlat16_2.x = _cRimt.w + _cRimt.w;
    u_xlat16_8.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _cRimt.xyz;
    u_xlat16_3 = texture(_Ramp2D, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat16_4.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cKeyf.xyz;
    u_xlat16_4.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _cRimb.xyz;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _cDiff.xyz * vec3(vec3(_DiffuseIntensity_A, _DiffuseIntensity_A, _DiffuseIntensity_A)) + (-_cAmbn.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yyy * u_xlat16_5.xyz + _cAmbn.xyz;
    u_xlat16_19 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Amount_Blend);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_TEXCOORD4.xxx + (-u_xlat16_1.xyz);
    u_xlat16_19 = log2(vs_TEXCOORD5);
    u_xlat16_19 = u_xlat16_19 * _vAmOcPower;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-vs_TEXCOORD6.xyz);
    SV_Target0.xyz = vs_TEXCOORD6.www * u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.x = log2(_Alpha_Intensity);
    u_xlat16_1.x = u_xlat16_1.x * _Alpha_Pow;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_1.x, _Alpha_Min);
    u_xlat16_1.x = min(u_xlat16_1.x, _Alpha_Max);
    SV_Target0.w = u_xlat16_0.w * u_xlat16_1.x;
    return;
}

#endif
"
}
}
}
}
CustomEditor "PokemonShaderGui"
}