Shader "Unlit/Ejercicio8"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _ExtrudeX("Extrude", Range(-1, 1)) = 1
        _ExtrudeY("Extrude", Range(-1, 1)) = 1
        _ExtrudeZ("Extrude", Range(-1, 5)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;
        half _ExtrudeX;
        half _ExtrudeY;
        half _ExtrudeZ;

        struct Input
        {
            float2 uv_MainTex;

        };

        struct appdata
        {
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 texcoord: TEXCOORD0;
        };

        void vert(inout appdata v)
        {
            v.vertex.x += v.vertex * _ExtrudeX;
            v.vertex.y += v.normal * _ExtrudeY;
            v.vertex.z += v.texcoord * _ExtrudeZ;   
        }
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        }
        ENDCG
    }
}
