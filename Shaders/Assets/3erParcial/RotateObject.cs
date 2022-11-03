using System.Collections;
using System.Collections.Generic;
using System.Net.Http.Headers;
using UnityEngine;

public class RotateObject : MonoBehaviour
{
    [SerializeField] private float _speed = 5;
    void Update()
    {
        transform.Rotate(0, _speed * Time.deltaTime,0);
    }
}
