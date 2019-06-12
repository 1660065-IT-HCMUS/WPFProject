using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
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

namespace Milestone2
{
    /// <summary>
    /// Interaction logic for usHienThiToanBoSanPham.xaml
    /// </summary>
    public partial class usHienThiToanBoSanPham : UserControl
    {
        public usHienThiToanBoSanPham()
        {
            InitializeComponent();
        }
        public string Name { get; set; }
        public string Price { get; set; }
        public string Quantity { get; set; }
        public string Info { get; set; }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void UserControl_Initialized(object sender, EventArgs e)
        {
            //Hien thi danh sach san pham de ban hang
            SanPhamDatabaseEntities productDB = new SanPhamDatabaseEntities();
            var productElement = productDB.Products.Select(p => p);
            list = productElement.ToList();
            HienThiToanBoListView.ItemsSource = list;
            

            #region PHÂN TRANG
            //Phan trang
            Total = productDB.Products.ToList().Count();
            //Get products quantity of every categories.           
            this.DataContext = this;

            itemsPerPage = int.Parse(itemsPerPageComboBox.Text);
            totalPages = (int)Math.Ceiling((decimal)Total / itemsPerPage);

            HienThiToanBoListView.ItemsSource = list
                .Skip((currentPage - 1) * itemsPerPage)
                .Take(itemsPerPage);

            pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";
            #endregion


        }

        BindingList<OrderDetail> _detail = new BindingList<OrderDetail>();

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

        #region PHÂN TRANG
        List<Product> list = null;
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

        private void ItemsPerPageComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var combobox = sender as ComboBox;
            var item = combobox.SelectedValue.ToString();
            
            string temp = item.Split(' ')[1];
            if (temp.Equals("Tất_cả") == false)
            {
                itemsPerPage = int.Parse(temp);
                totalPages = (int)Math.Ceiling((decimal)Total / itemsPerPage);

                HienThiToanBoListView.ItemsSource = list
                    .Skip((currentPage - 1) * itemsPerPage)
                    .Take(itemsPerPage);

                pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";
            }
            else
            {
                SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
                itemsPerPage = (from x in db.Products select x).ToList().Count();
                totalPages = (int)Math.Ceiling((decimal)Total / itemsPerPage);

                HienThiToanBoListView.ItemsSource = list
                    .Skip((currentPage - 1) * itemsPerPage)
                    .Take(itemsPerPage);

                pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";
            }
        }

        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage < totalPages)
            {
                currentPage++;
                HienThiToanBoListView.ItemsSource = list
                    .Skip((currentPage - 1) * itemsPerPage)
                    .Take(itemsPerPage);
                pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";

            }
        }

        private void PreviousButton_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage > 1)
            {
                currentPage--;
                HienThiToanBoListView.ItemsSource = list
                    .Skip((currentPage - 1) * itemsPerPage)
                    .Take(itemsPerPage);
                pagingInfoLabel.Content = $"Trang {currentPage} của {totalPages}";

            }
        }
        #endregion

        #region XÓA SẢN PHẨM
        private void XoaSanPham_Click(object sender, RoutedEventArgs e)
        {
            var pro = (sender as Button).DataContext as Product;

            if (pro != null)
            {
                var data = new SanPhamDatabaseEntities();
                var getData = (
                     from x in data.Products
                     where x.IDProduct == pro.IDProduct
                     select x
                ).ToList().Last();
                MessageBoxResult result =  MessageBox.Show("Bạn có muốn xóa không ?", "Thông báo", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    try
                    {
                        data.Products.Remove(getData);
                        data.SaveChanges();
                        UserControl_Initialized(sender, e);
                        MessageBox.Show("Xóa thành công !");
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Bạn không thể xóa sản phẩm này !");
                    }
                   
                }
            }
            else
            {
                MessageBox.Show("Xóa không thành công !");
            }
        }
        #endregion

        Product _newProduct;
        public string NewName { get; set; }
        private void SuaBtn_Click(object sender, RoutedEventArgs e)
        {
            var pro = (sender as Button).DataContext as Product;
            _newProduct = pro;
            txtUpdateName.Text = _newProduct.NameProduct;
            txtUpdatePrice.Text = String.Format("{0:0,0}", (int)_newProduct.PriceProduct);
            txtUpdateQuantity.Text = _newProduct.QuantityProduct.ToString();
            txtUpdateInfo.Text = _newProduct.InfoProduct;
            var baseFolder = AppDomain.CurrentDomain.BaseDirectory;
            var imagePath = baseFolder + @"Images\" + _newProduct.ImageProduct;
            imageUpdate.Source = new BitmapImage(new Uri(imagePath, UriKind.Absolute));
        }

        private void ChooseImageBtn_Click(object sender, RoutedEventArgs e)
        {
            var baseFolder = AppDomain.CurrentDomain.BaseDirectory;
            OpenFileDialog imagePath = new OpenFileDialog();
            imagePath.Filter = "Image files (*.png;*.jpeg;*.jpg)|*.png;*.jpeg;*.jpg";
            imagePath.Multiselect = false;
            if (imagePath.ShowDialog() == true)
            {
                var filename = imagePath.FileName;
                var info = new FileInfo(filename);

                var newName = Guid.NewGuid() + info.Extension;

                info.CopyTo(baseFolder + @"Images\" + newName);
                NewName = newName;
                imageUpdate.Source = new BitmapImage(new Uri(baseFolder + @"Images\" + NewName, UriKind.Absolute));
            }
        }

        private void OkBtn_Click(object sender, RoutedEventArgs e)
        {
            SanPhamDatabaseEntities _data = new SanPhamDatabaseEntities();
            var getdata = (
                    from x in _data.Products
                    where x.IDProduct == _newProduct.IDProduct
                    select x
                ).ToList().Last();

            _newProduct.NameProduct = getdata.NameProduct = txtUpdateName.Text;
            _newProduct.PriceProduct = getdata.PriceProduct = decimal.Parse(txtUpdatePrice.Text);
            _newProduct.QuantityProduct = getdata.QuantityProduct = int.Parse(txtUpdateQuantity.Text);
            _newProduct.InfoProduct = getdata.InfoProduct = txtUpdateInfo.Text;
            if (NewName != null)
            {
                _newProduct.ImageProduct = getdata.ImageProduct = NewName;
            }

            _data.SaveChanges();
            MessageBox.Show("Cập nhật thành công !", "Thông báo");
        }
    }
}
