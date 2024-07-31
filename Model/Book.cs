using System;

namespace BookVerse.Model
{
    /// <summary>
    /// Represents a book in the library with relevant details.
    /// Contains attributes such as Title, Author, PublicationDate, ISBN, Genre, and CoverImageUrl.
    /// </summary>
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public DateTime PublicationDate { get; set; }
        public string ISBN { get; set; }
        public string Genre { get; set; }
        public string CoverImageUrl { get; set; }
    }
}