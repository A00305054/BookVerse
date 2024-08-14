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

        private string _username;
        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                OnPropertyChanged(nameof(Username));
            }
        }

        private string _phoneNumber;
        public string PhoneNumber
        {
            get => _phoneNumber;
            set
            {
                _phoneNumber = value;
                OnPropertyChanged(nameof(PhoneNumber));
            }
        }

        private string _email;
        public string Email
        {
            get => _email;
            set
            {
                _email = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        public ImageSource ProfilePicture { get; set; }
        public ICommand OpenSettingsCommand { get; }
        public ICommand OpenProfileCommand { get; }

        public HomeViewModel()
        {
            _bookService = new BookService();
            LoadBooks("science fiction");

            Username = "Ankita Patel";
            PhoneNumber = "123-456-7890";
            Email = "ankitapatel@gmail.com";
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

        private async void OpenSettings()
        {
            var settingsViewModel = new SettingsViewModel(Username, PhoneNumber, Email);
            var settingsPage = new SettingsView
            {
                BindingContext = settingsViewModel
            };
            await Application.Current.MainPage.Navigation.PushAsync(settingsPage);
        }

        private async void OpenProfile()
        {
            var profileDetailsViewModel = new ProfileDetailsViewModel(Username, PhoneNumber, Email, Books);
            var profileDetailsPage = new ProfileDetailsView
            {
                BindingContext = profileDetailsViewModel
            };
            await Application.Current.MainPage.Navigation.PushAsync(profileDetailsPage);
        }
    }
}
