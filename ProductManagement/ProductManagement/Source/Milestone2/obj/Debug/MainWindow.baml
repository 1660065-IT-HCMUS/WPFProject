   M S B A M L   `   `   `  ����E  AMilestone2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:Milestone2
Milestone2  5   	       Milestone2.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:Milestone2     5   	   V RMaterialDesignThemes.Wpf, Version=2.5.1.1345, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   $��Century Gothic)�5	   	      MaterialDesignPaper#���   5
   	   $	��730��5      $
��1200��6'     � WindowStyle$
  None=�64    � AllowsTransparency .  � WindowStartupLocation$ CenterScreen=�6a    � 
ResizeMode$ NoResize=�6�   .��5      � -   5         �Name$ Application��5      ���#F6F7FB$��0,0,0,0q�6W    � RowDefinitions 5   
   �� 5      $��35 �6   �� 5      $��* �6   .+�5   
   � ���#FFFFFF$��0��6$   $��	200,0,0,0q�61    J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5         Color$ 	#FFF0E9E9��6#      
BlurRadius$ 25Q�65   	   ShadowDepth$	 2Q�6E    5      �� 5      $��30 �6    �� 5      $��45 �6    .+�5      �� $��0��6   
 �� Orientation$
 
Horizontal=�6&   $��Right=�6?   $��10,0,5,0q�6[   .+�5       �� -   5         ��Name$
 bell��5       $��30��6t   $��30��6   $��0q�6�   ���#686CFA+  %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth0=�5!      ��5    �   Z� ��6�   Z� .��5"      '  !MaterialDesignThemes.Wpf.PackIcon  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.5.1.1345, Culture=neutral, PublicKeyToken=null]]   Kind$ BellOutline=�6.   5#      �� 5$      -   5        $��30��5$      $ Depth0=�5%      $��30��5&   2   $��0q�6k   ���#686CFA$��0 0 0 0q�6�   ��6>   Z� ��6T   Z� .��5'        $ Settings=�6.   5)      �� 5*      -   5        $ ButtonClose��5,   3   $��0q�5*      $ Depth0=�5+      $��30��5,   b   $��30��6m   $��0q�6�   ���#686CFA��6y   Z� ��6�   Z� .��5-        $ Power=�6.   5.      5/      � 51      $��1��6   .+�52      �� $
��1200��6   $	��Top=�6)   ���#EFF0F66A   54      55      � 56   
   $��1��6   $��	200,0,0,0q�6   .+�57      � $��17��58      $
��1000��6   $	��695��6*   .+�59      �  � ColumnDefinitions 5:      �� 5;      $
��467* �6+   �� 5<      $	��33* �6+   .+�5>      �� -   5         ��Name$ mainContentControl��5>   %   $��2��6A   5?      5@      5A      � 5C   
   ���#63168C$	��200��5E       J� Opacity$	 0.8Q�5F      $
��Left=�5G      $��3��6*    5H        5I      $ 	#FFEAE8E8��6#   $	 2Q�65   $ 30Q�6E   .+�5L      ?  9MaterialDesignThemes.Wpf.Transitions.TransitioningContent  -   5          Name$ TrainsitionigContentSlide��5L   2   $��0,50,0,0q�6�   C  =MaterialDesignThemes.Wpf.Transitions.TransitioningContentBase   OpeningEffect 6U   D  >MaterialDesignThemes.Wpf.Transitions.TransitionEffectExtension  *SlideInFromLeft+   Duration$ 0:0:0.2X�.��5M      � -   5        $ 
GridCursor��5M      $��0 52 0 0q�6+   ���#686CFA$��5��6R   $
��Left=�6\   $��60��6w   $	��Top=�6�   5N      �� 5P      -   5         ��Name$ ListViewMenu��5P      $��0 100q�6-   
�������$��Champagne & Limousines)�6S   $��18(�6{    �� SelectedIndex$ 0��6�   .@�5Q      �� -	   5         ��Name$ xn��5Q   +   $��60��6   .��5R      �� $
 
Horizontal=�6!   .+�5S        $
 Home=�62   
�������$��30��6Q   $��30��6\   $��Center=�6h   $��5q�6�   �� 5T      $��Trang chủ��6$   $��15(�66   $��Center=�6D   $
��20 0q�6_   
�������$/��)/Milestone2;component/assets/#SVN-Poppins)�6�   5U      5V      �� 5W      $��60��6   .��5X      �� $
 
Horizontal=�6!   .+�5Y        
�������$ Money=�6E   $��30��6R   $��30��6]   $��Center=�6i   $��5q�6�   �� 5Z      $��
Bán hàng��6$   $��15(�64   $��Center=�6B   $
��20 0q�6]   
�������$/��)/Milestone2;component/assets/#SVN-Poppins)�6~   5[      5\      �� 5]      $��60��6   .��5^      �� $
 
Horizontal=�6!   .+�5_        
�������$ SettingsApplications=�6E   $��30��6a   $��30��6l   $��Center=�6x   $��5q�6�   �� 5`      $��
Quản lí��6$   $��15(�63   $��Center=�6A   $
��20 0q�6\   
�������$/��)/Milestone2;component/assets/#SVN-Poppins)�6}   5a      5b      �� 5c      $��60��6   $/��)/Milestone2;component/assets/#SVN-Poppins)�6,   .��5d      �� $
 
Horizontal=�6!   .+�5e        
�������$ Report=�6E   $��30��6S   $��30��6^   $��Center=�6j   $��5q�6�   �� 5f      $��	Báo cáo��6$   $��15(�63   $��Center=�6A   $
��20 0q�6\   
�������$/��)/Milestone2;component/assets/#SVN-Poppins)�6}   5g      5h      �� 5i      $��60��6   $/��)/Milestone2;component/assets/#SVN-Poppins)�6+   .��5j      �� $
 
Horizontal=�6!   .+�5k        
�������$ InfoOutline=�6E   $��30��6X   $��30��6c   $��Center=�6o   $��5q�6�   �� 5l      $��
Thông tin��6$   $��15(�65   $��Center=�6C   $
��20 0q�6^   
�������$/��)/Milestone2;component/assets/#SVN-Poppins)�6   5m      5o      5p      5q      5r      5s      