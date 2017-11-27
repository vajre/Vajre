using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Collections.Generic;

public class Tick
{
    static long msec = 0;

    public static void Start()
    {
        msec = System.DateTime.Now.Ticks;
    }

    public static double Stop()
    {
        return (System.DateTime.Now.Ticks - msec) / 10000.0;
    }

}
