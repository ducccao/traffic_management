using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using KhachHangDataModel;
using System.Threading;
using System.Text;

namespace APIDemo
{
    public class MyAuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            if (context.ClientId == null)
                context.Validated();
        }
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            using (QLGTEntities entites = new QLGTEntities())
            {
                string encryptPassword = Encrypt.ConvertToEncrypt(context.Password);
                bool Islogin=entites.KhachHangs.Any(khachhang => khachhang.Username==context.UserName && khachhang.Password == encryptPassword);
                if (Islogin)
                {
                    string username = entites.KhachHangs.FirstOrDefault(k => k.Username.Equals(context.UserName)).Username;
                    string name= entites.KhachHangs.FirstOrDefault(k => k.Username.Equals(context.UserName)).TenKH;
                    identity.AddClaim(new Claim("username", username));
                    identity.AddClaim(new Claim(ClaimTypes.Name, name));
                    context.Validated(identity);
                    return;
                }
                else
                {
                    context.SetError("Invalid", "Incorrect username and password!");
                    return;
                }
            }
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
