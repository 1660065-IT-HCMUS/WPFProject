using MaterialDesignThemes.Wpf;
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
    /// Interaction logic for usLoaiSanPham.xaml
    /// </summary>
    public partial class usLoaiSanPham : UserControl
    {
        public usLoaiSanPham()
        {
            InitializeComponent();
        }
        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
        public string txtUpdate { get; set; }

        private void InsertCategory_Click(object sender, RoutedEventArgs e)
        {
            Category _category = new Category();
            if (txtInsertCategory.Text != null)
            {
                var getdata = (from x in db.Categories where x.NameCategory == txtInsertCategory.Text select x).ToList();
                if (getdata.Count == 0)
                {
                    _category.NameCategory = txtInsertCategory.Text;
                    db.Categories.Add(_category);
                    db.SaveChanges();

                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#1CBFAE");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Thêm loại sản phẩm thành công!");
                    UserControl_Loaded(sender, e);
                }
                else
                {
                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#F03674");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Thêm loại sản phẩm thất bại!");
                }
            }
        }

        private void Button_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var card = sender as Card;
            var content = card.DataContext as Category;
           
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            gridCate.Children.Clear();
            gridCate.Children.Add(new usDetailCategory());
        }

        private void InsertNewCategory_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            openInsertDialog.IsOpen = true;
        }
    }
}
