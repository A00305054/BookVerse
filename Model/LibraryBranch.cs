using System;


namespace BookVerse.Model
{
    /// <summary>
    /// Represents a library branch with its details.
    /// Contains attributes such as Name, Location, ContactNumber, and OpeningHours.
    /// </summary>
    public class LibraryBranch
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string ContactNumber { get; set; }
        public string OpeningHours { get; set; }
    }
}