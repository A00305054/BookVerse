using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.Services;

namespace BookVerse.ViewModels
{
    public class BookListsViewModel : BindableObject
    {
        private readonly BorrowReserveService _borrowReserveService;
        private ObservableCollection<BookVerse.Models.Book> _borrowedBooks;
        private ObservableCollection<BookVerse.Models.Book> _reservedBooks;

        public ObservableCollection<BookVerse.Models.Book> BorrowedBooks
        {
            get => _borrowedBooks;
            set
            {
                _borrowedBooks = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<BookVerse.Models.Book> ReservedBooks
        {
            get => _reservedBooks;
            set
            {
                _reservedBooks = value;
                OnPropertyChanged();
            }
        }

        public ICommand LoadBooksCommand { get; }

        public BookListsViewModel()
        {
            _borrowReserveService = new BorrowReserveService();
            LoadBooksCommand = new Command(async () => await LoadBooksAsync());
        }

        private async Task LoadBooksAsync()
        {
            var borrowedBooksList = await _borrowReserveService.GetBorrowedBooksAsync();
            var reservedBooksList = await _borrowReserveService.GetReservedBooksAsync();

            BorrowedBooks = new ObservableCollection<BookVerse.Models.Book>(borrowedBooksList);
            ReservedBooks = new ObservableCollection<BookVerse.Models.Book>(reservedBooksList);
        }
    }
}
