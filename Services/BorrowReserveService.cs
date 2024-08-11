using Newtonsoft.Json;
using System.Net.Http;
using System.Threading.Tasks;

namespace BookVerse.Services
{
    public class BorrowReserveService
    {
        private readonly HttpClient _httpClient;

        public BorrowReserveService()
        {
            _httpClient = new HttpClient();
        }

        public async Task<bool> BorrowBookAsync(string isbn)
        {
            // Replace with actual API endpoint for borrowing a book
            string url = $"https://your-backend-api.com/books/borrow?isbn={isbn}";
            HttpResponseMessage response = await _httpClient.PostAsync(url, null);

            return response.IsSuccessStatusCode;
        }

        public async Task<bool> ReserveBookAsync(string isbn)
        {
            // Replace with actual API endpoint for reserving a book
            string url = $"https://your-backend-api.com/books/reserve?isbn={isbn}";
            HttpResponseMessage response = await _httpClient.PostAsync(url, null);

            return response.IsSuccessStatusCode;
        }

        public async Task<bool> ReturnBookAsync(string isbn)
        {
            // Replace with actual API endpoint for returning a book
            string url = $"https://your-backend-api.com/books/return?isbn={isbn}";
            HttpResponseMessage response = await _httpClient.PostAsync(url, null);

            return response.IsSuccessStatusCode;
        }

        public async Task<BookStatus> GetBookStatusAsync(string isbn)
        {
            // Replace with actual API endpoint for getting the status of a book
            string url = $"https://your-backend-api.com/books/status?isbn={isbn}";
            HttpResponseMessage response = await _httpClient.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                // Assume BookStatus is directly deserializable from JSON response
                return JsonConvert.DeserializeObject<BookStatus>(json);
            }

            return new BookStatus { IsBorrowed = false, IsReserved = false };
        }
    }

    public class BookStatus
    {
        public bool IsBorrowed { get; set; }
        public bool IsReserved { get; set; }
    }
}
