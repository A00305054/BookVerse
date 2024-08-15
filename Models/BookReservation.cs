using SQLite;

namespace BookVerse.Models
{
    public class BookReservation
    {
        [PrimaryKey, AutoIncrement]
        public int Id { get; set; }
        public string ISBN { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Description { get; set; }
        public bool IsBorrowed { get; set; }
        public bool IsReserved { get; set; }
    }
}
