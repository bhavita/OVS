using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OTPGenration
/// </summary>
public class OTPGenration
{
	public OTPGenration()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int GenrateOTP () {
        Random r = new Random();
        return r.Next(1000,9999);
   }
}