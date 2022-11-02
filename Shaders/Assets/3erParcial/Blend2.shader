Shader "Parcial3/Blend2"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "black" {}
         _Normal("Normal", 2D) = "bump" {}
    }
    SubShader
    {
        Tags { "Queue" = "AlphaTest" }
        //o.Alpha = c.a
        //Blend SrcAlpha OneMinusSrcAlpha
        Blend One OneMinusSrcAlpha
        Pass
        {
            ZWrite On
            ColorMask GR
            SetTexture[_MainTex]{combine texture}
            SetTexture[_Normal]{combine texture * previous}
        }
    }
}