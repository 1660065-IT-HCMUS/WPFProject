using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

namespace Milestone2
{
    /// <summary>
    /// Interaction logic for usBanHang.xaml
    /// </summary>
    public partial class usBanHang : UserControl, INotifyPropertyChanged
    {
        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();

        public event PropertyChangedEventHandler PropertyChanged;

        public usBanHang()
        {
            InitializeComponent();
        }
        private int totalProduct;
        public int TotalProduct { get
            {
                return totalProduct;
            }

                 set
            {
                if (value != null)
                {
                    totalProduct = value;
                    NotifyChange("TotalProduct");
                }
            }
            }
        private void LuuBtn_Click(object sender, RoutedEventArgs e)
        {
            if (_detail.Count != 0)
            {
                SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
                //Tạo dữ liệu cho Đơn hàng
                Purchase order;
                if (DaThanhToanCheckBox.IsChecked != true)
                {
                    order = new Purchase
                    {
                        CreatedAt = DateTime.Now,
                        UpdateAt = DateTime.Now,
                        Status = "New",
                        Total = FinalTotal
                    };
                }
                else
                {
                    order = new Purchase
                    {
                        CreatedAt = DateTime.Now,
                        UpdateAt = DateTime.Now,
                        Status = "Complete",
                        Total = FinalTotal
                    };
                }
                db.Purchases.Add(order);
                db.SaveChanges();

                foreach (var detail in _detail)
                {
                    //Tạo dữ liệu từ _detail để thêm vào CSDL
                    var orderDetail = new OrderDetail()
                    {
                        ProductID = detail.ProductID,
                        PriceOrderDetail = detail.PriceOrderDetail,
                        QuantityOrderDetail = detail.QuantityOrderDetail,
                        TotalOrderDetal = detail.TotalOrderDetal,
                        //Lấy ID đơn hàng vừa tạo để update cho chi tiết đơn hàng
                        PurchaseID = order.IDPurchase,
                        CreatedAt = DateTime.Now,
                        UpdateAt = DateTime.Now
                    };
                    db.OrderDetails.Add(orderDetail);
                }
                db.SaveChanges();

                //Làm mới _detail = Chi tiết đơn hàng
                _detail = new BindingList<OrderDetail>();

                donHangDataGrid.ItemsSource = _detail;
                NotifyChange("FinalTotal");

                BrushConverter bc = new BrushConverter();
                Brush brush = (Brush)bc.ConvertFrom("#1CBFAE");
                brush.Freeze();
                ThongBaoSnackbar.Background = brush;
                ThongBaoSnackbar.MessageQueue.Enqueue("Thêm đơn hàng thành công!");
                TotalProduct = 0;
            }
            else
            {
                BrushConverter bc = new BrushConverter();
                Brush brush = (Brush)bc.ConvertFrom("#F03674");
                brush.Freeze();
                ThongBaoSnackbar.Background = brush;
                ThongBaoSnackbar.MessageQueue.Enqueue("Đơn hàng trống!");
            }
          
        }


        BindingList<OrderDetail> _detail = new BindingList<OrderDetail>();
        Product _productname;

        public Nullable<decimal> FinalTotal => _detail.Sum(p => p.TotalOrderDetal);

