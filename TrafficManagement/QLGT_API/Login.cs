using QLGT_API.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLGT_API
{
    public class Login
    {
		public static bool LoginKhachHang(string username, string password)
		{
			string encryptPass = Encrypt.ConvertToEncrypt(password);
			using (QLGT_APIContext entites = new QLGT_APIContext())
			{
				return entites.Customers.Any(khachhang => khachhang.UserName.Equals(username, StringComparison.OrdinalIgnoreCase) && khachhang.Password == encryptPass);
			}
		}
	}
}