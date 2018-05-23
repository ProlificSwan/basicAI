using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dot : MonoBehaviour {

    private Rigidbody2D rb2d;
    //private Vector2 vec;

    // Use this for initialization
    void Start () {
        //vec = new Vector2(1, 1);
        rb2d = GetComponent<Rigidbody2D>();
        //TODO - create many instances of the dot objects, each with it's own brain.
    }
	
	// Update is called once per frame
	void Update ()
    {
        rb2d.AddForce(new Vector2(Random.Range(-5,5),Random.Range(-5, 5)),ForceMode2D.Impulse);
	}
}
