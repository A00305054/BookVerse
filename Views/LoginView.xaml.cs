using BookVerse.ViewModels;
using Microsoft.Maui.Controls;

namespace BookVerse.Views
{
    public partial class LoginView : ContentPage
    {
        private readonly LoginViewModel _viewModel;

        public LoginView()
        {
            InitializeComponent();

            _viewModel = new LoginViewModel();
            BindingContext = _viewModel;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();

            _viewModel.GetCommand.Execute(null);
        }
    }
}
