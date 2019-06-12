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

namespace Milestone2.QuanLiComponents
{
    /// <summary>
    /// Interaction logic for usHoaDon.xaml
    /// </summary>
    public partial class usHoaDon : UserControl
    {
        public usHoaDon()
        {
            InitializeComponent();
        }
        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
        List<Purchase> listPu = new List<Purchase>();
        private void UserControl_Initialized(object sender, EventArgs e)
        {
            listPu = new List<Purchase>();
            var productElement = db.Purchases.Select(p => p);
            listPu = productElement.ToList();
            QuanLiHoaDondataGrid.ItemsSource = listPu;
            itemsPerPageComboBox.SelectedIndex = 0;
            LoadPhantrang();

        }
        #region Phantrang
        public void LoadPhantrang()
        {
            Total = listPu.Count();
            itemsPerPage = int.Parse(itemsPerPageComboBox.Text);
            totalPages = (int)Math.Ceiling((decimal)Total / itemsPerPage);

            QuanLiHoaDondataGrid.ItemsSource = listPu
                .Skip((currentPage - 1) * itemsPerPage)
                .Take(itemsPerPage);

            pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";
        }
        int currentPage = 1;
        int itemsPerPage = 0;
        int totalPages = 0;
        private int _total;
        public event PropertyChangedEventHandler PropertyChanged;
        public int Total
        {
            get { return _total; }
            set
            {
                _total = value;
                RaisePropertyChange("Total");
            }
        }

