using System;


namespace BookVerse.Models
{
    /// <summary>
    /// Represents a loan record of a book to a library member.
    /// Contains attributes such as BookId, MemberId, LoanDate, DueDate, and ReturnDate.
    /// </summary>
    public class BorrowModel
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public int MemberId { get; set; }
        public DateTime DueDate { get; set; }
        public DateTime? ReturnDate { get; set; }
    }
}