Shader "1clase/Normal"
{
    Properties
    {
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _NormalMap("NormalMap", 2D) = "bump" {}
        _Range("BumpAmount", Range(0, 10)) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        sampler2D _MainTex;
        sampler2D _NormalMap;
        half _Range;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalMap;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap)); //código para usar el normal map de la textura del conejo
            o.Normal *= float3(_Range, _Range,1); //modifica la intensidad del normal "genera más volumen"
        }
        ENDCG
    }
}