        private void RaisePropertyChange(string propertyname)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyname));
            }
        }

        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            if (listPu.Count != 0)
            {
                if (currentPage < totalPages)
                {
                    currentPage++;
                    QuanLiHoaDondataGrid.ItemsSource = listPu
                        .Skip((currentPage - 1) * itemsPerPage)
                        .Take(itemsPerPage);
                    pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";

                }
            }
        }

        private void PreviousButton_Click(object sender, RoutedEventArgs e)
        {
            if (listPu.Count != 0)
            {
                if (currentPage > 1)
                {
                    currentPage--;
                    QuanLiHoaDondataGrid.ItemsSource = listPu
                        .Skip((currentPage - 1) * itemsPerPage)
                        .Take(itemsPerPage);
                    pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";

                }
            }
        }
        private void ItemsPerPageComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var combobox = sender as ComboBox;
            var item = combobox.SelectedValue.ToString();

            string temp = item.Split(' ')[1];
            itemsPerPage = int.Parse(temp);
            totalPages = (int)Math.Ceiling((decimal)Total / itemsPerPage);

            QuanLiHoaDondataGrid.ItemsSource = listPu
                .Skip((currentPage - 1) * itemsPerPage)
                .Take(itemsPerPage);

            pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";

        }
        #endregion
        #region MOUSE - LEAVE, ENTER
        private void MouseLeave(object sender, MouseEventArgs e)
        {
            BrushConverter bc = new BrushConverter();
            Brush brush = (Brush)bc.ConvertFrom("#F0F3FF");
            (sender as Button).Background = brush;
            BrushConverter fr = new BrushConverter();
            Brush brushFr = (Brush)fr.ConvertFrom("#686CFA");
            (sender as Button).Foreground = brushFr;
        }

        private void MouseEnter(object sender, MouseEventArgs e)
        {
            BrushConverter bc = new BrushConverter();
            Brush brush = (Brush)bc.ConvertFrom("#5D78FF");
            (sender as Button).Background = brush;
            (sender as Button).Foreground = Brushes.White;
        }
        #endregion

        #region LỌC SẢN PHẨM
        private void LocHienTatCaButton_Click(object sender, RoutedEventArgs e)
        {
            LocTrangThaiComboBox.SelectedIndex = -1;
            LocGiaTienComboBox.SelectedItem = null;
            NgayBatDauDatePicker.SelectedDate = null;
            NgayKetThucDatePicker.SelectedDate = null;
			LoadDanhSachHoaDon();
			LoadPhantrang();
        }

        private void LocTrangThaiComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadDanhSachHoaDon();
        }

        private void LocGiaTienComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadDanhSachHoaDon();
        }
        DateTime ngayBD = new DateTime();
        DateTime ngayKT = new DateTime();
        private void NgayBatDauDatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (NgayBatDauDatePicker.SelectedDate != null)
            {
                string text = "";
                text = NgayBatDauDatePicker.SelectedDate.ToString();
                ngayBD = Convert.ToDateTime(text);
            }

            if (NgayKetThucDatePicker.SelectedDate != null && NgayBatDauDatePicker.SelectedDate != null)
            {

                if (ngayBD.CompareTo(ngayKT) > 0)
                {
                    NgayBatDauDatePicker.SelectedDate = null;
                    //NgayKetThucDatePicker.SelectedDate = null;

                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#F03674");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Ngày bắt đầu lớn hơn ngày kết thúc. Vui lòng nhập lại!");
                }
                else
                {
                    LoadDanhSachHoaDon();
                }

            }
        }

        private void NgayKetThucDatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (NgayKetThucDatePicker.SelectedDate != null)
            {
                string text = "";
                text = NgayKetThucDatePicker.SelectedDate.ToString();
                ngayKT = Convert.ToDateTime(text);
            }

            if (NgayBatDauDatePicker.SelectedDate != null && NgayKetThucDatePicker.SelectedDate != null)
            {
                if (ngayBD.CompareTo(ngayKT) > 0)
                {
                    NgayKetThucDatePicker.SelectedDate = null;
                    //NgayBatDauDatePicker.SelectedDate = null;
                    
                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#F03674");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Ngày bắt đầu lớn hơn ngày kết thúc. Vui lòng nhập lại!");
                }
                else
                {
                    LoadDanhSachHoaDon();
                }
            }
        }
        private void LoadDanhSachHoaDon()
        {
            string _statusCb = "";
            Nullable<decimal> _giabd;
            Nullable<decimal> _giakt;
            string query = "Select * from Purchase Where 1 = 1 ";
            string queryStatus = "";
            string queryTotal = "";
            string queryDate = "";
            if (LocTrangThaiComboBox.SelectedIndex != -1)
            {
                var _index = LocTrangThaiComboBox.SelectedIndex;
                switch (_index)
                {
                    case 0:
                        _statusCb = "New";
                        break;
                    case 1:
                        _statusCb = "Complete";
                        break;
                    case 2:
                        _statusCb = "Cancelled";
                        break;
                }
                queryStatus = String.Format(" and Status = '{0}'", _statusCb);
                query += queryStatus;
            }
            if (LocGiaTienComboBox.SelectedItem != null)
            {

                string[] _index = LocGiaTienComboBox.SelectedItem.ToString().Split(' ');

                try
                {
                    _giabd = Convert.ToDecimal(_index[1].Replace(".", ""));
                    _giakt = Convert.ToDecimal(_index[4].Replace(".", ""));

                    queryTotal = String.Format(" and (Total >= {0} and Total <= {1})", _giabd, _giakt);
                }
                catch (FormatException)
                {
                    _giabd = Convert.ToDecimal(_index[2].Replace(".", ""));
                    queryTotal = String.Format(" and Total >= {0}", _giabd);
                }
                query += queryTotal;
            }
            if (NgayKetThucDatePicker.SelectedDate != null && NgayBatDauDatePicker.SelectedDate != null)
            {
                queryDate = String.Format(" and (CAST(CreatedAt as date) >= '{0}' and CAST(CreatedAt as date) <= '{1}')", ngayBD.Date.ToString(), ngayKT.Date.ToString());
                query += queryDate;
            }

            listPu = db.Purchases.SqlQuery(query).ToList<Purchase>();
            QuanLiHoaDondataGrid.ItemsSource = listPu;
            LoadPhantrang();

        }

        #endregion

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            var _purchase = QuanLiHoaDondataGrid.SelectedItem as Purchase;

            var data = db.Purchases.Where(p => p.IDPurchase == _purchase.IDPurchase).Select(p => p).ToList().Last();
            var datadetail = db.OrderDetails.Where(p => p.PurchaseID == _purchase.IDPurchase).Select(p => p).ToList();
            MessageBoxResult result =  MessageBox.Show("Bạn có muốn xóa hóa đơn này không ?", "Thông báo", MessageBoxButton.YesNo);
            if(result == MessageBoxResult.Yes)
            {
                int i = 0;
                while(i<datadetail.Count){
                    db.OrderDetails.Remove(datadetail[i]);
                    i++;
                }
                db.SaveChanges();
                db.Purchases.Remove(data);
                db.SaveChanges();
                LoadDanhSachHoaDon();
                BrushConverter bc = new BrushConverter();
                Brush brush = (Brush)bc.ConvertFrom("#1CBFAE");
                ThongBaoSnackbar.Background = brush;
                ThongBaoSnackbar.MessageQueue.Enqueue("Xóa hóa đơn thành công.");
            }
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            var _purchase = QuanLiHoaDondataGrid.SelectedItem as Purchase;
            var screen = new SuaHoaDon(_purchase.Status,_purchase.IDPurchase);
            if(screen.ShowDialog() == true)
            {
                var newStatus = screen.Status;
                var data = db.Purchases.First(p => p.IDPurchase == _purchase.IDPurchase);
                data.Status = newStatus;
                data.UpdateAt = DateTime.Now;
                db.SaveChanges();
                LoadDanhSachHoaDon();
                BrushConverter bc = new BrushConverter();
                Brush brush = (Brush)bc.ConvertFrom("#1CBFAE");
                ThongBaoSnackbar.Background = brush;
                ThongBaoSnackbar.MessageQueue.Enqueue("Cập nhật hóa đơn thành công.");
            }
        }
    }
}
