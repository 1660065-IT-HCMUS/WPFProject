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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Milestone2.BaoCaoComponents
{
    /// <summary>
    /// Interaction logic for usBaoCao.xaml
    /// </summary>
    public partial class usBaoCao : UserControl
    {
        public usBaoCao()
        {
            InitializeComponent();
        }
       
        //Khi chọn panel Thống kê theo số lượng sản phẩm đã bán
        private void SoLuongSanPhamDaBanPanel_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            gridChart.Children.Clear();
            gridChart.Children.Add(new usTKSoLuongSP());
        }
        //Khi chọn panel Thống kê doanh thu
        private void DoanhThuPanel_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            gridChart.Children.Clear();
            gridChart.Children.Add(new usDoanhThu());
        }

        //Khi chọn panel Tỉ lệ đóng góp doanh thu
        private void TileDongGopPanel_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            gridChart.Children.Clear();
            gridChart.Children.Add(new usTiLeDongGop());
        }
    }
}
