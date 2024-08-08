using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;

namespace BookVerse.Views
{
    public partial class BookDetailsView : ContentPage
    {
        public BookDetailsView(BookVerse.Models.Book book)
        {
            InitializeComponent();
            BindingContext = new BookDetailsViewModel(book);
        }
    }
}
