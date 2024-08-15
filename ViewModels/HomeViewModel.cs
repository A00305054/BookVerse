using System;
using System.Collections.ObjectModel;
using System.IO;
using System.Threading.Tasks;
using System.Windows.Input;
using BookVerse.Models;
using BookVerse.Services;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using BookVerse.Views;

namespace BookVerse.ViewModels
{
    public class HomeViewModel : BindableObject
    {
        private readonly BookService _bookService;

        private readonly string[] _profileImages = new[]
        {
            "profile1.jpg",
            "profile2.jpg",
            "profile3.jpg",
            "profile4.jpg",
            "profile5.jpg"
        };

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

        private ImageSource _profilePicture;
        public ImageSource ProfilePicture
        {
            get => _profilePicture;
            set
            {
                _profilePicture = value;
                OnPropertyChanged(nameof(ProfilePicture));
            }
        }

        public ICommand OpenSettingsCommand { get; }
        public ICommand OpenProfileCommand { get; }
        public ICommand UploadImageCommand { get; }

        public HomeViewModel()
        {
            _bookService = new BookService();
            LoadUserInfo();
            LoadBooks("science fiction");

            // Select a random profile picture initially
            var random = new Random();
            var selectedProfile = _profileImages[random.Next(_profileImages.Length)];
            ProfilePicture = ImageSource.FromFile(selectedProfile);

            OpenSettingsCommand = new Command(async () => await OpenSettings());
            OpenProfileCommand = new Command(async () => await OpenProfile());
            UploadImageCommand = new Command(async () => await UploadImage());
        }

        private async void LoadBooks(string query)
        {
            var books = await _bookService.GetBooksAsync(query);
            Books.Clear();
            foreach (var book in books)
            {
                Books.Add(book);
            }
        }

        private async Task OpenSettings()
        {
            var settingsViewModel = new SettingsViewModel(Username, PhoneNumber, Email);
            var settingsPage = new SettingsView
            {
                BindingContext = settingsViewModel
            };
            await Application.Current.MainPage.Navigation.PushAsync(settingsPage);
        }

        private async Task OpenProfile()
        {
            var profileDetailsViewModel = new ProfileDetailsViewModel(Username, PhoneNumber, Email, Books);
            var profileDetailsPage = new ProfileDetailsView
            {
                BindingContext = profileDetailsViewModel
            };
            await Application.Current.MainPage.Navigation.PushAsync(profileDetailsPage);
        }

        private async Task UploadImage()
        {
            try
            {
                var result = await FilePicker.PickAsync(new PickOptions
                {
                    FileTypes = FilePickerFileType.Images,
                    PickerTitle = "Please select a profile image"
                });

                if (result != null)
                {
                    var stream = await result.OpenReadAsync();
                    ProfilePicture = ImageSource.FromStream(() => stream);

                    
                }
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }

        public void LoadUserInfo()
        {
            Username = Preferences.Get("username", ""); // No default, expecting real user data
            PhoneNumber = Preferences.Get("phoneNumber", "");
            Email = Preferences.Get("email", "");

            var profilePicturePath = Preferences.Get("profilePicture", null);
            if (!string.IsNullOrEmpty(profilePicturePath))
            {
                ProfilePicture = ImageSource.FromFile(profilePicturePath);
            }
            else
            {
                var random = new Random();
                var selectedProfile = _profileImages[random.Next(_profileImages.Length)];
                ProfilePicture = ImageSource.FromFile(selectedProfile);
            }
        }

        public void SaveUserInfo()
        {
            Preferences.Set("username", Username);
            Preferences.Set("phoneNumber", PhoneNumber);
            Preferences.Set("email", Email);
            Preferences.Set("profilePicture", ProfilePicture.ToString());
        }

    }
}
