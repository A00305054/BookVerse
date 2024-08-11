using System.Threading.Tasks;
using BookVerse.Models;
using BookVerse.Services;

namespace BookVerse.ViewModels
{
    public class BookDetailsViewModel : BindableObject
    {
        private Book _selectedBook;
        private readonly BookService _bookService;

        public Book SelectedBook
        {
            get => _selectedBook;
            set
            {
                _selectedBook = value;
                OnPropertyChanged();
            }
        }

        public BookDetailsViewModel(string isbn)
        {
            _bookService = new BookService();
            LoadBookDetails(isbn);
        }

        private async void LoadBookDetails(string isbn)
        {
            SelectedBook = await _bookService.GetBookInfo(isbn);
        }
    }
}
