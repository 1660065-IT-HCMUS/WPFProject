using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace Milestone2.QuanLiComponents
{
    /// <summary>
    /// Interaction logic for usHienThiTheoLoai.xaml
    /// </summary>
    public partial class usHienThiTheoLoai : UserControl
    {
        public usHienThiTheoLoai()
        {
            InitializeComponent();
        }
        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
        private void UserControl_Initialized(object sender, EventArgs e)
        {          
            loaiCategory.ItemsSource = db.Categories.Select(p => p).ToList();
            DataContext = this;
        }

        //Xử lý khi nhấn chọn loại:
        Category _cate { get; set; }
        private void LoaiCategory_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var temp = sender as ListBox;
            _cate = temp.SelectedValue as Category;
            HienThiTheoLoaiListView.ItemsSource = db.Products.Where(p => p.CategoryID == _cate.IDCategory).Select(p => p).ToList();
        }

        private  async void XoaSanPham_Click(object sender, RoutedEventArgs e)
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
                MessageBoxResult result = MessageBox.Show("Bạn có muốn xóa không ?", "Thông báo", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    try
                    {
                        data.Products.Remove(getData);
                        await data.SaveChangesAsync();
                        HienThiTheoLoaiListView.ItemsSource = db.Products.Where(p => p.CategoryID == _cate.IDCategory).Select(p => p).ToList();
                        this.DataContext = this;
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
