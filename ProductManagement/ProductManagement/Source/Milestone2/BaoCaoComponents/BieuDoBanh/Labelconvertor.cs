using Syncfusion.UI.Xaml.Charts;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace Milestone2.BaoCaoComponents.BieuDoBanh
{
    public class Labelconvertor : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            ChartAdornment pieAdornment = value as ChartAdornment;

            var model = pieAdornment.Item as Model;

            if (model != null)
            {
                return String.Format(model.NameCategory + " : " + pieAdornment.YData + "%");
            }
            else
            {
                var list = pieAdornment.Item as List<object>;
                string labelData = "";

                for (int i = 0; i < list.Count; i++)
                {
                    var item = list[i] as Model;
                    labelData = labelData + String.Format(item.NameCategory + " : " + item.TiLeDongGop + "%");

                    if (i + 1 != list.Count)
                    {
                        labelData = labelData + Environment.NewLine;
                    }
                }

                return labelData;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value;
        }
    }
}
