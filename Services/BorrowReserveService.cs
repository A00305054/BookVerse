using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using BookVerse.Models;

namespace BookVerse.Services
{
    public class BorrowReserveService
    {
        private readonly HttpClient _httpClient;

        public BorrowReserveService()
        {
            _httpClient = new HttpClient();
        }

        public async Task<List<Book>> GetBorrowedBooksAsync()
{
    string url = $"https://your-backend-api.com/books/borrowed";
    HttpResponseMessage response = await _httpClient.GetAsync(url);

    if (response.IsSuccessStatusCode)
    {
        string json = await response.Content.ReadAsStringAsync();
        var books = JsonConvert.DeserializeObject<List<Book>>(json);
        Console.WriteLine($"Fetched {books.Count} borrowed books."); // Log the count
        return books;
    }

    Console.WriteLine("Failed to fetch borrowed books."); // Log failure
    return new List<Book>();
}

public async Task<List<Book>> GetReservedBooksAsync()
{
    string url = $"https://your-backend-api.com/books/reserved";
    HttpResponseMessage response = await _httpClient.GetAsync(url);

    if (response.IsSuccessStatusCode)
    {
        string json = await response.Content.ReadAsStringAsync();
        var books = JsonConvert.DeserializeObject<List<Book>>(json);
        Console.WriteLine($"Fetched {books.Count} reserved books."); // Log the count
        return books;
    }

    Console.WriteLine("Failed to fetch reserved books."); // Log failure
    return new List<Book>();
}
    }
}
