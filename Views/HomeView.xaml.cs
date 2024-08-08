using System.Linq;
using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.ViewModels;

namespace BookVerse.Views
{
    public partial class HomeView : ContentPage
    {
        public HomeView()
        {
            InitializeComponent();
            BindingContext = new HomeViewModel();
        }

        async void OnItemSelected(object sender, SelectionChangedEventArgs e)
        {
            var selectedBook = e.CurrentSelection.FirstOrDefault() as Book;
            if (selectedBook != null)
            {
                await Navigation.PushAsync(new BookDetailsView(selectedBook));
            }
        }
    }
}
