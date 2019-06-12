using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace Milestone2.QuanLiComponents
{
    class OrderStateToStringConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var status = (string)value;

            switch (status.Trim())
            {
                case "New":
                    return "Mới tạo";
                case "Complete":
                    return "Đã thanh toán";
                case "Cancelled":
                    return "Đã hủy";
            }

            return "";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
