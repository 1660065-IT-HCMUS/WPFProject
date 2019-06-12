using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Milestone2
{
    /// <summary>
    /// this class check data input have validation.
    /// </summary>

    public static class CheckValidation
    {

        public static bool CheckName(string textBoxContent)
        {
            if (String.IsNullOrEmpty(textBoxContent) || Regex.IsMatch(textBoxContent, @"[@+/><#$%^&*()=]+"))
                return false;
            else
                return true;
        }

        public static bool CheckPriceAndQuantity(string priceTxt, string quantityTxt)
        {
            if (String.IsNullOrEmpty(priceTxt) || String.IsNullOrEmpty(quantityTxt) || Regex.IsMatch(quantityTxt, @"[A-Za-z@+/><#$%^&*()=]+")
                || Regex.IsMatch(priceTxt, @"[A-Za-z@+/><#$%^&*()=]+"))
                return false;
            else
                return true;
        }
    }

    public class RegexValidation : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (Regex.IsMatch(value.ToString(), @"[@+/><#$%^&*()=]+"))
            {
                return new ValidationResult(false, "Không thể chứa kí tự đặc biệt!");
            }
            else
                return new ValidationResult(true, null);
        }
    }

    //check price have validation
    public class PriceValidation : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (Regex.IsMatch(value.ToString(), @"[a-zA-Z@+/><#$%^&*()=]+"))
            {
                return new ValidationResult(false, "Giá không thể chứa chữ cái! ");
            }
            else
                return new ValidationResult(true, null);
        }

    }
    //check empty textbox
    public class EmptyValidation : System.Windows.Controls.ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (string.IsNullOrEmpty(value as string))
            {
                return new ValidationResult(false, "Không được để trống!");
            }
            else
                return ValidationResult.ValidResult;
        }

    }

}
