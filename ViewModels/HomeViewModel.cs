using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using BookVerse.Models;

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
            BestSellers.Add(new Book { Image = "dead_silence.png", Title = "Dead Silence", Rating = "4.5", Author = "S.A. Barnes", Description = "Titanic meets The Shining in S.A. Barnes’ Dead Silence, a SF horror novel in which a woman and her crew board a decades-lost luxury cruiser and find the wreckage of a nightmare that hasn’t yet ended." });
            BestSellers.Add(new Book { Image = "bitter.png", Title = "Bitter", Rating = "4.2", Author = "Author Name", Description = "Description for Bitter" });

            FilteredBooks.Add(new Book { Image = "hunt_the_stars.png", Title = "Hunt the Stars", Rating = "4.0", Author = "Author Name", Description = "Description for Hunt the Stars" });
            FilteredBooks.Add(new Book { Image = "moon_witch.png", Title = "Moon Witch, Spider King", Rating = "4.3", Author = "Author Name", Description = "Description for Moon Witch, Spider King" });
            FilteredBooks.Add(new Book { Image = "mickey7.png", Title = "Mickey7", Rating = "4.1", Author = "Author Name", Description = "Description for Mickey7" });
        }

        private void OnFilter(string filter)
        {
            // Filter books based on the filter parameter (Latest, Popular, Trending)
            // Implement your filtering logic here
        }
    }
}

