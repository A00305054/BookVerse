using System.Collections.ObjectModel;
using BookVerse.Models;
using Microsoft.Maui.Controls;

namespace BookVerse.ViewModels
{
    public class ProfileDetailsViewModel : BindableObject
    {
        private string _username;
        private string _phoneNumber;
        private string _email;
        private ObservableCollection<Book> _books;

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

        public ObservableCollection<Book> Books
        {
            get => _books;
            set
            {
                _books = value;
                OnPropertyChanged(nameof(Books));
            }
        }

        public ProfileDetailsViewModel(string username, string phoneNumber, string email, ObservableCollection<Book> books)
        {
            Username = username;
            PhoneNumber = phoneNumber;
            Email = email;
            Books = books;
        }
    }
}
