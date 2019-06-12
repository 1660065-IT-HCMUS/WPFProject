using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Security.Principal;
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
    /// Interaction logic for usSanPham.xaml
    /// </summary>
    public partial class usSanPham : UserControl, INotifyPropertyChanged
    {
        usHienThiTheoLoai us = new usHienThiTheoLoai();
        usHienThiToanBoSanPham ustb = new usHienThiToanBoSanPham();
        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
        public string Name { get; set; }
        public string Price { get; set; }
        public string Quantity { get; set; }
        public string Info { get; set; }
        public usSanPham()
        {
            InitializeComponent();

        }

        private void HienThiTheoLoaiBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

        }
        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            cbbInsertCategory.ItemsSource = db.Categories.Select(elCategory => elCategory.NameCategory).ToList();
            this.DataContext = this;
        }
        //Xử lý hiện theo loại:
        private void HienThiTheoLoaiBtn_MouseLeftButtonDown(object sender, RoutedEventArgs e)
        {
            lbPage.Text = "Theo loại sản phẩm";
            gridSanPham.Content = us;
            this.DataContext = this;
        }

        private void HienThiTatCa_MouseLeftButtonDown(object sender, RoutedEventArgs e)
        {
            lbPage.Text = "Tất cả sản phẩm";
            gridSanPham.Content = ustb;
            this.DataContext = this;
        }
        public void ResetGT()
        {
            txtInsertName.Text = txtInsertInfo.Text = txtInsertPrice.Text = txtInsertQuantity.Text = "";
            cbbInsertCategory.SelectedIndex = -1;
            Image.Source = null;
        }
        private void InsertProductBtn_Click(object sender, RoutedEventArgs e)
        {
            if (CheckValidation.CheckName(txtInsertName.Text)
                && CheckValidation.CheckPriceAndQuantity(txtInsertPrice.Text, txtInsertQuantity.Text)
                )
            {
                var cate = db.Categories.Where(x=>x.NameCategory == cbbInsertCategory.SelectedValue).Select(x=>x).ToList().Last();
                var sanpham = new Product()
                {
                    NameProduct = txtInsertName.Text,
                    PriceProduct = Decimal.Parse(txtInsertPrice.Text),
                    QuantityProduct = int.Parse(txtInsertQuantity.Text),
                    ImageProduct = _nameImages,
                    InfoProduct = txtInsertInfo.Text,
                    CategoryID = cate.IDCategory
                };
                db.Products.Add(sanpham);
                db.SaveChanges();
                ResetGT();
            }
            else
            {
                MessageBox.Show("Thông tin sản phẩm không hợp lệ. Vui lòng kiểm tra lại !","Thông báo",MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }
        private string _nameImages;

        public event PropertyChangedEventHandler PropertyChanged;

        public string NameImages
        {
            get { return _nameImages; }
            set
            {
                if (value != null)
                    _nameImages = value;
                RaisePropertyChange("NameImages");
            }

        }

        private void RaisePropertyChange(string v)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(v));
            }
        }

        private void ChooseImageBtn_Click(object sender, RoutedEventArgs e)
        {
            string currentFolder = AppDomain.CurrentDomain.BaseDirectory;
            var baseFolder = currentFolder.Substring(0, currentFolder.Length - 1);
			
			var sc = new OpenFileDialog();
            sc.Multiselect = false; //Don't choose multi files.
            sc.Filter = "Image files (*.png;*.jpeg;*.jpg)|*.png;*.jpeg;*.jpg";
			
			//Xét quyền cho thư mục Images.
			//try
			//{
			//	DirectoryInfo dInfo = new DirectoryInfo(baseFolder + @"\Images");
			//	IdentityReference everyoneIdentity = new SecurityIdentifier(WellKnownSidType.WorldSid, null);
			//	DirectorySecurity ds = dInfo.GetAccessControl();
			//	ds.AddAccessRule(new FileSystemAccessRule(everyoneIdentity, FileSystemRights.FullControl, AccessControlType.Allow));
			//	dInfo.SetAccessControl(ds);
			//}
			//catch(Exception exc)
			//{

			//}
			

			if (sc.ShowDialog() == true)
            {
				try
				{
					var filename = sc.FileName;
					var info = new FileInfo(filename);

					var newName = Guid.NewGuid() + info.Extension;
					info.CopyTo(baseFolder + @"\Images\" + newName);
					NameImages = newName;
					NameImages = NameImages;
				}
				catch(Exception ex)
				{
					MessageBox.Show(ex.Message);
				}

                
            }
        }

        private void UserControl_Initialized(object sender, EventArgs e)
        {
            lbPage.Text = "Tất cả sản phẩm";
            gridSanPham.Content = ustb;
            this.DataContext = this;
        }
    }
}
