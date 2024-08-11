using System.Collections.ObjectModel;
using System.Threading.Tasks;
using BookVerse.Models;
using BookVerse.Services;

namespace BookVerse.ViewModels
{
    public class HomeViewModel : BindableObject
    {
        private readonly BookService _bookService;

        public ObservableCollection<Book> Books { get; } = new ObservableCollection<Book>();

        public HomeViewModel()
        {
            _bookService = new BookService();
            LoadBooks("science fiction"); // Example query
        }

        private async void LoadBooks(string query)
        {
            var books = await _bookService.GetBooksAsync(query);
            foreach (var book in books)
            {
                Books.Add(book);
            }
        }
    }
}
