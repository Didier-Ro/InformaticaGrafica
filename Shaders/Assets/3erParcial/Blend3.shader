Shader "Parcial3/Blend2"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "black" {}
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" }
        Cull off
        //o.Alpha = c.a
        //Blend SrcAlpha OneMinusSrcAlpha
        Blend SrcAlpha OneMinusSrcAlpha
        Pass
        {
            ZWrite Off
            ColorMask G
            SetTexture[_MainTex]{combine texture}
        }
       
    }
}