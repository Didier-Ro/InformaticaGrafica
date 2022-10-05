Shader "RimLineas/Lineas"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {

        CGPROGRAM
        #pragma surface surf Lambert

        
        sampler2D _MainTex;

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
            o.Emission = frac(IN.worldPos.x * 10) > 0.9 ? float3(1,0,1) :
                         frac(IN.worldPos.y * 10) > 0.9 ? float3(1,1,0) : 0;
        }
        ENDCG
    }
}
