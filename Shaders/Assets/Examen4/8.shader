Shader "Examen/8" {
    Properties{
            _MainTex("MainTex", 2D) = "white" {}
            _DecalTex("Decal", 2D) = "white" {}
            _3erTex("3erTex", 2D) = "black" {}
            _4thTex("4thTex", 2D) = "black" {}
    }
        SubShader{
            Tags{
                "Queue" = "Geometry"
            }

            CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _MainTex;
            sampler2D _DecalTex;
            sampler2D _3erTex;
            sampler2D _4thTex;

            struct Input {
                float2 uv_MainTex;
                float2 uv_DecalTex;
            };

            void surf(Input IN, inout SurfaceOutput o) {
                float4 c = tex2D(_MainTex, IN.uv_MainTex);
                float4 d = tex2D(_DecalTex, IN.uv_DecalTex);
                float4 e = tex2D(_3erTex, IN.uv_MainTex);
                float4 f = tex2D(_4thTex, IN.uv_MainTex);
                o.Albedo.rgb = (c+d+e+f)/2;
            }
            ENDCG
    }
}
