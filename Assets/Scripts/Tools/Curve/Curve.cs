using System;
using System.Collections;
using System.Reflection;
using UnityEngine;
using System.Collections.Generic;

public class Curve : MonoBehaviour
{

    [SerializeField]
    List<Vector3> points = new List<Vector3>();

    [SerializeField]
    int smooth = 10;

    [SerializeField]
    float distance = 0.1f;

    Vector3 tmpPos;

    private void Awake()
    {

    }

    public List<Vector3> GetPoints()
    {
        return points;
    }

    void OnDrawGizmos()
    {
#if UNITY_EDITOR
        SetPoints(points);
        for (int j = 0; j < points.Count; j++)
        {
            if (j != points.Count - 1)
            {
                Gizmos.color = new Color(1, 0, 0, 1);
                Gizmos.DrawLine(points[j], points[j + 1]);
            }
        }
#endif
    }

    //---------------------------------------create points
    
    void SetPoints(List<Vector3> _points)
    {
        int count = transform.childCount;
        if (count < 2)
            return;

        Vector3[] TargetV3 = GetTransforms();
        Vector3[] vector3s = PathControlPointGenerator(TargetV3);

        _points.Clear();
        Vector3 prevPt = Interp(vector3s, 0);
        tmpPos = prevPt;
        _points.Add(prevPt);

        int SmoothAmount = TargetV3.Length * smooth;
        for (int i = 1; i <= SmoothAmount; i++)
        {
            float pm = (float)i / SmoothAmount;
            Vector3 currPt = Interp(vector3s, pm);
            HandPoint(currPt, _points, i == SmoothAmount);
            prevPt = currPt;
        }
    }

    Vector3[] GetTransforms()
    {
        List<Vector3> transforms = new List<Vector3>();
        int count = transform.childCount;
        for (int i = 0; i < count; i++)
            transforms.Add(transform.GetChild(i).position);
        return transforms.ToArray();
    }


    void HandPoint(Vector3 pos, List<Vector3> _points, bool bLast)
    {
        while (true)
        {
            if (Vector3.Distance(tmpPos, pos) > distance)
            {
                Vector3 newP = GetBetweenPoint(tmpPos, pos);
                _points.Add(newP);
                tmpPos = newP;
            }
            else
            {
                if (bLast)
                {
                    _points.Add(pos);
                }
                break;
            }
        }
    }

    Vector3 GetBetweenPoint(Vector3 start, Vector3 end)
    {
        Vector3 normal = (end - start).normalized;
        return normal * distance + start;
    }

	public Vector3[] PathControlPointGenerator(Vector3[] path)
    {
		Vector3[] suppliedPath;
		Vector3[] vector3s;
		
		//create and store path points:
		suppliedPath = path;

		//populate calculate path;
		int offset = 2;
		vector3s = new Vector3[suppliedPath.Length+offset];
		Array.Copy(suppliedPath,0,vector3s,1,suppliedPath.Length);
		

		vector3s[0] = vector3s[1] + (vector3s[1] - vector3s[2]);
		vector3s[vector3s.Length - 1] = vector3s[vector3s.Length - 2] + (vector3s[vector3s.Length - 2] - vector3s[vector3s.Length - 3]);
		
		//is this a closed, continuous loop? yes? well then so let's make a continuous Catmull-Rom spline!
		if(vector3s[1] == vector3s[vector3s.Length - 2])
        {
			Vector3[] tmpLoopSpline = new Vector3[vector3s.Length];
			Array.Copy(vector3s,tmpLoopSpline,vector3s.Length);
			tmpLoopSpline[0] = tmpLoopSpline[tmpLoopSpline.Length - 3];
			tmpLoopSpline[tmpLoopSpline.Length - 1] = tmpLoopSpline[2];
			vector3s = new Vector3[tmpLoopSpline.Length];
			Array.Copy(tmpLoopSpline,vector3s,tmpLoopSpline.Length);
		}	
		return(vector3s);
	}
	
	public Vector3 Interp(Vector3[] pts, float t)
    {
		int numSections = pts.Length - 3;
		int currPt = Mathf.Min(Mathf.FloorToInt(t * (float) numSections), numSections - 1);
		float u = t * (float) numSections - (float) currPt;
				
		Vector3 a = pts[currPt];
		Vector3 b = pts[currPt + 1];
		Vector3 c = pts[currPt + 2];
		Vector3 d = pts[currPt + 3];
		
		return .5f * (
			(-a + 3f * b - 3f * c + d) * (u * u * u)
			+ (2f * a - 5f * b + 4f * c - d) * (u * u)
			+ (-a + c) * u
			+ 2f * b
		);
	}
}












