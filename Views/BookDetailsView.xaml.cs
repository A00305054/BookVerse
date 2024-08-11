using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;

namespace BookVerse.Views
{
    public partial class BookDetailsView : ContentPage
    {
        public BookDetailsView(string isbn)
        {
            InitializeComponent();
            BindingContext = new BookDetailsViewModel(isbn);
        }

        private async void OnBackButtonClicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }

        private async void OnReadNowClicked(object sender, EventArgs e)
        {
            var viewModel = BindingContext as BookDetailsViewModel;
            var book = viewModel?.SelectedBook;

            if (book != null)
            {
                if (!string.IsNullOrEmpty(book.Content))
                {
                    await DisplayAlert("Error", "Book content is missing.", "OK");
                    return;
                }

                if (string.IsNullOrEmpty(book.TotalPages) || !int.TryParse(book.TotalPages, out int totalPages))
                {
                    await DisplayAlert("Error", "Total pages information is missing or invalid.", "OK");
                    return;
                }
                await Navigation.PushAsync(new ReadBookView(book.Title, book.Content, int.Parse(book.TotalPages)));
            }
            else
            {
                await DisplayAlert("Error", "Book details are missing.", "OK");
            }
        }
    }
}
