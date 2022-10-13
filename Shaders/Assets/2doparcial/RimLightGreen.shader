Shader "RimLightGreen/Green"
{
    Properties
    {
        
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        

        struct Input
        {
            float3 viewDir;
        }
        ;
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp = 1 - saturate(dot(IN.viewDir, o.Normal)); //Inversa del producto punto, permite crear el contorno de color
                                 //R,   G,    b
            o.Emission = float3(0, pow(dotp,1), pow(dotp,1)); //Determinamos el color del contorno
            o.Albedo.rg = 1; //Usamos los canales rojo y verde para hacer amarillo en el color base
        }
        ENDCG
    }
}
    