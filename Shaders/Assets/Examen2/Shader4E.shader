Shader "Shader4E/Eje4"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Range("Range", Range(0,1)) = 1
        _RangeRed("RangeRed", Range(0,1)) = 1
        
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        float4 _Color;
        sampler2D _MainTex;
        half _Range;
        half _RangeRed;
        
        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
            float3 worldPos;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(IN.viewDir, o.Normal));
           o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
           o.Emission = frac((IN.worldPos.y * 4))>_Range? rim * _Color: frac((IN.worldPos.y * 5))>_RangeRed? float3(1,0,0):0; 
        }
        ENDCG
    }
}
