using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;

namespace BookVerse.Views
{
    public partial class BorrowReserveView : ContentPage
    {
        public BorrowReserveView(Book book, bool isBorrowAction)
        {
            InitializeComponent();
            BindingContext = new BorrowReserveViewModel(book, isBorrowAction);
        }
    }
}
