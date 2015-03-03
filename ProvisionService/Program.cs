#region

using System;

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
            return 0;
        }

        #endregion
    }
}