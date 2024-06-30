//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Holo/Environment/Sky" {
Properties {
[KeywordEnum(Opaque, Cutout)]  _Render ("Rendering Mode", Float) = 0
 _MainTex ("Base (RGB)", 2D) = "white" { }
[KeywordEnum(Off, Clamp_V, Wrap_V)]  _Mirror_U ("    U Mirror (use only if texture is clamped - wrap V has issues)", Float) = 0
[KeywordEnum(Off, Clamp_U, Wrap_U, Horizon)]  _Mirror_V ("    V Mirror (use only if texture is clamped - wrap U has issues)", Float) = 0
[KeywordEnum(None, Unlit)]  _BaseAlpha ("    Alpha Mode", Float) = 0
 _AlphaTestRef ("    Alpha Cutoff", Range(0,1)) = 0.5
[Toggle(_VERTEXMODE_DIFFUSE)]  _VertexMode ("Vertex Color Multiply", Float) = 0
[KeywordEnum(Off, Fog, Horizon_WS, Horizon_WS_Mirror, Composite)]  _Fog ("Fog Mode", Float) = 0
 _FogAlpha ("Fog Alpha (an override)", Range(0,1)) = 1
 _FogHorizonOS ("Fog (faked) OS Horizon Offset", Range(-10,10)) = 0
 _FogHorizonWS ("Fog (faked) WS Height (over horizon)", Range(0,1000)) = 35
[Enum(UnityEngine.Rendering.CullMode)]  _Cull ("Culling Mode (None = double-sided)", Float) = 2
[Toggle(BRB_FX)]  _FX ("Ignore FX Color", Float) = 0
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="AlphaTest+50" "RenderType"="Background" }
 Pass {
  Tags { "QUEUE"="AlphaTest+50" "RenderType"="Background" }
  Cull [_Cull]
  GpuProgramID 6468
Program "vp" {
SubProgram "gles " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _SkyColor;
varying highp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 0.0);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _SkyColor.xyz;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR0 = (tmpvar_4 * _SkyColor.w);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 col_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  col_2 = tmpvar_3;
  col_2.xyz = (col_2.xyz * xlv_COLOR0.xyz);
  tmpvar_1 = col_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
""
}
}
 }
}
Fallback Off
}