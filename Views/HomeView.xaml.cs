using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;
using BookVerse.Views;

namespace BookVerse.Views
{
    public partial class HomeView : ContentPage
    {
        private static HomeViewModel _homeViewModel;

        public HomeView()
        {
            InitializeComponent();
            
            // Use the existing instance if it exists; otherwise, create a new one
            if (_homeViewModel == null)
            {
                _homeViewModel = new HomeViewModel();
            }
            
            BindingContext = _homeViewModel;
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
