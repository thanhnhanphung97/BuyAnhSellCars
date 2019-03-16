using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BuyAndSellCars.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Vui lòng điền vào trường này.")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Vui lòng điền vào trường này.")]
        public string Password { get; set; }
        public bool RememberMe { get; set; }
    }
}