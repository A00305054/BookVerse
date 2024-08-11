using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;

namespace BookVerse.Views
{
    public partial class ReadBookView : ContentPage
    {
        public ReadBookView(Book book)
        {
            InitializeComponent();
            BindingContext = new ReadBookViewModel(book);
        }
    }
}
