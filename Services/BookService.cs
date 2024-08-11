using Newtonsoft.Json;
using System.Net.Http;
using System.Threading.Tasks;
using BookVerse.Models; // Ensure correct namespace is used

namespace BookVerse.Services
{
    public class BookService
    {
        private readonly HttpClient _httpClient;

        public BookService()
        {
            _httpClient = new HttpClient();
        }

        // Implement the GetBooksAsync method if not already implemented
        public async Task<List<BookVerse.Models.Book>> GetBooksAsync(string query)
        {
            string url = $"https://www.googleapis.com/books/v1/volumes?q={query}";
            HttpResponseMessage response = await _httpClient.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                var bookData = JsonConvert.DeserializeObject<dynamic>(json);

                var books = new List<BookVerse.Models.Book>();

                foreach (var item in bookData.items)
                {
                    var book = new BookVerse.Models.Book
                    {
                        Title = item.volumeInfo.title,
                        Author = string.Join(", ", item.volumeInfo.authors.ToObject<string[]>()),
                        Description = item.volumeInfo.description,
                        Image = item.volumeInfo.imageLinks?.thumbnail,
                        ISBN = item.volumeInfo.industryIdentifiers?.First?.identifier,
                        TotalPages = item.volumeInfo.pageCount
                    };
                    books.Add(book);
                }

                return books;
            }

            return new List<BookVerse.Models.Book>(); // Return an empty list if the request was not successful
        }

        // Implement the GetBookInfo method
        public async Task<BookVerse.Models.Book> GetBookInfo(string isbn)
        {
            string url = $"https://www.googleapis.com/books/v1/volumes?q=isbn:{isbn}";
            HttpResponseMessage response = await _httpClient.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                var bookData = JsonConvert.DeserializeObject<dynamic>(json);

                var book = new BookVerse.Models.Book
                {
                    Title = bookData.items[0].volumeInfo.title,
                    Author = string.Join(", ", bookData.items[0].volumeInfo.authors.ToObject<string[]>()),
                    Description = bookData.items[0].volumeInfo.description,
                    Image = bookData.items[0].volumeInfo.imageLinks?.thumbnail,
                    ISBN = bookData.items[0].volumeInfo.industryIdentifiers?.First?.identifier,
                    TotalPages = bookData.items[0].volumeInfo.pageCount
                };

                return book;
            }

            return null; // Return null if the request was not successful
        }
    }
}
