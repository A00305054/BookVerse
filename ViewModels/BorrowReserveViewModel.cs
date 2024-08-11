using System.Windows.Input;
using BookVerse.Models;
using Microsoft.Maui.Controls;

namespace BookVerse.ViewModels
{
    public class BorrowReserveViewModel : BindableObject
    {
        public Book SelectedBook { get; }
        public string ActionTitle { get; }
        public string ActionMessage { get; }
        public string ActionButtonText { get; }
        public Color ActionButtonColor { get; }
        public ICommand ActionCommand { get; }
        public ICommand CancelCommand { get; }

        public BorrowReserveViewModel(Book book, bool isBorrowAction)
        {
            SelectedBook = book;

            if (isBorrowAction)
            {
                ActionTitle = "Borrow Book";
                ActionMessage = "Would you like to borrow this book?";
                ActionButtonText = "Borrow";
                ActionButtonColor = Color.FromArgb("#4CAF50");
                ActionCommand = new Command(OnBorrow);
            }
            else
            {
                ActionTitle = "Reserve Book";
                ActionMessage = "Would you like to reserve this book?";
                ActionButtonText = "Reserve";
                ActionButtonColor = Color.FromArgb("#FF9800");
                ActionCommand = new Command(OnReserve);
            }

            CancelCommand = new Command(OnCancel);
        }

        private async void OnBorrow()
        {
            // Implement the borrowing logic here
            await Application.Current.MainPage.DisplayAlert("Success", "You have borrowed the book!", "OK");
            await Application.Current.MainPage.Navigation.PopAsync();
        }

        private async void OnReserve()
        {
            // Implement the reserving logic here
            await Application.Current.MainPage.DisplayAlert("Success", "You have reserved the book!", "OK");
            await Application.Current.MainPage.Navigation.PopAsync();
        }

        private async void OnCancel()
        {
            // Cancel the action and go back
            await Application.Current.MainPage.Navigation.PopAsync();
        }
    }
}
