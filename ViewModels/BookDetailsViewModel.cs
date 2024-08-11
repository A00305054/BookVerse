using System.Windows.Input;
using BookVerse.Models;
using BookVerse.Views;
using BookVerse.Services;
using Microsoft.Maui.Controls;

namespace BookVerse.ViewModels
{
    public class BookDetailsViewModel : BindableObject
    {
        private readonly BookService _bookService;
        public Book SelectedBook { get; private set; }

        public ICommand BorrowCommand { get; }
        public ICommand ReserveCommand { get; }
        public ICommand ReadNowCommand { get; }

        public BookDetailsViewModel(string isbn)
        {
            _bookService = new BookService();
            LoadBookDetails(isbn);

            BorrowCommand = new Command(OnBorrowClicked);
            ReserveCommand = new Command(OnReserveClicked);
            ReadNowCommand = new Command(OnReadNowClicked);
        }

        private async void OnBorrowClicked()
        {
            if (SelectedBook != null)
            {
                await Application.Current.MainPage.Navigation.PushAsync(new BorrowReserveView(SelectedBook, true));
                // Here, you can set the behavior to borrow the book directly
            }
        }

        private async void OnReserveClicked()
        {
            if (SelectedBook != null)
            {
                await Application.Current.MainPage.Navigation.PushAsync(new BorrowReserveView(SelectedBook, false));
                // Here, you can set the behavior to reserve the book directly
            }
        }

        private async void OnReadNowClicked()
        {
            if (SelectedBook != null)
            {
                if (string.IsNullOrEmpty(SelectedBook.Content))
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Book content is missing.", "OK");
                    return;
                }

                if (string.IsNullOrEmpty(SelectedBook.TotalPages) || !int.TryParse(SelectedBook.TotalPages, out int totalPages))
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Total pages information is missing or invalid.", "OK");
                    return;
                }

                await Application.Current.MainPage.Navigation.PushAsync(new ReadBookView(SelectedBook));
            }
        }

        private async void LoadBookDetails(string isbn)
        {
            SelectedBook = await _bookService.GetBookInfo(isbn);
            OnPropertyChanged(nameof(SelectedBook));
        }
    }
}
