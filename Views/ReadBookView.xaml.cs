using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;

namespace BookVerse.Views
{ 

    public partial class ReadBookView : ContentPage
    {
        public ReadBookView(string bookTitle, string bookContent, int totalPages)
        {
            InitializeComponent();
            BindingContext = new ReadBookViewModel(bookTitle, bookContent, totalPages);
        }
    }
}