        private void NotifyChange(string v)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(v));
            }
        }

        private void UserControl_Initialized(object sender, EventArgs e)
        {
            db.Products.Load();
            ListPro = db.Products.Local.ToList();
            hienThiSanPhamListView.ItemsSource = ListPro;
            itemsPerPageComboBox.SelectedIndex = 0;
            //Load dữ liệu CB
            FilterCateComboBox.ItemsSource = db.Categories.Select(p => p.NameCategory).ToList();

            LoadPhantrang();

            DataContext = this;
        }

        public string keyword { get; set; }
        //Tìm kiếm nhanh theo tên
        private void KeyWordTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
             keyword = KeyWordTextBox.Text;

            hienThiSanPhamListView.ItemsSource = db.Products.Local.Where(
                p => p.NameProduct.ToLower().Contains(keyword.ToLower()))
                .ToList();
        }

        private void SoLuongTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

            var Quantity = (sender as TextBox).Text;
            if (Quantity != "")
            {
                if (int.Parse(Quantity) != 0)
                {
                    var _productOrder = (sender as TextBox).DataContext as OrderDetail;

                    var foundProduct = _detail.FirstOrDefault(p => p.ProductID == _productOrder.ProductID);


                    if (foundProduct != null)
                    {
                        foundProduct.QuantityOrderDetail = int.Parse(Quantity);
                        foundProduct.TotalOrderDetal = Convert.ToInt32(foundProduct.QuantityOrderDetail * foundProduct.PriceOrderDetail);
                    }
                    donHangDataGrid.ItemsSource = _detail;
                    NotifyChange("FinalTotal");
                }
            }
        }

        private void SoLuongTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void XoaDonHangButton_Click(object sender, RoutedEventArgs e)
        {
            var _OrderDetail = (sender as Button).DataContext as OrderDetail;
            for (int i = 0; i < _detail.Count; i++)
            {
                if (_detail[i].ProductID == _OrderDetail.ProductID)
                {
                    _detail.RemoveAt(i);
                    donHangDataGrid.ItemsSource = _detail;
                    NotifyChange("FinalTotal");
                    break;
                }
            }
        }

        private void GridProduct_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var _gridView = sender as Card;
            var _productOrder = _gridView.DataContext as Product;
            _productname = _productOrder;

            var foundProduct = /*_detailsss.OrderDetails.Where(elOrder => elOrder.IDProduct == _productOrder.ID).Select(elOrder => elOrder).ToList();*/
                _detail.FirstOrDefault(p => p.ProductID == _productOrder.IDProduct);


            if (foundProduct != null)
            {
                foundProduct.QuantityOrderDetail++;
                foundProduct.TotalOrderDetal = Convert.ToInt32(foundProduct.QuantityOrderDetail * foundProduct.PriceOrderDetail);
            }
            else
            {
                var detail = new OrderDetail()
                {
                    QuantityOrderDetail = 1,
                    Product = _productOrder,
                    PriceOrderDetail = _productOrder.PriceProduct,
                    ProductID = _productOrder.IDProduct,
                    TotalOrderDetal = _productOrder.PriceProduct
                };
                _detail.Add(detail);
            }

            donHangDataGrid.ItemsSource = _detail;
            TotalProduct++;
            DataContext = this;
            NotifyChange("FinalTotal");
        }

        #region PHÂN TRANG
        List<Product> ListPro = new List<Product>();
        public void LoadPhantrang()
        {
            Total = ListPro.Count();
            itemsPerPage = int.Parse(itemsPerPageComboBox.Text);
            totalPages = (int)Math.Ceiling((decimal)Total / itemsPerPage);

            hienThiSanPhamListView.ItemsSource = ListPro
                .Skip((currentPage - 1) * itemsPerPage)
                .Take(itemsPerPage);

            pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";
        }
        int currentPage = 1;
        int itemsPerPage = 0;
        int totalPages = 0;
        private int _total;
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
        private void PreviousButton_Click(object sender, RoutedEventArgs e)
        {
            if (ListPro.Count != 0)
            {
                if (currentPage > 1)
                {
                    currentPage--;
                    hienThiSanPhamListView.ItemsSource = ListPro
                        .Skip((currentPage - 1) * itemsPerPage)
                        .Take(itemsPerPage);
                    pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";

                }
            }
        }

        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            if (ListPro.Count != 0)
            {
                if (currentPage < totalPages)
                {
                    currentPage++;
                    hienThiSanPhamListView.ItemsSource = ListPro
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

            hienThiSanPhamListView.ItemsSource = ListPro
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

        private void FilterPriceCombobox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            loadProduct();
        }

        private void FilterCateComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            loadProduct();
        }
        private void loadProduct()
        {
            string _CategoryCb = "";
            Nullable<decimal> _giabd;
            Nullable<decimal> _giakt;
            string query = "Select * from Product Where 1 = 1 ";
            string queryCategory = "";
            string queryPrice = "";

            if (FilterCateComboBox.SelectedIndex != -1)
            {
                _CategoryCb = FilterCateComboBox.SelectedItem.ToString();
                var listCate = from cate in db.Categories
                               where cate.NameCategory == _CategoryCb
                               select cate;
                int idCate = listCate.ToList()[0].IDCategory;

                queryCategory = String.Format(" and CategoryID = {0}", idCate);
                query += queryCategory;
            }
            if (FilterPriceComboBox.SelectedItem != null)
            {

                string[] _index = FilterPriceComboBox.SelectedItem.ToString().Split(' ');

                try
                {
                    _giabd = Convert.ToDecimal(_index[1].Replace(".", ""));
                    _giakt = Convert.ToDecimal(_index[4].Replace(".", ""));

                    queryPrice = String.Format(" and (PriceProduct >= {0} and PriceProduct <= {1})", _giabd, _giakt);
                }
                catch (FormatException)
                {
                    _giabd = Convert.ToDecimal(_index[2].Replace(".", ""));
                    queryPrice = String.Format(" and PriceProduct >= {0}", _giabd);
                }
                query += queryPrice;
            }

            ListPro = db.Products.SqlQuery(query).ToList<Product>();
            hienThiSanPhamListView.ItemsSource = ListPro;
            LoadPhantrang();
        }

        private void AllProduct_Click(object sender, RoutedEventArgs e)
        {

            //snack.MessageQueue.Enqueue("Lưu thành công!");

            UserControl_Initialized(sender, e);
            LoadPhantrang();
            FilterCateComboBox.SelectedIndex = -1;
            FilterPriceComboBox.SelectedItem = null;
			KeyWordTextBox.Text = null;

		}
    }
}
