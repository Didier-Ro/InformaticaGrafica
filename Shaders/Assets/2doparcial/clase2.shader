Shader "clase2/practica2"
{
     Properties
    {
        _Cube("Cube", CUBE) = ""{}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        samplerCUBE _Cube;

        struct Input
        {
            float2 uv_MainTex;
            float3 worldRefl;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Emission = texCUBE(_Cube, IN.worldRefl);
            o.Albedo.gb = texCUBE(_Cube, IN.worldRefl.b);//Usamos el cubemap en el albedo combinando los canales de color que crean un azul turquesa 
        }
        ENDCG
    }
}
