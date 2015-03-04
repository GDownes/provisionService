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
                new Process { StartInfo = new ProcessStartInfo("ansible", "kueue -m ping") }.Start();
                return "Started development kueue deployment";
            };
        }
    }
}
