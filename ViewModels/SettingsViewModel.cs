using System.Windows.Input;
using BookVerse.ViewModels;
using Microsoft.Maui.Controls;

namespace BookVerse.ViewModels
{
    public class SettingsViewModel : BindableObject
    {
        private string _username;
        private string _phoneNumber;
        private string _email;

        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                OnPropertyChanged(nameof(Username));
            }
        }

        public string PhoneNumber
        {
            get => _phoneNumber;
            set
            {
                _phoneNumber = value;
                OnPropertyChanged(nameof(PhoneNumber));
            }
        }

        public string Email
        {
            get => _email;
            set
            {
                _email = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        public ICommand SaveCommand { get; }

        public SettingsViewModel(string username, string phoneNumber, string email)
        {
            Username = username;
            PhoneNumber = phoneNumber;
            Email = email;

            SaveCommand = new Command(SaveChanges);
        }

        /*private async void SaveChanges()
        {

            // Validate input (Optional)
            if (string.IsNullOrEmpty(Username) || string.IsNullOrEmpty(Email))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Username and Email cannot be empty.", "OK");
                return;
            }

            // Update the HomeViewModel with the new values
            if (Application.Current.MainPage is NavigationPage navigationPage
                && navigationPage.RootPage.BindingContext is HomeViewModel homeViewModel)
            {
                homeViewModel.Username = Username;
                homeViewModel.PhoneNumber = PhoneNumber;
                homeViewModel.Email = Email;

                // Save changes to Preferences
                homeViewModel.SaveUserInfo();
                homeViewModel.LoadUserInfo();
            }

            // Navigate back to the HomeView
            await Application.Current.MainPage.Navigation.PopAsync();
        }*/
        private async void SaveChanges()
        {
            // Validate input (Optional)
            if (string.IsNullOrEmpty(Username) || string.IsNullOrEmpty(Email))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Username and Email cannot be empty.", "OK");
                return;
            }

            // Update Preferences
            Preferences.Set("username", Username);
            Preferences.Set("phoneNumber", PhoneNumber);
            Preferences.Set("email", Email);

            // Update HomeViewModel if it exists
            if (Application.Current.MainPage is NavigationPage navigationPage
                && navigationPage.RootPage.BindingContext is HomeViewModel homeViewModel)
            {
                homeViewModel.LoadUserInfo(); // Reload user info to reflect changes
            }

            // Navigate back to the HomeView
            await Application.Current.MainPage.Navigation.PopAsync();
        }

    }
}
