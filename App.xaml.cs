﻿using BookVerse.Services;
namespace BookVerse
{
    public partial class App : Application
    {
        static DatabaseService _database;

        public static DatabaseService Database
        {
            get
            {
                if (_database == null)
                {
                    string dbPath = Path.Combine(FileSystem.AppDataDirectory, "BookVerse.db3");
                    _database = new DatabaseService(dbPath);
                }
                return _database;
            }
        }
        public App()
        {
            InitializeComponent();
            MainPage = new AppShell();
        }
    }
}
