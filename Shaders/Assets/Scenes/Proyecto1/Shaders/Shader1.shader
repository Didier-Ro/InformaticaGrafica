Shader "Shader1/primer"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _NormalMap("Normal", 2D) = "bump" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Cull Off
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _NormalMap;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalMap;
            float3 worldPos;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
           clip(frac((IN.worldPos.y + IN.worldPos.z * 0.1) * 5) - 0.5);
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
            o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
        }
        ENDCG
    }
}
