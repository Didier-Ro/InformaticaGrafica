Shader "Shader5E/Ejer5"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _ColorUno ("Color1", Color) = (1,1,1,1)
        _ColorDos("Color2", Color) = (1,1,1,1)
        _Range("Range", Range(0,1)) = 1
        _RangeRed("RangeRed", Range(0,1)) = 1
        
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        float4 _ColorUno;
        float4 _ColorDos;
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
           o.Emission = frac((IN.worldPos.x * 6))> 0.9? _ColorUno:
                        frac((IN.worldPos.y * 2))>0.25? _ColorDos:0; 
        }
        ENDCG
    }
}
