Shader "Examen/9"
{
    Properties{
           _MainTex("MainTex", 2D) = "white" {}
           _DecalTex("Decal", 2D) = "white" {}
           [Toggle]_ShowDecal("Show", Float) = 0

    }
        SubShader{
            Tags{
                "Queue" = "Geometry"
            }

            CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _MainTex;
            sampler2D _DecalTex;
            float _ShowDecal;

            struct Input {
                float2 uv_MainTex;
                float2 uv_DecalTex;
            };

            void surf(Input IN, inout SurfaceOutput o) {
                float4 a = tex2D(_MainTex, IN.uv_MainTex);
                float4 b = tex2D(_DecalTex, IN.uv_DecalTex);
                
               if(_ShowDecal == 1)
               {
                   o.Albedo.rgb = a * b;
               }
               if (_ShowDecal == 0)
               {
                   o.Albedo.rgb = b;
               }
            }
            ENDCG
    }
}