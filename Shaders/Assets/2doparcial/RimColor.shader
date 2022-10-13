Shader "RimColor/ColorPicker"
{
    Properties
    {
        _Color("RimColor", Color) = (1,1,1,1) 
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        float3 _Color;
        
        struct Input
        {
            float3 viewDir;
        }
        ;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp = 1-saturate(dot(IN.viewDir, o.Normal));
            o.Emission = _Color * dotp; //Multiplicamos el color por el producto punto inverso para tener contorno del color que deseamos
            o.Albedo.rgb = 0; //Eliminamos todos los colores dejándolo oscuro
        }
        ENDCG
    }
}
