using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreFront.Utilities
{
    public class MathUtility 
    {
        // If using TDD (Test Driven Development), you set up the container for the method (signature), then write the tests before the actual functionality
        public static decimal AddNumbers(decimal nbr1, decimal nbr2)
        {
            return nbr1 + nbr2;
        }
    }
}