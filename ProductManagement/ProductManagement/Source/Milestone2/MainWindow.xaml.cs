using MaterialDesignThemes.Wpf;
using Milestone2.BaoCaoComponents;
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

namespace Milestone2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            AppDomain.CurrentDomain.SetData("DataDirectory", System.Environment.CurrentDirectory.Replace("\\bin\\Debug", ""));

        }
        usBanHang bh = new usBanHang();
        usQuanLi ql = new usQuanLi();
        usTrangChu tc = new usTrangChu();
        usBaoCao bc = new usBaoCao();
        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            System.Environment.Exit(0);
        }

        private void Application_MouseDown(object sender, MouseButtonEventArgs e)
        {
            //DragMove();
        }


        private void MoveCursorMenu(int index)
        {
            TrainsitionigContentSlide.OnApplyTemplate();
            GridCursor.Margin = new Thickness(0, (50 + (60 * index)), 0, 0);
        }



        private void Xn_MouseEnter(object sender, MouseEventArgs e)
        {
            // (sender as TextBlock).Background = Brushes.Silver;
        }
        private void setHover(Button btn)
        {
            BrushConverter bc = new BrushConverter();
            Brush brush = (Brush)bc.ConvertFrom("#F5F5F9");
            brush.Freeze();
            btn.Background = brush;

        }
        private void setDefault(Button btn)
        {
            btn.Background = Brushes.Transparent;
        }
        private void Bell_MouseEnter(object sender, MouseEventArgs e)
        {
            setHover(sender as Button);
        }

        private void Bell_MouseLeave(object sender, MouseEventArgs e)
        {
            setDefault(sender as Button);
        }

        private void Xn_MouseLeave(object sender, MouseEventArgs e)
        {
            (sender as ListViewItem).Background = Brushes.Transparent;
        }

        private void ListViewMenu_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int index = ListViewMenu.SelectedIndex;
            MoveCursorMenu(index);

            switch (index)
            {
                case 0:
                    // GridFrame.Children.Clear();
                    //   GridFrame.Children.Add(new UserControl1());
                    this.mainContentControl.Content = tc;
                    break;
                case 1:

                    //   GridFrame.Children.Clear();
                    //  GridFrame.Children.Add(new usBanHang());
                    this.mainContentControl.Content = bh;
                    ql = new usQuanLi();
                    break;
                case 2:
                    this.mainContentControl.Content = ql;
                   

                    break;
                case 3:
                    this.mainContentControl.Content = bc;
                    break;
                case 4:
                    this.mainContentControl.Content = new usThongtin();
                    break;
                default:
                    break;
            }
        }

        private async void Bell_Click(object sender, RoutedEventArgs e)
        {

            //await MaterialDesignThemes.Wpf.DialogHost.Show("dadasd");

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //abc.IsOpen = true;
        }
    }
}
