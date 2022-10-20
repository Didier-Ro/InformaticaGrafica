Shader "BlinnPhong/p1"
{
    Properties
    {
        _Colour ("Colour", Color) = (1,1,1,1)
        _SpecColor ("Specular Color", Color) = (1,1,1,1)
        _Gloss ("Gloss", Range(0,1)) = 1
        _Spec ("Specular", Range(0,1)) = 1
    }
    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
        }
        CGPROGRAM
        #pragma surface surf BlinnPhong
        
        float4 _Colour;
        fixed _Gloss;
        half _Spec;
        
        
        struct Input
        {
            float2 uv_MainTex;
        };
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Colour.rgb;
            o.Gloss =  _Colour * _Gloss;
            o.Specular = _SpecColor * _Spec;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
