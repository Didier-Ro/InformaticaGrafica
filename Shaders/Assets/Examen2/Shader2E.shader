Shader "Shader2E/Ejer2"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Emission("Emission", Color) = (1,1,1,1)
        
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        float4 _Color;
        float4 _Emission;
        
        struct Input
        {
            float3 viewDir;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(IN.viewDir, o.Normal));
           o.Albedo.r = 1;
           o.Emission = float3(0, pow(rim,1) ,0); 
        }
        ENDCG
    }
}

