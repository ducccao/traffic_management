using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using KhachHangDataModel;
using System.Threading;
using System.Threading.Tasks;

namespace APIDemo.Controllers
{
	public class KhachHangController : ApiController
	{
		[BasicAuthAtribute]
		public HttpResponseMessage Getuser()
		{
			string username = Thread.CurrentPrincipal.Identity.Name;
			using (QLGTEntities entites = new QLGTEntities())
			{
				return Request.CreateResponse(HttpStatusCode.OK,
					entites.KhachHangs.FirstOrDefault(k => k.Username.Equals(username)));
			}
		}

		[HttpPost]
		[Route("api/khachhang/register")]
		public async Task<IHttpActionResult> Register(KhachHang kh)
        {
			QLGTEntities entities = new QLGTEntities();
			if (!ModelState.IsValid)
            {
				return BadRequest(ModelState);
            }
			entities.KhachHangs.Add(new KhachHang()
			{
				DienThoai = kh.DienThoai,
				DiaChi = kh.DiaChi,
				TenKH=kh.TenKH,
				Username=kh.Username,
				Password=Encrypt.ConvertToEncrypt(kh.Password)
			}) ;
			entities.SaveChanges();
			return Ok();
        }
		//public IEnumerable<KhachHang> Get()
		//{
		//	using (QLGTEntities entities = new QLGTEntities())
		//	{
		//		return entities.KhachHangs.ToList();
		//	}
		//}
		//public KhachHang Get(int id)
		//{
		//	using (QLGTEntities entities = new QLGTEntities())
		//	{
		//		return entities.KhachHangs.FirstOrDefault(k => k.MaKhachHang == id);
		//	}
		//}

		public HttpResponseMessage Post([FromBody] KhachHang kh)
		{
			try
			{
				using (QLGTEntities entites = new QLGTEntities())
				{
					entites.KhachHangs.Add(kh);
					entites.SaveChanges();
					var message = Request.CreateResponse(HttpStatusCode.Created, kh);
					message.Headers.Location = new Uri(Request.RequestUri + kh.MaKhachHang.ToString());
					return message;
				}
			}
			catch (Exception ex)
			{
				return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
			}
		}
	}
}
