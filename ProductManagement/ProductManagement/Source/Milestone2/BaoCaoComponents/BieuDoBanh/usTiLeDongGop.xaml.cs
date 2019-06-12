using Milestone2.BaoCaoComponents.BieuDoBanh;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for usTiLeDongGop.xaml
    /// </summary>
    public partial class usTiLeDongGop : UserControl, INotifyPropertyChanged
    {
        public usTiLeDongGop()
        {
            InitializeComponent();
        }
        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
        public IList<Model> Data
        {
            get;
            set;
        }
        public DateTime TuNgay, DenNgay;

        public event PropertyChangedEventHandler PropertyChanged;

        public void ViewModel()
        {
            this.Data = new List<Model>();

            if (TuNgayDatePicker.SelectedDate != null && DenNgayDatePicker.SelectedDate != null)
            {
                Data.Clear();
                var dataCate = db.Categories.Select(p => p).ToList();
                for (int i = 0; i < dataCate.Count; i++)
                {
                    Nullable<int> IDCate = dataCate[i].IDCategory;
                    var PriceCate = (from od in db.OrderDetails
                                     join p in db.Products on od.ProductID equals p.IDProduct
                                     where p.CategoryID == IDCate && od.CreatedAt >= TuNgay && od.CreatedAt <= DenNgay
                                     select od.TotalOrderDetal).Sum();
                    var PriceTotal = (from od in db.OrderDetails
                                      select od.TotalOrderDetal).Sum();
                    Nullable<decimal> TiLe;
                    if (PriceCate != null)
                    {
                        TiLe = (PriceCate / PriceTotal) * 100;
                    }
                    else
                    {
                        TiLe = 0;
                    }
                    Data.Add(new Model() { NameCategory = dataCate[i].NameCategory, TiLeDongGop = Math.Round((double)TiLe, 2) });
                }
                NotifyChange("Data");
            }


        }

        private void TuNgayDatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (TuNgayDatePicker.SelectedDate != null)
            {
                TuNgay = Convert.ToDateTime((sender as DatePicker).SelectedDate.ToString());
            }
            if (TuNgayDatePicker.SelectedDate != null && DenNgayDatePicker.SelectedDate != null)
            {
                if (TuNgay.CompareTo(DenNgay) > 0)
                {
                    TuNgayDatePicker.SelectedDate = null;
                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#F03674");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Khoảng thời gian không hợp lệ. Vui lòng chọn lại !");
                }
                else ViewModel();
            }
        }

        private void DenNgayDatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DenNgayDatePicker.SelectedDate != null)
            {
                DenNgay = Convert.ToDateTime((sender as DatePicker).SelectedDate.ToString());
            }
            if (TuNgayDatePicker.SelectedDate != null && DenNgayDatePicker.SelectedDate != null)
            {
                if (TuNgay.CompareTo(DenNgay) > 0)
                {
                    DenNgayDatePicker.SelectedDate = null;
                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#F03674");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Khoảng thời gian không hợp lệ. Vui lòng chọn lại !");
                }
                else ViewModel();
            }
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            ViewModel();
            DataContext = this;
        }

        private void NotifyChange(string v)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(v));
            }
        }
    }
}
