Shader "Examen3/shader4"
{
   Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "black" {}
         _AOTex("AO", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "Queue" = "Geometry" }
        Blend SrcAlpha OneMinusSrcAlpha
        Pass
        {
            ZWrite Off
            ColorMask RGB
            SetTexture[_MainTex]{combine texture}
            SetTexture[_AOTex]{combine texture * previous}
        }
    }
}
