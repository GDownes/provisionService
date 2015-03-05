using System.Diagnostics;
using System.Text;
using System.Threading;

using Nancy;

namespace ProvisionService
{
    public class ProvisionModule : NancyModule
    {
        public ProvisionModule()
        {
            this.Get["/"] = _ => this.View["Index.cshtml"];

            this.Get["/kueue"] = _ =>
            {
                new Process { StartInfo = new ProcessStartInfo("ansible-playbook", "/vagrant/deploy-kueue-playbook.yml") }.Start();
                return "Started development kueue deployment";
            };

            this.Get["/stream"] = _ =>
            {
                var response = new Response();
                response.Headers.Add("Transfer-Encoding", "Chunked");
                response.ContentType = "text/plain";
                response.Contents = s =>
                {
                    byte[] bytes = Encoding.UTF8.GetBytes("Hello World\n");
                    for (int i = 0; i < 10; ++i)
                    {
                        s.Write(bytes, 0, bytes.Length);
                        s.Flush();
                        Thread.Sleep(2000);
                    }
                };

                return response;
            };
        }
    }
}
