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

        public static void Main(string[] args)
        {
            var uri = new Uri("http://localhost:7070");

            using (var host = new NancyHost(uri))
            {
                host.Start();

                Console.WriteLine("Your application is running on " + uri);

                if (args.Any(s => s.Equals("-d", StringComparison.CurrentCultureIgnoreCase)))
                {
                    Thread.Sleep(Timeout.Infinite);
                }
                else
                {
                    Console.ReadKey();
                }

                host.Stop();
            }
        }

        #endregion
    }
}