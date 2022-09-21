Shader "clase2p3/Nx"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _NX("Nx", Range(0,10)) = 1
        _NY("Ny", Range(0,10)) = 1
        _Nz("Nz", Range(0,10)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        float4 _Color;
        half _NX;
        half _NY;
        half _NZ;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo.r = _Color.r;
            o.Normal = float3(_NX,_NY,_NZ);
        }
        ENDCG
    }
}