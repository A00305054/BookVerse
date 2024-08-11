using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;
using BookVerse.Views;

namespace BookVerse.Views
{
    public partial class HomeView : ContentPage
    {
        public HomeView()
        {
            InitializeComponent();
            BindingContext = new HomeViewModel();
        }

        private async void OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedBook = e.CurrentSelection.FirstOrDefault() as Book;
            if (selectedBook != null)
            {
                await Navigation.PushAsync(new BookDetailsView(selectedBook.ISBN));
            }
        }
        private async void OnViewBookListsClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new BookListsView());
        }
    }
}
