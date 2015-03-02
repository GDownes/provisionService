using System.Diagnostics;

using Nancy;

namespace ProvisionService
{
    public class ProvisionModule : NancyModule
    {
        public ProvisionModule()
        {
            this.Get["/"] = _ => this.View["Index.cshtml"];

            this.Get["/kueue/dev"] = _ =>
            {
                new Process { StartInfo = new ProcessStartInfo("ls") }.Start();
                return "Started development kueue deployment";
            };

            this.Get["/kueue/qa"] = _ =>
            {
                new Process { StartInfo = new ProcessStartInfo("ls") }.Start();
                return "Started quality kueue deployment";
            };
        }
    }
}
