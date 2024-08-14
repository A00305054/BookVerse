using System.Collections.ObjectModel;
using BookVerse.Models;

namespace BookVerse.ViewModels
{
    public class ProfileDetailsViewModel : BindableObject
    {
        public string Username { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public ObservableCollection<Book> Books { get; set; }

        public ProfileDetailsViewModel(string username, string phoneNumber, string email, ObservableCollection<Book> books)
        {
            Username = username;
            PhoneNumber = phoneNumber;
            Email = email;
            Books = books;
        }
    }
}
