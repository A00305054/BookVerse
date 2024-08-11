using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using BookVerse.Models;

namespace BookVerse.Services
{
    public class BookService
    {
        private readonly HttpClient _httpClient;

        public BookService()
        {
            _httpClient = new HttpClient();
        }

        public async Task<List<Book>> GetBooksAsync(string query)
        {
            string url = $"https://www.googleapis.com/books/v1/volumes?q={query}";
            HttpResponseMessage response = await _httpClient.GetAsync(url);
            var books = new List<Book>();

            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                JObject bookData = JObject.Parse(json);

                foreach (var item in bookData["items"])
                {
                    var book = new Book
                    {
                        Title = (string)item["volumeInfo"]["title"],
                        Author = string.Join(", ", item["volumeInfo"]["authors"]),
                        Description = (string)item["volumeInfo"]["description"],
                        Image = (string)item["volumeInfo"]["imageLinks"]["thumbnail"],
                        Rating = (string)item["volumeInfo"]["averageRating"],
                        ISBN = (string)item["volumeInfo"]["industryIdentifiers"]?.FirstOrDefault()?["identifier"]
                    };

                    books.Add(book);
                }
            }

            return books;
        }

        public async Task<Book> GetBookInfo(string isbn)
        {
            string url = $"https://www.googleapis.com/books/v1/volumes?q=isbn:{isbn}";
            HttpResponseMessage response = await _httpClient.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                JObject bookData = JObject.Parse(json);

                var book = new Book
                {
                    Title = (string)bookData["items"][0]["volumeInfo"]["title"],
                    Author = string.Join(", ", bookData["items"][0]["volumeInfo"]["authors"]),
                    Description = (string)bookData["items"][0]["volumeInfo"]["description"],
                    Image = (string)bookData["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"],
                    Rating = (string)bookData["items"][0]["volumeInfo"]["averageRating"],
                    ISBN = isbn // Use the ISBN provided
                };

                return book;
            }

            return null;
        }
    }
}
