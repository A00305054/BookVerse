using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;

namespace BookVerse.Views
{
    public partial class BookDetailsView : ContentPage
    {
        public BookDetailsView(Book book)
        {
            InitializeComponent();
            BindingContext = new BookDetailsViewModel(book);
        }

        private async void OnBackButtonClicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }
        private async void OnReadNowClicked(object sender, EventArgs e)
        {
            // Get the selected book from the ViewModel
            var viewModel = BindingContext as BookDetailsViewModel;
            var selectedBook = viewModel?.SelectedBook;

            if (selectedBook != null)
            {
                // Navigate to the ReadBookView, passing the necessary information
                await Navigation.PushAsync(new ReadBookView(selectedBook.Title, "Book Content here",100));
            }
        }
    }
}
