using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace Milestone2
{
    class ImageConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var currentFolder = AppDomain.CurrentDomain.BaseDirectory;
            var baseFolder = currentFolder.Substring(0, currentFolder.Length - 1);
            //var filename = value.ToString();
            var filename = value as string;
            //var removeFolderName = baseFolder.Replace(@"\bin\Debug", "");
            return $"{baseFolder}\\Images\\{filename}";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
