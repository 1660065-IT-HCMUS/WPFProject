using Aspose.Cells;
using Microsoft.Win32;
using Milestone2.QuanLiComponents;
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
    /// Interaction logic for usQuanLi.xaml
    /// </summary>
    public partial class usQuanLi : UserControl,INotifyPropertyChanged
    {
        public String message;
        public String Message { get => message; set { message = value; NotifyChange("message"); }}

        public usQuanLi()
        {
            InitializeComponent();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void NotifyChange(string v)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged?.Invoke(this,
                    new PropertyChangedEventArgs(v));
            }
        }

        private void RadioSanPham_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

        }

        private void RadioSanPham_MouseLeftButtonDown(object sender, RoutedEventArgs e)
        {
            gridQuanLi.Children.Clear();
            gridQuanLi.Children.Add(new usSanPham());
        }

        private void ListBox_MouseEnter(object sender, MouseEventArgs e)
        {
            BrushConverter bc = new BrushConverter();
            Brush brush = (Brush)bc.ConvertFrom("#686CFA");
            brush.Freeze();
            //  lboxImport.Foreground = brush;
            //  lboxImport.Background = Brushes.White;
        }

        private void ListBox_MouseLeave(object sender, MouseEventArgs e)
        {
            // lboxImport.Foreground = Brushes.Silver;
        }


       

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            dialog.IsOpen = false;
        }

        //Xử lý import excel:
        private void ImportBtn_Click(object sender, RoutedEventArgs e)
        {
            var db = new SanPhamDatabaseEntities();
            string currentFolder = AppDomain.CurrentDomain.BaseDirectory;
            var baseFolder = currentFolder.Substring(0, currentFolder.Length - 1);
            var screen = new OpenFileDialog();
            screen.Multiselect = false; //Don't choose multi files.
            screen.Filter = "xlsx file|*.xlsx"; //Filter only xlsx file.
            if (screen.ShowDialog() == true)
            {
                var filename = screen.FileName;
                var info = new FileInfo(filename);
                var workbook = new Workbook(filename);
                var folder = info.Directory;

                for (int i = 0; i < workbook.Worksheets.Count(); i++)
                {
                    var sheet = workbook.Worksheets[i];

                    var getDataCategory1 = (from x in db.Categories where x.NameCategory == sheet.Name select x).ToList();

                    if (getDataCategory1.Count == 0)
                    {
                        var category = new Category()
                        {
                            NameCategory = sheet.Name
                        };
                        db.Categories.Add(category);
                        db.SaveChanges();
                    }

                    var column = 'C';
                    var row = 4;
                    var cell = sheet.Cells[$"{column}{row}"];
                    while (cell.Value != null)
                    {
                        var name = sheet.Cells[$"C{row}"].StringValue;
                        var price = int.Parse(sheet.Cells[$"D{row}"].StringValue);
                        var quantity = int.Parse(sheet.Cells[$"E{row}"].StringValue);
                        var image = sheet.Cells[$"F{row}"].StringValue;

                        image = folder + @"\imagesSource\img\" + image;
                        var imgInfo = new FileInfo(image);

                        var newName = Guid.NewGuid()
                            + imgInfo.Extension;

                        imgInfo.CopyTo(baseFolder + @"\Images\" +
                            newName);
                        var infor = sheet.Cells[$"G{row}"].StringValue;

                        var idCategory = (from x in db.Categories where x.NameCategory == sheet.Name select x.IDCategory).ToList().Last();

                        var sanpham = new Product()
                        {
                            NameProduct = name,
                            PriceProduct = price,
                            QuantityProduct = quantity,
                            ImageProduct = newName,
                            InfoProduct = infor,
                            CategoryID = idCategory
                        };
                        db.Products.Add(sanpham);
                        row++;
                        cell = sheet.Cells[$"{column}{row}"];
                    }
                }
                dialog.IsOpen = true;
                db.SaveChanges();
               // UserControl_Loaded(sender, e);
              //  listViewHandler(sender, e);
            }

           
        }

        private void UserControl_Initialized(object sender, EventArgs e)
        {
            gridQuanLi.Children.Clear();
            gridQuanLi.Children.Add(new usSanPham());
        }

        private void RadioHoaDon_Click(object sender, RoutedEventArgs e)
        {
            gridQuanLi.Children.Clear();
            gridQuanLi.Children.Add(new usHoaDon());
        }

        private void RadioLoai_Click(object sender, RoutedEventArgs e)
        {
            gridQuanLi.Children.Clear();
            gridQuanLi.Children.Add(new usLoaiSanPham());
        }
    }
}
