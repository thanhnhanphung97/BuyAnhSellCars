using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace BuyAndSellCars.Common
{
    public static class convertToUnSign
    {
        public static string convert(string s)
        {
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            int strLen = s.Length;
            char[] arr = s.ToCharArray(0, strLen);
            string str = "";
            for (int i = 0; i < strLen; i++)
            {
                char c = arr[i];
                if (Char.IsUpper(c)) c = toLower(c);
                str += c;
            }
            string temp = str.Normalize(NormalizationForm.FormD);
            return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'd').Replace(' ', '-');
        }

        public static char toLower(char c)
        {
            int ch = (int)c + 32;
            return (char)ch;
        }
    }
}