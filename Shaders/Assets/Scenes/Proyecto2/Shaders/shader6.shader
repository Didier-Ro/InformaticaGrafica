Shader "Proyecto2/shader6"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = tex2D (_MainTex, floor(IN.uv_MainTex.xy * 4.0) * 0.25).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
