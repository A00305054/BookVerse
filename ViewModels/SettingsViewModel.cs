using System.Windows.Input;
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

        private void SaveChanges()
        {
            // Logic to save changes, such as updating a database or service
            // You can also add navigation back to the HomeView after saving
        }
    }
}
