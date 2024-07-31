
using System;


namespace BookVerse.Model
{
    /// <summary>
    /// Represents a library member with personal and contact details.
    /// Contains attributes such as Name, Email, MembershipDate, and PhoneNumber.
    /// </summary>
    public class Member
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public DateTime MembershipDate { get; set; }
        public string PhoneNumber { get; set; }
    }
}