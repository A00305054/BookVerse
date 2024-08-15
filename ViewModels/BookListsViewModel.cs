using System.Collections.ObjectModel;
using System.Threading.Tasks;
using BookVerse.Models;
using BookVerse.Services;
using Microsoft.Maui.Controls;

namespace BookVerse.ViewModels
{
    public class BookListsViewModel : BindableObject
    {
        private readonly BorrowReserveService _borrowReserveService;

        public ObservableCollection<Book> BorrowedBooks { get; private set; } = new ObservableCollection<Book>();
        public ObservableCollection<Book> ReservedBooks { get; private set; } = new ObservableCollection<Book>();

        public BookListsViewModel()
        {
            _borrowReserveService = new BorrowReserveService();
            LoadBooksAsync();
        }

        private async Task LoadBooksAsync()
        {
            // Load both borrowed and reserved books when initializing the view model
            await LoadBorrowedBooksAsync();
            await LoadReservedBooksAsync();
        }

        public async Task LoadBorrowedBooksAsync()
        {
            // Fetch borrowed books from the service
            var borrowedBooks = await _borrowReserveService.GetBorrowedBooksAsync();
            BorrowedBooks.Clear();

            foreach (var book in borrowedBooks)
            {
                BorrowedBooks.Add(book);
            }
        }

        public async Task LoadReservedBooksAsync()
        {
            // Fetch reserved books from the service
            var reservedBooks = await _borrowReserveService.GetReservedBooksAsync();
            ReservedBooks.Clear();

            foreach (var book in reservedBooks)
            {
                ReservedBooks.Add(book);
            }
        }
    }
}
