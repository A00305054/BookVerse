using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using BookVerse.Services;
using Microsoft.Maui.Controls;

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
                await Shell.Current.GoToAsync($"///{nameof(Views.HomeView)}");
            }
        }

        private async Task SignUp()
        {
            var (success, message) = await Authentication.SignUpAsync(Email, Password);
            Message = message;

            if (success)
            {
                await Shell.Current.GoToAsync($"///{nameof(Views.HomeView)}");
            }
        }
    }
}
