using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Milestone2.QuanLiComponents
{
    /// <summary>
    /// Interaction logic for SuaHoaDon.xaml
    /// </summary>
    public partial class SuaHoaDon : Window
    {
        public string Status { get; set; }
        public int MaDonHang { get;}
        public SuaHoaDon(String status,int id)
        {
            InitializeComponent();
            Status = status;
            MaDonHang = id;

            switch (Status)
            {
                case "New":
                    TrangThaiCombobox.SelectedIndex = 0;
                    break;
                case "Complete":
                    TrangThaiCombobox.SelectedIndex = 1;
                    break;
                case "Cancelled":
                    TrangThaiCombobox.SelectedIndex = 2;
                    break;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            switch (TrangThaiCombobox.SelectedIndex)
            {
                case 0:
                    Status = "New";
                    break;
                case 1:
                    Status = "Complete";
                    break;
                case 2:
                    Status = "Cancelled";
                    break;
            }
            DialogResult = true;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            DataContext = this;
        }
    }
}
