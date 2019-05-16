using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BuyAndSellCars.Models
{
    public class Register
    {
        [Key]
        public long ID { get; set; }

        [Display(Name="Họ và Tên")]
        [Required(ErrorMessage = "*")]
        public string Name { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "*")]
        public string Email { get; set; }

        [Display(Name = "Số Điện Thoại")]
        public string Phone { get; set; }

        [Display(Name = "Địa Chỉ")]
        public string Address { get; set; }

        [Display(Name = "Tên Đăng Nhập")]
        [Required(ErrorMessage = "Yêu cầu nhập tên đăng nhập")]
        public string UserName { get; set; }

        [Display(Name = "Mật Khẩu")]
        [StringLength(20,MinimumLength = 6, ErrorMessage = "Độ dài mật khẩu ít nhất 6 ký tự.")]
        [Required(ErrorMessage = "Yêu cầu nhập lại mật khẩu.")]
        public string Password { get; set; }
        [Display(Name ="Xác Nhận Mật Khẩu")]
        [Compare("Password",ErrorMessage ="Xác nhận mật khẩu không đúng.")]
        public string CongfirmPassword { get; set; }
    }
}