using Owin;

namespace APIDemo
{
    public interface IStartup
    {
        void Configuration(IAppBuilder app);
        void ConfigureAuth(IAppBuilder app);
        bool Equals(object obj);
        int GetHashCode();
        string ToString();
    }
}