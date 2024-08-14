using Microsoft.Maui.Controls;
using BookVerse.ViewModels;
using System.Collections.ObjectModel;
using BookVerse.Models;

namespace BookVerse.Views
{
    public partial class ProfileDetailsView : ContentPage
    {
        public ProfileDetailsView()
        {
            InitializeComponent();

            // Initialize with example data; replace with actual data retrieval logic
            var books = new ObservableCollection<Book>
            {
                new Book { Title = "Book 1", Author = "Author 1" },
                new Book { Title = "Book 2", Author = "Author 2" }
            };

            BindingContext = new ProfileDetailsViewModel(
                username: "Ankita Patel",
                phoneNumber: "123-456-1506",
                email: "ankitapatel@example.com",
                books: books
            );
        }
    }
}
