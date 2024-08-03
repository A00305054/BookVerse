
using System;

namespace BookVerse.Models
{
    /// <summary>
    /// Represents an author with biographical details and works.
    /// Contains attributes such as Name, BirthDate, Nationality, Biography, and ProfileImageUrl.
    /// </summary>
    public class Author
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime BirthDate { get; set; }
        public string Nationality { get; set; }
        public string Biography { get; set; }
        public string ProfileImageUrl { get; set; }
    }
}