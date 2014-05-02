require 'sqlite3'

db = SQLite3::Database.new("ats.db")

ok = db.execute <<-SQL
  create table users(
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name  TEXT,
    last_name   TEXT,
    email       TEXT,
    location    TEXT,
    genre       TEXT,
    NFC         TEXT
  );
SQL
