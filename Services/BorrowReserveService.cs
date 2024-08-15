using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using BookVerse.Models; // Ensure you're using the correct namespace

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
            string url = $"https://your-backend-api.com/books/borrow?isbn={isbn}";
            HttpResponseMessage response = await _httpClient.PostAsync(url, null);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> ReserveBookAsync(string isbn)
        {
            string url = $"https://your-backend-api.com/books/reserve?isbn={isbn}";
            HttpResponseMessage response = await _httpClient.PostAsync(url, null);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> ReturnBookAsync(string isbn)
        {
            string url = $"https://your-backend-api.com/books/return?isbn={isbn}";
            HttpResponseMessage response = await _httpClient.PostAsync(url, null);
            return response.IsSuccessStatusCode;
        }

        public async Task<BookStatus> GetBookStatusAsync(string isbn)
        {
            string url = $"https://your-backend-api.com/books/status?isbn={isbn}";
            HttpResponseMessage response = await _httpClient.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<BookStatus>(json);
            }

            return new BookStatus { IsBorrowed = false, IsReserved = false };
        }

        // Update the methods to return List<BookVerse.Models.Book>
        public async Task<List<BookVerse.Models.Book>> GetBorrowedBooksAsync()
        {
            string url = $"https://your-backend-api.com/books/borrowed";
            HttpResponseMessage response = await _httpClient.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<List<BookVerse.Models.Book>>(json); // Return the correct type
            }

            return new List<BookVerse.Models.Book>(); // Return an empty list if the request was not successful
        }

        public async Task<List<BookVerse.Models.Book>> GetReservedBooksAsync()
        {
            string url = $"https://your-backend-api.com/books/reserved";
            HttpResponseMessage response = await _httpClient.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<List<BookVerse.Models.Book>>(json); // Return the correct type
            }

            return new List<BookVerse.Models.Book>(); // Return an empty list if the request was not successful
        }
        public async Task TestApiResponseAsync()
        {
            var borrowedBooks = await GetBorrowedBooksAsync();
            var reservedBooks = await GetReservedBooksAsync();

            Console.WriteLine("Borrowed Books:");
            foreach (var book in borrowedBooks)
            {
                Console.WriteLine($"Title: {book.Title}, Author: {book.Author}");
            }

            Console.WriteLine("Reserved Books:");
            foreach (var book in reservedBooks)
            {
                Console.WriteLine($"Title: {book.Title}, Author: {book.Author}");
            }
        }
    }

    public class BookStatus
    {
        public bool IsBorrowed { get; set; }
        public bool IsReserved { get; set; }
    }
}
