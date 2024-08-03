using BookVerse.Models;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;

namespace BookVerse.ViewModels
{
    public partial class HomeViewModel : ObservableObject
    {
        public ObservableCollection<Book> BestSellers { get; set; }
        public ObservableCollection<Book> FilteredBooks { get; set; }

        public IRelayCommand<string> FilterCommand { get; }

        public HomeViewModel()
        {
            BestSellers = new ObservableCollection<Book>();
            FilteredBooks = new ObservableCollection<Book>();

            FilterCommand = new RelayCommand<string>(OnFilter);

            LoadBooks();
        }

        private void LoadBooks()
        {
            // Load books into BestSellers and FilteredBooks
            BestSellers.Add(new Book { Image = "dead_silence.png", Title = "Dead Silence", Rating = "4.5" });
            BestSellers.Add(new Book { Image = "bitter.png", Title = "Bitter", Rating = "4.2" });

            FilteredBooks.Add(new Book { Image = "hunt_the_stars.png", Title = "Hunt the Stars", Rating = "4.0" });
            FilteredBooks.Add(new Book { Image = "moon_witch.png", Title = "Moon Witch, Spider King", Rating = "4.3" });
            FilteredBooks.Add(new Book { Image = "mickey7.png", Title = "Mickey7", Rating = "4.1" });
        }

        private void OnFilter(string filter)
        {
            // Implement your filtering logic here
            // You may filter BestSellers or any other collection
        }
    }
}
