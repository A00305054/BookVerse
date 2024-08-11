using Microsoft.Maui.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using BookVerse.Models;
using BookVerse.Views;

namespace BookVerse.ViewModels
{
    public class ReadBookViewModel : INotifyPropertyChanged
    {
        private string _bookContent;
        private string _bookTitle;
        private int _currentPage;
        private int _totalPages;
        private readonly Book _book;

        public event PropertyChangedEventHandler PropertyChanged;

        public string BookContent
        {
            get => _bookContent;
            set
            {
                _bookContent = value;
                OnPropertyChanged();
            }
        }

        public string BookTitle
        {
            get => _bookTitle;
            set
            {
                _bookTitle = value;
                OnPropertyChanged();
            }
        }

        public int CurrentPage
        {
            get => _currentPage;
            set
            {
                _currentPage = value;
                OnPropertyChanged();
                LoadPageContent();
            }
        }

        public int TotalPages
        {
            get => _totalPages;
            set
            {
                _totalPages = value;
                OnPropertyChanged();
            }
        }

        public ICommand PreviousPageCommand { get; }
        public ICommand NextPageCommand { get; }
        public ICommand NavigateToBorrowAndReserveCommand { get; }

        public ReadBookViewModel(Book book)
        {
            _book = book;
            BookTitle = book.Title;
            TotalPages = int.Parse(book.TotalPages);
            CurrentPage = 1;
            LoadPageContent();

            PreviousPageCommand = new Command(OnPreviousPage, () => IsPreviousPageEnabled);
            NextPageCommand = new Command(OnNextPage, () => IsNextPageEnabled);
            NavigateToBorrowAndReserveCommand = new Command(OnNavigateToBorrowAndReserve);
        }

        private void LoadPageContent()
        {
            // Simulate loading content for the current page
            BookContent = $"Content of page {CurrentPage} for book {_book.Title}...";
            (PreviousPageCommand as Command).ChangeCanExecute();
            (NextPageCommand as Command).ChangeCanExecute();
        }

        private void OnPreviousPage()
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
            }
        }

        private void OnNextPage()
        {
            if (CurrentPage < TotalPages)
            {
                CurrentPage++;
            }
        }

        public bool IsPreviousPageEnabled => CurrentPage > 1;
        public bool IsNextPageEnabled => CurrentPage < TotalPages;

        private async void OnNavigateToBorrowAndReserve()
        {
            await Application.Current.MainPage.Navigation.PushAsync(new BorrowReserveView(_book, true));
        }

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
