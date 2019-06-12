using Milestone2.BaoCaoComponents.BieuDoDuong;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
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
    /// Interaction logic for usDoanhThu.xaml
    /// </summary>
    public partial class usDoanhThu : UserControl, INotifyPropertyChanged
    {
        public usDoanhThu()
        {
            InitializeComponent();
        }
        public ObservableCollection<Data> List { get; set; }
        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
        public void SplineChartViewModel()
        {
            this.List = new ObservableCollection<Data>();
            if (TuThang.Value != null && DenThang.Value != null)
            {
                int thang = tuthang.Month;
                int nam = tuthang.Year;

                while (nam < denthang.Year)
                {
                    while (thang <= 12)
                    {
                        var getdata = (from p in db.Purchases
                                       where p.CreatedAt.Value.Month == thang && p.CreatedAt.Value.Year == nam
                                       select p.Total).Sum();
                        DateTime a = new DateTime(nam, thang, 1);
                        if (getdata != null)
                        {
                            Nullable<decimal> doanhthu = getdata / 1000000;
                            List.Add(new Data { Month = a, DoanhThu = Math.Round((double)doanhthu, 4) });
                        }
                        else List.Add(new Data { Month = a, DoanhThu = 0 });
                        thang++;
                    }
                    nam++;
                    thang = 1;
                }
                while (nam == denthang.Year)
                {
                    while (thang <= denthang.Month)
                    {
                        var getdata = (from p in db.Purchases
                                       where p.CreatedAt.Value.Month == thang && p.CreatedAt.Value.Year == nam
                                       select p.Total).Sum();
                        DateTime a = new DateTime(nam, thang, 1);
                        if (getdata != null)
                        {
                            Nullable<decimal> doanhthu = getdata / 1000000;
                            List.Add(new Data { Month = a, DoanhThu = Math.Round((double)doanhthu, 4) });
                        }
                        else List.Add(new Data { Month = a, DoanhThu = 0 });
                        thang++;
                    }
                    nam++;
                }
                NotifyChange("List");
            }
        }

        private void NotifyChange(string v)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(v));
            }
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            SplineChartViewModel();
            DataContext = this;
        }
        DateTime tuthang, denthang;

        private void TuThang_ValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (TuThang.Value != null)
            {
                tuthang = Convert.ToDateTime(TuThang.Value);
            }
            if (TuThang.Value != null && DenThang.Value != null)
            {
                if (tuthang.CompareTo(denthang) > 0)
                {
                    TuThang.Value = null;
                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#F03674");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Khoảng thời gian không hợp lệ. Vui lòng chọn lại !");
                }
                else SplineChartViewModel();
            }
        }

        private void DenThang_ValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (TuThang.Value != null)
            {
                denthang = Convert.ToDateTime(DenThang.Value);
            }
            if (TuThang.Value != null && DenThang.Value != null)
            {
                if (tuthang.CompareTo(denthang) > 0)
                {
                    DenThang.Value = null;
                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#F03674");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Khoảng thời gian không hợp lệ. Vui lòng chọn lại !");
                }
                else SplineChartViewModel();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
