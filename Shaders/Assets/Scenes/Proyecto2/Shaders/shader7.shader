// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Proyecto2/shader7" 
{
    SubShader {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma target 3.0

            #include "UnityCG.cginc"

            float4 vert(appdata_base v) : POSITION {
                return UnityObjectToClipPos (v.vertex);
            }

            fixed4 frag(float4 sp:VPOS) : SV_Target {
                float2 wcoord = sp.xy/_ScreenParams.xy;
                float vig = clamp(3.0*length(wcoord-0.5),0.0,1.0);
                return lerp (fixed4(wcoord,0.0,1.0),fixed4(0.3,0.3,0.3,1.0),vig);
            }
            ENDCG
        }
    }
}