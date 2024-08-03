using System;


namespace BookVerse.Models
{
    /// <summary>
    /// Represents a librarian with personal and employment details.
    /// Contains attributes such as Name, EmployeeId, Email, and PhoneNumber.
    /// </summary>
    public class Librarian
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string EmployeeId { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
