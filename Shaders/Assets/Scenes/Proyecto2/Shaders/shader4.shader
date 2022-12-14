Shader "Proyecto2/shader4" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _TargetAlpha ("TargetAlpha", Range(0, 1)) = 0.0
    }
    SubShader {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows alpha:fade

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input {
            float2 uv_MainTex;
        };

        half _Alpha;
        fixed4 _Color;
        half _TargetAlpha;


        void surf (Input IN, inout SurfaceOutputStandard o) 
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            o.Alpha = lerp(o.Alpha, _TargetAlpha, clamp(_SinTime.w, 0, 1));
        }
        ENDCG
    }
    FallBack "Diffuse"
 }
