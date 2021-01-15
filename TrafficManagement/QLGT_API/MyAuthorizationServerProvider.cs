using Microsoft.Owin.Security.OAuth;
using QLGT_API.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace QLGT_API
{
    public class MyAuthorizationServerProvider: OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {

            context.Validated();
        }
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            using (QLGT_APIContext entites = new QLGT_APIContext())
            {
                //string encryptPassword = Encrypt.ConvertToEncrypt(context.Password);

                if (!Login.LoginKhachHang(context.UserName, context.Password))
                {
                    context.SetError("Invalid", "Incorrect username and password!");
                    return;
                }
                else
                {
                    string username = entites.Customers.FirstOrDefault(k => k.UserName.Equals(context.UserName)).UserName;
                    string name = entites.Customers.FirstOrDefault(k => k.UserName.Equals(context.UserName)).Name;
                    identity.AddClaim(new Claim("username", username));
                    identity.AddClaim(new Claim(ClaimTypes.Name, name));
                    context.Validated(identity);
                }
            }
        }

        public override Task ValidateClientRedirectUri(OAuthValidateClientRedirectUriContext context)
        {

            Uri expectedRootUri = new Uri(context.Request.Uri, "/");

            if (expectedRootUri.AbsoluteUri == context.RedirectUri)
            {
                context.Validated();
            }

            return Task.FromResult<object>(null);
        }
    }

    public class Encrypt
    {
        public static string ConvertToEncrypt(string password)
        {
            if (string.IsNullOrEmpty(password)) return "";
            var passwordBytes = Encoding.UTF8.GetBytes(password);
            return Convert.ToBase64String(passwordBytes);
        }
        public static string ConvertToDecrypt(string base04EncodeData)
        {
            if (string.IsNullOrEmpty(base04EncodeData)) return "";
            var base64EncodeBytes = Convert.FromBase64String(base04EncodeData);
            return Encoding.UTF8.GetString(base64EncodeBytes);
        }
    }
}
