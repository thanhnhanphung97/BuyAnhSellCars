using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BuyAndSellCars.Models
{
    public class LoginClientModel
    {
        [Display(Name ="Tên Đăng Nhập")]
        [Required(ErrorMessage = "Vui lòng điền vào trường này.")]
        public string UserName { get; set; }
        [Display(Name = "Mật Khẩu")]
        [Required(ErrorMessage = "Vui lòng điền vào trường này.")]
        public string Password { get; set; }
    }
}