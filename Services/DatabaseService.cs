using SQLite;
using System.Collections.Generic;
using System.Threading.Tasks;
using BookVerse.Models;

namespace BookVerse.Services
{
    public class DatabaseService
    {
        private readonly SQLiteAsyncConnection _database;

        public DatabaseService(string dbPath)
        {
            _database = new SQLiteAsyncConnection(dbPath);
            _database.CreateTableAsync<BookReservation>().Wait();
        }

        public Task<List<BookReservation>> GetBorrowedBooksAsync()
        {
            return _database.Table<BookReservation>()
                            .Where(b => b.IsBorrowed)
                            .ToListAsync();
        }

        public Task<List<BookReservation>> GetReservedBooksAsync()
        {
            return _database.Table<BookReservation>()
                            .Where(b => b.IsReserved)
                            .ToListAsync();
        }

        public Task<int> SaveReservationAsync(BookReservation reservation)
        {
            if (reservation.Id != 0)
            {
                return _database.UpdateAsync(reservation);
            }
            else
            {
                return _database.InsertAsync(reservation);
            }
        }

        public Task<int> DeleteReservationAsync(BookReservation reservation)
        {
            return _database.DeleteAsync(reservation);
        }
    }
}
