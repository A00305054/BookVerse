using System.Collections.ObjectModel;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using BookVerse.Models;
using BookVerse.Services;

namespace BookVerse.ViewModels
{
    public class BookListsViewModel : BindableObject
    {
        private readonly BorrowReserveService _borrowReserveService;
        private ObservableCollection<Book> _borrowedBooks;
        private ObservableCollection<Book> _reservedBooks;

        public ObservableCollection<Book> BorrowedBooks
        {
            get => _borrowedBooks;
            set
            {
                _borrowedBooks = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<Book> ReservedBooks
        {
            get => _reservedBooks;
            set
            {
                _reservedBooks = value;
                OnPropertyChanged();
            }
        }

        public BookListsViewModel()
        {
            _borrowReserveService = new BorrowReserveService();
            LoadBooksAsync();
        }

        private async Task LoadBooksAsync()
        {
            var borrowedBooksList = await _borrowReserveService.GetBorrowedBooksAsync();
            var reservedBooksList = await _borrowReserveService.GetReservedBooksAsync();

            BorrowedBooks = new ObservableCollection<Book>(borrowedBooksList);
            ReservedBooks = new ObservableCollection<Book>(reservedBooksList);
        }
    }
}
