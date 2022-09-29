Shader "clase3/Alpha"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Range("Alpha", Range(0,1)) = 1
    }
    SubShader
    {
        ZWrite off
        Tags{"RenderType" = "Transparent"}
        CGPROGRAM
        
        #pragma surface surf Lambert alpha

        sampler2D _MainTex;
        float4 _Color;
        half _Range;
        struct Input
        {
            float2 uv_MainTex;
        };
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Alpha = _Color.a * _Range;
        }
        ENDCG
    }
}
