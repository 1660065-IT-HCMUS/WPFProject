using MaterialDesignThemes.Wpf;
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

namespace Milestone2.QuanLiComponents
{
    /// <summary>
    /// Interaction logic for usDetailCategory.xaml
    /// </summary>
    public partial class usDetailCategory : UserControl
    {
        public usDetailCategory()
        {
            InitializeComponent();
        }

        SanPhamDatabaseEntities db = new SanPhamDatabaseEntities();
        public string txtUpdate { get; set; }
        public Category _categoryNew { get; set; }


        private void BtnXoaLoai_Click(object sender, RoutedEventArgs e)
        {
            var Cate = (sender as Button).DataContext as Category;

            if (Cate != null)
            {
                if ((from x in db.Products where x.CategoryID == Cate.IDCategory select x).ToList().Count() == 0)
                {
                    var getdata = (from x in db.Categories where x.IDCategory == Cate.IDCategory select x).ToList().Last();
                    db.Categories.Remove(getdata);
                    db.SaveChanges();
                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#1CBFAE");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Đã xoá thành công loại sản phẩm được chọn!");
                    UserControl_Loaded(sender, e);

                }
                else
                {
                    BrushConverter bc = new BrushConverter();
                    Brush brush = (Brush)bc.ConvertFrom("#F03674");
                    ThongBaoSnackbar.Background = brush;
                    ThongBaoSnackbar.MessageQueue.Enqueue("Không thể xoá loại sản phẩm này!");

                }
            }
            else
            {
                BrushConverter bc = new BrushConverter();
                Brush brush = (Brush)bc.ConvertFrom("#F03674");
                ThongBaoSnackbar.Background = brush;
                ThongBaoSnackbar.MessageQueue.Enqueue("Vui lòng chọn loại sản phẩm cần xoá!");
            }
        }

        public Category _nameCategory = null;

        private void Card_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var card = sender as Card;
            var content = card.DataContext as Category;
            txtUpdate = content.NameCategory;
            this.DataContext = this;
            _nameCategory = content;
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            SanPhamDatabaseEntities categoryDB = new SanPhamDatabaseEntities();
            HienThiLoai.ItemsSource = categoryDB.Categories.Select(elCategory => elCategory).ToList();
            DataContext = this;
        }
        //Xử lý cập nhật
        private void UpdateCategory_Click(object sender, RoutedEventArgs e)
        {
            if (txtUpdateCategory.Text != null)
            {
                var getdata = (
                               from x in db.Categories
                               where x.IDCategory == _categoryNew.IDCategory
                               select x).ToList().Last();

                _categoryNew.NameCategory = getdata.NameCategory = txtUpdateCategory.Text; //Thieeu
                db.SaveChanges();

                BrushConverter bc = new BrushConverter();
                Brush brush = (Brush)bc.ConvertFrom("#1CBFAE");
                ThongBaoSnackbar.Background = brush;
                ThongBaoSnackbar.MessageQueue.Enqueue("Cập nhật thông tin loại sản phẩm thành công!");
            }
            else
            {
                BrushConverter bc = new BrushConverter();
                Brush brush = (Brush)bc.ConvertFrom("#1CBFAE");
                ThongBaoSnackbar.Background = brush;
                ThongBaoSnackbar.MessageQueue.Enqueue("Cập nhật thông tin loại sản phẩm không thành công!");
            }
        }

        private void BtnEditCate_Click(object sender, RoutedEventArgs e)
        {
            _categoryNew = (sender as Button).DataContext as Category;
            txtUpdateCategory.Text = _categoryNew.NameCategory;
        }

    }
}
