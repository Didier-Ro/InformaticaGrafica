Shader "Examen3/shader2"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Range("Alpha", Range(0,1)) = 1
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        ZWrite On
        CGPROGRAM
        #pragma surface surf Lambert alpha
        #pragma target 3.0

        sampler2D _MainTex;


        struct Input
        {
            float2 uv_MainTex;
            float3 worldPos;
        };

        half _Range;


        void surf (Input IN, inout SurfaceOutput o)
        {
            float2 t = frac(IN.uv_MainTex * 0.5) * 2.0;
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Emission = frac(IN.worldPos.x * 12) * 0.5;
            o.Alpha = c.a * _Range;
        }
        ENDCG
    }
    FallBack "Diffuse"
}