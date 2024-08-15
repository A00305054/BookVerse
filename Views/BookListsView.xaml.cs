using BookVerse.Models;
using BookVerse.ViewModels;

namespace BookVerse.Views
{
    public partial class BookListsView : ContentPage
    {
        public BookListsView()
        {
            InitializeComponent();
            BindingContext = new BookListsViewModel();
        }

        private void OnBorrowedBooksClicked(object sender, EventArgs e)
        {
            if (BindingContext is BookListsViewModel viewModel)
            {
                // Toggle visibility
                BorrowedBooksCollectionView.IsVisible = !BorrowedBooksCollectionView.IsVisible;

                // Load the borrowed books if not already loaded
                if (BorrowedBooksCollectionView.IsVisible && viewModel.BorrowedBooks.Count == 0)
                {
                    viewModel.LoadBorrowedBooksAsync();
                }
            }
        }

        private void OnReservedBooksClicked(object sender, EventArgs e)
        {
            if (BindingContext is BookListsViewModel viewModel)
            {
                // Toggle visibility
                ReservedBooksCollectionView.IsVisible = !ReservedBooksCollectionView.IsVisible;

                // Load the reserved books if not already loaded
                if (ReservedBooksCollectionView.IsVisible && viewModel.ReservedBooks.Count == 0)
                {
                    viewModel.LoadReservedBooksAsync();
                }
            }
        }
    }
}
