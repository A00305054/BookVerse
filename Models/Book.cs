using System;

namespace BookVerse.Models
{
    /// <summary>
    /// Represents a book in the library with relevant details.
    /// Contains attributes such as Image, Title, and Rating.
    /// </summary>
    public class Book
    {
        public string Image { get; set; }
        public string Title { get; set; }
        public string Rating { get; set; }
    }
}