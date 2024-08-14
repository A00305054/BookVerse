using System.Collections.ObjectModel;
using System.Windows.Input;
using BookVerse.Models;
using BookVerse.Services;
using Microsoft.Maui.Controls;
using BookVerse.Views;

namespace BookVerse.ViewModels
{
    public class HomeViewModel : BindableObject
    {
        private readonly BookService _bookService;

        public ObservableCollection<Book> Books { get; } = new ObservableCollection<Book>();

        public string Username { get; set; }
        public ImageSource ProfilePicture { get; set; }
        public ICommand OpenSettingsCommand { get; }
        public ICommand OpenProfileCommand { get; }

        public HomeViewModel()
        {
            _bookService = new BookService();
            LoadBooks("science fiction");

            Username = "Ankita Patel";
            ProfilePicture = "profileimage.jpeg";

            OpenSettingsCommand = new Command(OpenSettings);
            OpenProfileCommand = new Command(OpenProfile);
        }

        private async void LoadBooks(string query)
        {
            var books = await _bookService.GetBooksAsync(query);
            foreach (var book in books)
            {
                Books.Add(book);
            }
        }

        private void OpenSettings()
        {
            // Logic to navigate to the settings page
        }

        private async void OpenProfile()
        {
            var profileDetailsViewModel = new ProfileDetailsViewModel(Username, "123-456-7890", "ankita.patel@example.com", Books);
            var profileDetailsPage = new ProfileDetailsView
            {
                BindingContext = profileDetailsViewModel
            };
            await Application.Current.MainPage.Navigation.PushAsync(profileDetailsPage);
        }
    }
}
