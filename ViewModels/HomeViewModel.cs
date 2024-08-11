using System.Collections.ObjectModel;
using System.Windows.Input;
using BookVerse.Models;
using BookVerse.Services;
using Microsoft.Maui.Controls;

namespace BookVerse.ViewModels
{
    public class HomeViewModel : BindableObject
    {
        private readonly BookService _bookService;

        public ObservableCollection<Book> Books { get; } = new ObservableCollection<Book>();

        public ICommand SearchCommand { get; }

        public HomeViewModel()
        {
            _bookService = new BookService();
            LoadBooks("science fiction");

            SearchCommand = new Command<string>(SearchBooks);
        }

        private async void LoadBooks(string query)
        {
            Books.Clear();
            var books = await _bookService.GetBooksAsync(query);
            foreach (var book in books)
            {
                Books.Add(book);
            }
        }

        private void SearchBooks(string query)
        {
            LoadBooks(query);
        }
    }
}
