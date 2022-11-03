Shader "Parcial3/DecalShader"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _DecalTex("Decal", 2D) = "white"{}
        
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _DecalTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            float3 a = tex2D(_MainTex, IN.uv_MainTex).rgb;
            float3 b = tex2D(_DecalTex, IN.uv_MainTex).rgb;
            o.Albedo = (a.r / b.r)* a.r;
;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
