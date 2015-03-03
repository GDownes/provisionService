#region

using System;
using System.Linq;
using System.Threading;

using Nancy.Hosting.Self;

#endregion

namespace ProvisionService
{
    public static class Program
    {
        #region Public Methods and Operators

        public static int Main(string[] args)
        {
            var uri = new Uri("http://localhost:7070");

            var host = new NancyHost(uri);
            host.Start();

            Console.WriteLine("Your application is running on " + uri);

            return 0;
        }

        #endregion
    }
}