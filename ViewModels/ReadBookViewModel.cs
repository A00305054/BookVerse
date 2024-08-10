using Microsoft.Maui.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace BookVerse.ViewModels
{
    public class ReadBookViewModel : INotifyPropertyChanged
    {
        private string _bookContent;
        private string _bookTitle;
        private int _currentPage;
        private int _totalPages;

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

        public ReadBookViewModel(string bookTitle, string bookContent, int totalPages)
        {
            BookTitle = bookTitle;
            TotalPages = totalPages;
            CurrentPage = 1;
            LoadPageContent();
        }

        private void LoadPageContent()
        {
            // Here you should load the content for the current page from your bookContent
            // This is a placeholder for the actual implementation
            BookContent = $"Page {CurrentPage} content...";
        }

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
