using Milestone2.BaoCaoComponents.BieuDoCot;
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
    /// Interaction logic for usTKSoLuongSP.xaml
    /// </summary>
    public partial class usTKSoLuongSP : UserControl, INotifyPropertyChanged
    {
        public usTKSoLuongSP()
        {
            InitializeComponent();
        }
        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
        public void ViewModel()
        {
            this.SneakersDetail = new ObservableCollection<Model>();

            if (TuNgayDatePicker.SelectedDate != null && DenNgayDatePicker.SelectedDate != null)
            {
                SneakersDetail.Clear();
                var dataCate = db.Categories.Select(p => p).ToList();
                for (int i = 0; i < dataCate.Count; i++)
                {
                    Nullable<int> IDCate = dataCate[i].IDCategory;
                    var QuantityResult = (from od in db.OrderDetails
                                          join p in db.Products on od.ProductID equals p.IDProduct
                                          where p.CategoryID == IDCate && od.CreatedAt >= TuNgay && od.CreatedAt <= DenNgay
                                          select od.QuantityOrderDetail).Sum();

                    if (QuantityResult != null)
                    {
                        SneakersDetail.Add(new Model() { NCategory = dataCate[i].NameCategory, ItemsCount = (int)QuantityResult });
                    }
                    else
                    {
                        SneakersDetail.Add(new Model() { NCategory = dataCate[i].NameCategory, ItemsCount = 0 });
                    }

                }
                NotifyChange("SneakersDetail");
            }
        }

        private void NotifyChange(string v)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(v));
            }
        }

        public ObservableCollection<Model> SneakersDetail { get; set; }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            ViewModel();
            DataContext = this;
        }

        public DateTime TuNgay, DenNgay;

        public event PropertyChangedEventHandler PropertyChanged;

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
    }
}
