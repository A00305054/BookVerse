using System;

namespace BookVerse.Models
{
    public class Book
    {
        public string ISBN { get; set; }
        public string Image { get; set; }
        public string Title { get; set; }
        public string Rating { get; set; }
        public string Author { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string TotalPages { get; set; }
        public bool IsBorrowed { get; set; } = true;  
        public bool IsReserved { get; set; } = false;  
    }
}