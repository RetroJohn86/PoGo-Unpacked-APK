//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Niantic/Pokemon/FX/Opaque/PokemonGlass" {
Properties {
_Color ("Color", Color) = (1,1,1,1)
_Ramp2D ("BRDF Ramp", 2D) = "grey" { }
[Toggle(NIANTIC_MAIN_TEXTURE)] _IsMainTexture ("Is MainTexture", Float) = 0
[Toggle(NIANTIC_FX_MATCAP)] _IsMatCapUV ("Is MatCap (glass)", Float) = 0
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_MatCap2D ("MatCap Texture", 2D) = "clear" { }
_AnimInput_MatCap ("AnimInput_MatCap", Range(0, 1)) = 0
_cMatCap_Tint ("MatCap_Tint (.a = additive boost)", Color) = (1,1,1,0)
_MatCap_Inverse ("MatCap_Inverse", Range(0, 1)) = 0
_Amount_Blend ("BRDF Amount", Range(0, 2)) = 1
_Amount_Wrap ("Lambert Wrap", Range(0, 1)) = 0
_cDiff ("Diffuse", Color) = (1,1,1,0.5)
_cAmbn ("Ambient", Color) = (0,0,0,0.5)
_cKeyf ("Specular (.a=0.5)", Color) = (1,1,1,0.5)
_cRimt ("RimTop   (.a=0.5)", Color) = (1,1,0,0.5)
_cRimb ("RimBottom(.a=0.5)", Color) = (0.5,0.5,0.5,0.5)
_Amount_RimLt ("RimLight Mult", Range(0, 2)) = 1
[Space] [Header(AO_MODE______________________________)] [Space] [KeywordEnum(NONE, HUE)] AO_MODE ("Toggle AO_MODE", Float) = 0
_vAmOc ("vAmbOcclusion", Color) = (0,0,0,1)
_vAmOcPower ("vAmbOcclusion Power", Range(0.1, 10)) = 1
_vAmTxPower ("vAmbTexture Power", Range(1, 10)) = 5
[Space] [Header(STENCIL_ID_SORTING___________________)] [Space] [Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Compare", Float) = 0
[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp ("Stencil Operation", Float) = 0
_Stencil ("Stencil ID", Float) = 0
}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+1" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+1" "RenderType" = "Opaque" }
  Stencil {
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 9083
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat10_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_1.w;
    u_xlat0.x = (-u_xlat10_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat10_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_1.w;
    u_xlat0.x = (-u_xlat10_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat10_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_1.w;
    u_xlat0.x = (-u_xlat10_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat16_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_1.w;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat16_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_1.w;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat16_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_1.w;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat10_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat10_1.w;
    u_xlat21 = (-u_xlat10_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat10_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat10_1.w;
    u_xlat21 = (-u_xlat10_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat10_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat10_1.w;
    u_xlat21 = (-u_xlat10_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat16_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat16_1.w;
    u_xlat21 = (-u_xlat16_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat16_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat16_1.w;
    u_xlat21 = (-u_xlat16_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat16_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat16_1.w;
    u_xlat21 = (-u_xlat16_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "BRB_CHAR_FX" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "BRB_CHAR_FX" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "BRB_CHAR_FX" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "BRB_CHAR_FX" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "BRB_CHAR_FX" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "BRB_CHAR_FX" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat5.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat15 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = u_xlat0.x * 0.5 + 0.5;
    u_xlat4 = u_xlat4 * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat4 = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Amount_Blend);
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www + (-u_xlat16_4.xyz);
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_0 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_0 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_0.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = _cAmbn.xyz * _vAmOc.xyz;
    u_xlat16_5.xyz = (-_cAmbn.xyz) * _vAmOc.xyz + _cDiff.xyz;
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = log2(vs_TEXCOORD2.z);
    u_xlat16_21 = u_xlat16_21 * _vAmOcPower;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat10_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_1.w;
    u_xlat0.x = (-u_xlat10_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat10_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_1.w;
    u_xlat0.x = (-u_xlat10_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat10_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat10_1.w;
    u_xlat0.x = (-u_xlat10_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat16_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_1.w;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat16_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_1.w;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat6.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat18 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_21 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_21 = u_xlat16_0.w * u_xlat16_21;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat0.x = _MatCap_Inverse * u_xlat0.x + u_xlat16_1.w;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat10_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat10_1.w;
    u_xlat21 = (-u_xlat10_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat10_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat10_1.w;
    u_xlat21 = (-u_xlat10_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
attribute mediump vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
uniform lowp sampler2D _Ramp2D;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap2D;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat10_2 = texture2D(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat10_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat10_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat10_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat10_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat10_1 = texture2D(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat10_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat10_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat10_1.w;
    u_xlat21 = (-u_xlat10_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz;
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat10_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat10_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat16_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat16_1.w;
    u_xlat21 = (-u_xlat16_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat16_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat16_1.w;
    u_xlat21 = (-u_xlat16_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "AO_MODE_HUE" "BRB_CHAR_FX" "NIANTIC_FX_MATCAP" "NIANTIC_MAIN_TEXTURE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump float _Amount_Wrap;
in mediump vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat12 = u_xlat1.z * unity_FogParams.x;
    u_xlat16_3 = u_xlat12 * (-u_xlat12);
    vs_TEXCOORD3.w = exp2(u_xlat16_3);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.x = min(max(vs_TEXCOORD1.x, 0.0), 1.0);
#else
    vs_TEXCOORD1.x = clamp(vs_TEXCOORD1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat4.x = dot(u_xlat1, u_xlat1);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat4.xy;
    u_xlat4.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.949999988;
    vs_TEXCOORD1.y = u_xlat4.x;
    u_xlat4.x = (-_Amount_Wrap) + 1.0;
    u_xlat0.x = u_xlat0.x * _Amount_Wrap + u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat0.x;
    vs_TEXCOORD2.xyz = in_COLOR0.xyw;
    vs_TEXCOORD3.xyz = vec3(1.0, 1.0, 1.0);
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _cMatCap_Tint;
uniform 	mediump float _MatCap_Inverse;
uniform 	mediump float _AnimInput_MatCap;
uniform 	mediump float _Amount_Blend;
uniform 	mediump float _Amount_RimLt;
uniform 	mediump vec4 _cDiff;
uniform 	mediump vec4 _cAmbn;
uniform 	mediump vec4 _cKeyf;
uniform 	mediump vec4 _cRimt;
uniform 	mediump vec4 _cRimb;
uniform 	mediump vec4 _vAmOc;
uniform 	mediump float _vAmOcPower;
uniform 	mediump float _vAmTxPower;
UNITY_LOCATION(0) uniform mediump sampler2D _Ramp2D;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap2D;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat21;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.x = _cKeyf.w + _cKeyf.w;
    u_xlat7.x = _cRimt.w + _cRimt.w;
    u_xlat1.xyz = _cRimt.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cRimt.xyz;
    u_xlat16_2 = texture(_Ramp2D, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz;
    u_xlat1.xyz = _cKeyf.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _cKeyf.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = _cRimb.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _cRimb.xyz;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat16_4.xyz = _cDiff.xyz + (-_cAmbn.xyz);
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz + _cAmbn.xyz;
    u_xlat21 = _cRimb.w + _cRimb.w;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_RimLt, _Amount_RimLt, _Amount_RimLt)) + u_xlat16_4.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_Amount_Blend, _Amount_Blend, _Amount_Blend));
    u_xlat16_4.xyz = _cMatCap_Tint.xyz * _cMatCap_Tint.www + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vs_TEXCOORD2.www + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat16_24 = _AnimInput_MatCap * _AnimInput_MatCap;
    u_xlat16_24 = u_xlat16_0.w * u_xlat16_24;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _cMatCap_Tint.www * _cMatCap_Tint.xyz;
    u_xlat16_1 = texture(_MatCap2D, vs_TEXCOORD1.zw);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _cMatCap_Tint.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _cMatCap_Tint.xyz;
    u_xlat16_4.xyz = vec3(vec3(_AnimInput_MatCap, _AnimInput_MatCap, _AnimInput_MatCap)) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat1.x = u_xlat16_1.w * -2.0 + 1.0;
    u_xlat1.x = _MatCap_Inverse * u_xlat1.x + u_xlat16_1.w;
    u_xlat21 = (-u_xlat16_0.w) + u_xlat1.x;
    u_xlat21 = u_xlat21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_vAmTxPower, _vAmTxPower, _vAmTxPower));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_24 = dot(u_xlat16_0.xyz, vec3(0.298911989, 0.586610973, 0.114478));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xyz * _vAmOc.xyz;
    u_xlat16_25 = (-u_xlat16_24) + 1.0;
    u_xlat16_25 = log2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _vAmTxPower;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vec3(0.5, 0.5, 0.5) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(0.899999976, 0.899999976, 0.899999976));
    u_xlat16_6.xyz = vec3(u_xlat16_24) + (-_vAmOc.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz + _vAmOc.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = _vAmOc.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_4.xyz;
    u_xlat16_24 = log2(vs_TEXCOORD2.z);
    u_xlat16_24 = u_xlat16_24 * _vAmOcPower;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_3.xyz = vec3(u_xlat16_24) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * _Color.xyz;
    SV_Target0.w = _Color.w;
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