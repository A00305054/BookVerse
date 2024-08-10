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
            BestSellers.Add(new Book { Image = "bitter.png", Title = "Bitter", Rating = "4.2", Author = "Akwaeke Emezi", Description = "Bitter is a young adult novel written by Nigerian writer Akwaeke Emezi and published by Knopf on February 15, 2022. A prequel to Emezi's Pet, Bitter tells the story of a Black teenage girl living in a city troubled by constant protests and violence." });

            FilteredBooks.Add(new Book { Image = "hunt_the_stars.png", Title = "Hunt the Stars", Rating = "4.0", Author = "Jessie Mihalik", Description = "Torran claims that a very valuable family heirloom was stolen from his home and he needs bounty hunter Tavi and her team to search for it." });
            FilteredBooks.Add(new Book { Image = "moon_witch.png", Title = "Moon Witch, Spider King", Rating = "4.3", Author = "Marlon James", Description = "This is the story of the century-plus life of a formidable woman, from sogolon's humble beginnings as an underestimated orphan-girl to her transformation into the moon witch, during which time she will become a slave, thief, fighter, lover, mother; she will make allies and adversaries, encounter shapeshifters and ..." });
            FilteredBooks.Add(new Book { Image = "mickey7.png", Title = "Mickey7", Rating = "4.1", Author = "Ashton Edward", Description = "Mickey7 is an Expendable: a disposable employee on a human expedition sent to colonize the ice world Niflheim. Whenever there's a mission that's too dangerous?even suicidal?the crew turns to Mickey. After one iteration dies, a new body is regenerated with most of his memories intact." });
        }

        private void OnFilter(string filter)
        {
            // Filter books based on the filter parameter (Latest, Popular, Trending)
            // Implement your filtering logic here
        }
    }
}

