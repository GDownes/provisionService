using System.Diagnostics;

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
        }
    }
}
