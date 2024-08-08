using BookVerse.Models;
using Microsoft.Maui.Controls;

namespace BookVerse.ViewModels
{
    public class BookDetailsViewModel : BindableObject
    {
        private Book _selectedBook;

        public Book SelectedBook
        {
            get => _selectedBook;
            set
            {
                _selectedBook = value;
                OnPropertyChanged();
            }
        }

        public BookDetailsViewModel()
        {
        }

        public BookDetailsViewModel(Book book)
        {
            SelectedBook = book;
        }
    }
}
