Shader "Examen/7"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _ExtrudeX("Extrude", Range(0, 1)) = 1
        _ExtrudeY("Extrude", Range(0, 1)) = 1
        _ExtrudeZ("Extrude", Range(0, 1)) = 1
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

        void vert(inout appdata_full v)
        {
            v.texcoord.x += sin(v.texcoord.x * _ExtrudeX);
            v.texcoord.y += sin(v.texcoord.y * _ExtrudeY);
            //v.texcoord.z += (v.color.xy * _ExtrudeZ);   
        }
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        }
        ENDCG
    }
}

