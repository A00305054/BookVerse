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
        // Parameterless constructor for XAML instantiation
        public BookDetailsViewModel()
        {
        }


        public BookDetailsViewModel(BookVerse.Models.Book book)
        {
            SelectedBook = book;
        }
    }
}
