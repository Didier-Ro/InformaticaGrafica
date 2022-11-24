Shader "Unlit/Ejercicio7"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _Amount("Extrusion", Range(-1,1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;
        float _Amount;

        struct Input
        {
            float2 uv_MainTex;

        };

        void vert(inout appdata_full v)
        {
            v.vertex.xyz += v.normal * _Amount;
        }
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        }
        ENDCG
    }
}
