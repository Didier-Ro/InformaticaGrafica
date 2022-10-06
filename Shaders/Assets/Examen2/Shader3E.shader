Shader "Shader3E/Ejer3"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white"{}
        _NormalMap ("Normal", 2D) = "bump" {}
        _Cube ("Cube", CUBE) = "" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _MainTex;
        samplerCUBE _Cube;
        sampler2D _NormalMap;
        
        struct Input 
        {
            float3 worldRefl; INTERNAL_DATA
            float2 uv_MainTex;
            float2 uv_NormalMap;
        };
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Emission = texCUBE(_Cube, IN.worldRefl);
            o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
        }
        ENDCG
    }
}
