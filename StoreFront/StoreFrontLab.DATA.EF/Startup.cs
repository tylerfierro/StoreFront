using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StoreFrontLab.DATA.EF.Startup))]
namespace StoreFrontLab.DATA.EF
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
