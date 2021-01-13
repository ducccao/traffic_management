using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KhachHangDataModel;
namespace APIDemo
{
	public class Login
	{
		public static bool LoginKhachHang(string username, string password)
		{
			using (QLGTEntities entites = new QLGTEntities())
			{
				return entites.KhachHangs.Any(khachhang => khachhang.Username.Equals(username, StringComparison.OrdinalIgnoreCase) && khachhang.Password == password);
			}
		}
	}
}