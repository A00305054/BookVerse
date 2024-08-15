using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using BookVerse.Services;
using BookVerse.Views;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;

namespace BookVerse.ViewModels
{
    public class LoginViewModel : ObservableRecipient
    {
        public string Email { get; set; }
        public string Password { get; set; }

        private string _message;
        public string Message
        {
            get => _message;
            set => SetProperty(ref _message, value);
        }

        protected static AuthenticationServiceFirebase Authentication => AuthenticationServiceFirebase.Instance;

        public IAsyncRelayCommand GetCommand { get; }
        public IAsyncRelayCommand SignInCommand { get; }
        public IAsyncRelayCommand SignUpCommand { get; }

        public LoginViewModel()
        {
            GetCommand = new AsyncRelayCommand(Get);
            SignInCommand = new AsyncRelayCommand(SignIn);
            SignUpCommand = new AsyncRelayCommand(SignUp);
        }

        private async Task Get()
        {
            // Placeholder for the Get method
        }

        private async Task SignIn()
        {
            var (success, message) = await Authentication.SignInAsync(Email, Password);
            Message = message;

            if (success)
            {
                // Retrieve the actual username and phone number after login
                var username = Email.Substring(0, Email.IndexOf('@'));
                //var phoneNumber = await GetPhoneNumberFromAuthenticationService();

                // Save user information to Preferences after login
                Preferences.Set("username", username);
                Preferences.Set("phoneNumber", "");
                Preferences.Set("email", Email);

                // Navigate to the HomeView after login
                await Application.Current.MainPage.Navigation.PushAsync(new HomeView());
            }
            else
            {
                // Show error message if login fails
                await Application.Current.MainPage.DisplayAlert("Error", "Login failed. Please try again.", "OK");
            }
        }

        private async Task SignUp()
        {
            var (success, message) = await Authentication.SignUpAsync(Email, Password);
            Message = message;

            if (success)
            {
                // Retrieve the actual username and phone number after sign-up
                var username = await GetUsernameFromAuthenticationService();
                var phoneNumber = await GetPhoneNumberFromAuthenticationService();

                // Save user information to Preferences after sign-up
                Preferences.Set("username", username);
                Preferences.Set("phoneNumber", phoneNumber);
                Preferences.Set("email", Email);

                // Navigate to the HomeView after sign-up
                await Application.Current.MainPage.Navigation.PushAsync(new HomeView());
            }
            else
            {
                // Show error message if sign-up fails
                await Application.Current.MainPage.DisplayAlert("Error", "Sign-up failed. Please try again.", "OK");
            }
        }

        private async Task<string> GetUsernameFromAuthenticationService()
        {
            // Logic to retrieve the username from the AuthenticationService or API
            // Replace with actual logic to get the logged-in user's username
            return "User's Actual Name";
        }

        private async Task<string> GetPhoneNumberFromAuthenticationService()
        {
            // Logic to retrieve the phone number from the AuthenticationService or API
            // Replace with actual logic to get the logged-in user's phone number
            return "User's Actual Phone Number";
        }
    }
}
